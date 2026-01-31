/* SCUNK
 * Copyright (C) 2025 Mark Bauermeister
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

// Character costumes/animations
#include "bunbrush_anim.sch"
#include "turtle_anim.sch"

// Global rooms
// TODO: Clean up other scripts
#include "map.sch"

// The action verbs
verb Interact;

verb WalkTo;

verb UsedWith;
verb InventoryObject;

bit verbsOn,cursorOn,cursorLoaded;
int sntcVerb,sntcObjA,sntcObjADesc,sntcObjB,sntcObjBDesc;
int* invObj;

verb textBox;

// The sentence line
verb SntcLine;

// The inventory slots
verb invSlot0 @ 100, invSlot1 @ 101, invSlot2 @ 102, invSlot3 @ 103,
    invSlot4 @ 104, invSlot5 @ 105, invSlot6 @ 106, invSlot7 @ 107;

// The inventory arrows
verb invUp, invDown;
int invOffset;
#define INVENTORY_COL   2
#define INVENTORY_LINE  2
#define INVENTORY_SLOTS (INVENTORY_COL*INVENTORY_LINE)

// The verb colors
#define VERB_COLOR       104
#define VERB_HI_COLOR    10
#define VERB_DIM_COLOR   93
#define VERB_BACK_COLOR  53

// Object callbacks
verb Icon,Preposition,SetBoxes;

// Object class
class Openable,Pickable, Person, Interactable;

// Allow the objects to insert a word (like "to" or "with") between the
// verb and object in the sentence.
char *sntcPrepo;

// List of the objects used to handle action on actors
int  *actorObject;


// define actors
actor bunbrush;
#define BUNBRUSH_COLOR       15
#define BUNBRUSH_DIM_COLOR  232

actor turtle;
#define TURTLE_COLOR   214

actor inventory;

actor doorActor;

room ResRoom {

    // our standard charsets
    chset chtest;
    chset chset1;
    chset dialogCharset;
    chset imageChset;

    object inventoryPopup;
    object alert;

    script inputHandler(int area,int cmd, int btn);
    script keyboardHandler(int key);
    script inventoryHandler(int obj);
    script showCursor();
    script hideCursor();
    script mouseWatch();
    script defaultAction(int vrb, int objA, int objB);

    script quit();
    script loadObjects();
}

room CommonLib {
    script effect_scroll_left();
    script effect_scroll_right();
    script effect_screendoor();
    script effect_dissolve();
}