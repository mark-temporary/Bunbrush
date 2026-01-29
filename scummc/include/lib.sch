verb textBox;
char* textList;
// char* sentence;
int numText, numActiveDialog;

room CommonLib {
    script effect_scroll_left() {
        return 130;
    }
    script effect_scroll_right() {
        return 131;
    }
    script effect_scroll_up() {
        return 132;
    }
    script effect_scroll_down() {
        return 133;
    }
    script effect_dissolve() {
        return 134;
    }
    script effect_screendoor() {
        return 135;
    }
    script textAdd(char* str) {
        if(numText >= 100) {
            dbgPrint("Too many sentences, can't add another one.");
            return;
        }
        unless(textList)
            dimInt(textList,100);
        textList[numText] = str[0];
        numText++;
        if(str) numActiveDialog++;
    }
    script TextBox(char* str, int x, int y) {
        // str = 0;
        // str[0] = str;
        // printAt(x, y);
        // print("%s{str[0]}");
        
        drawBox(x + 4, y, x - 80, y + 100, 10);
        drawBox(x + 2, y, x - 80, y + 100, 11);
        drawBox(x, y, x - 90, y + 100, 120);
        // drawBox(x - 60, y + 70, x - 100, y + 90, 95);
        
        setCurrentVerb(textBox);
        initVerb();

        // sentence = 0;
        // sentence[0] = "TEST";

        textAdd(str);
        setVerbNameString(str);
        setVerbXY(x, y);
        setVerbColor(93);
        verbCenter();
        setVerbOn();
        redrawVerb();
    }
}
