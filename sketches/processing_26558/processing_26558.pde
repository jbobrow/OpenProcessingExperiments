
void setup() {
    background (#2ea7c1);
    size (270,210);
}
 
void draw() {
    int s = second();
    int ss = s % 10;
    int st = (s - ss)/10;
    int m = minute();
    int ms = m % 10;
    int mt = (m - ms)/10;
    int h = hour();
    int hs = h % 10;
    int ht = (h - hs)/10;

    for (int i=3; i>=0; i--) {
        draw_a_block (48, 138, i, 0);
        if (ht >= pow(2,i))
            ht -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(50,140-(i*30),20,20);

        draw_a_block (78, 138, i, 1);
        if (hs >= pow(2,i))
            hs -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(80,140-(i*30),20,20);

        draw_a_block (108, 138, i, 2);
        if (mt >= pow(2,i))
            mt -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(110,140-(i*30),20,20);

        draw_a_block (138, 138, i, 3);
        if (ms >= pow(2,i))
            ms -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(140,140-(i*30),20,20);

        draw_a_block (168, 138, i, 4);
        if (st >= pow(2,i))
            st -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(170,140-(i*30),20,20);

        draw_a_block (198, 138, i, 5);
        if (ss >= pow(2,i))
            ss -= pow(2,i);
        else
            fill(#2ea7c1);
        rect(200,140-(i*30),20,20);
    }
}
void draw_a_block (int xstart, int ystart, int abit) {
    strokeWeight(2);
    noFill();
    stroke(255);
    rect(xstart,ystart-(abit*30),24,24);
    noStroke();
    fill(255);
}               
