
//Ralph Coburn - Collage (1965)

void setup() {
    size(640,640);
    background(0);
    noStroke();
    ellipseMode(RADIUS);
}
void tile(int ts, int tx, int ty, float ax, float ay, float bx, float by, float cx, float cy, color trico, color quadco) {
    pushMatrix();
        //Tile positioniing
        translate (ts * tx,ts * ty);

        //Tile background
        fill(quadco);
        rect(0, 0, ts, ts);

        //Tile foreground
        fill(trico);
        beginShape();
            vertex(ts * ax, ts * ay);
            vertex(ts * bx, ts * by);
            vertex(ts * cx, ts * cy);
        endShape(CLOSE);
    popMatrix();
}
void draw() {
    color gry = color (223,222,220);
    color bl = color (1,96,204);
    int tilesize = width/10;
    for (int n=0; n<4; n++) {
        //0,0 --> 3,0
        tile(tilesize, n, 0, 0, 1, 0.25 * (n + 1), 0, 0, 0, bl, gry);
        //4,0 --> 7,0
        tile(tilesize, n + 4, 0, 0, 1, 1, 0.25 * (n + 1), 1, 1, gry, bl);
        //8,0 --> 1,1
        tile(tilesize, (n + 8) % 10, int((n + 8) / 10), 0, 1, 0.25 * (n + 1), 0, 0, 0, gry, bl);
        //2,1 --> 5,1
        tile(tilesize, n + 2, 1, 0, 1, 1, 0.25 * (n + 1), 1, 1, bl, gry);
        //6,1 --> 9,1
        tile(tilesize, n + 6, 1, 1, 0, 0.25 * (3 - n), 1, 1, 1, bl, gry);
        //0,2 --> 3,2
        tile(tilesize, n, 2, 1, 0, 0, 0.25 * (3 - n), 0, 0, gry, bl);
        //4,2 --> 7,2
        tile(tilesize, n + 4, 2, 1, 0, 0.25 * (3 - n), 1, 1, 1, gry, bl);
        //8,2 --> 1,3
        tile(tilesize, (n + 8) % 10, int((n + 8) / 10) + 2, 1, 0, 0, 0.25 * (3 - n), 0, 0, bl, gry);
        //2,3 --> 5,3
        tile(tilesize, n + 2, 3, 0, 1, 0.25 * (n + 1), 0, 0, 0, bl, gry);
        //6,3 --> 9,3
        tile(tilesize, n + 6, 3, 0, 1, 1, 0.25 * (n + 1), 1, 1, gry, bl);
        //0,4 --> 3,4
        tile(tilesize, n, 4, 0, 1, 0.25 * (n + 1), 0, 0, 0, gry, bl);
        //4,4 --> 7,4
        tile(tilesize, n + 4, 4, 0, 1, 1, 0.25 * (n + 1), 1, 1, bl, gry);
        //8,4 --> 1,5
        tile(tilesize, (n + 8) % 10, int((n + 8) / 10) + 4, 1, 1, 0, 0.25 * (3 - n), 0, 1, bl, gry);
        //2,5 --> 5,5
        tile(tilesize, n + 2, 5, 1, 1, 0.25 * (n + 1), 0, 1, 0, gry, bl);
        //6,5 --> 9,5
        tile(tilesize, n + 6, 5, 0, 1, 0.25 * (n + 1), 0, 0, 0, gry, bl);
        //0,6 --> 3,6
        tile(tilesize, n, 6, 0, 1, 1, 0.25 * (n + 1), 1, 1, bl, gry);
        //4,6 --> 7,6
        tile(tilesize, n + 4, 6, 0, 0, 1, 0.25 * (n + 1), 1, 0, bl, gry);
        //8,6 --> 1,7
        tile(tilesize, (n + 8) % 10, int((n + 8) / 10) + 6, 0, 0, 0.25 * (3 - n), 1, 0, 1, gry, bl);
        //2,7 --> 5,7
        tile(tilesize, n + 2, 7, 1, 1, 0, 0.25 * (3 - n), 0, 1, gry, bl);
        //6,7 --> 9,7
        tile(tilesize, n + 6, 7, 1, 1, 0.25 * (n + 1), 0, 1, 0, bl, gry);
        //0,8 --> 3,8
        tile(tilesize, n, 8, 1, 1, 0, 0.25 * (3 - n), 0, 1, bl, gry);
        //4,8 --> 7,8
        tile(tilesize, n + 4, 8, 1, 1, 0.25 * (n + 1), 0, 1, 0, gry, bl);
        //2,9 --> 5,9
        tile(tilesize, n + 2, 9, 0, 0, 0.25 * (3 - n), 1, 0, 1, bl, gry);
        //6,9 --> 9,9
        tile(tilesize, n + 6, 9, 1, 0, 0.25 * (3 - n), 1, 1, 1, bl, gry);
    }
    //8,8 --> 1,9
    tile(tilesize, 8, 8, 1, 0, 0.75, 1, 1, 1, gry, bl);
    tile(tilesize, 9, 8, 1, 0, 0.5, 1, 1, 1, gry, bl);
    tile(tilesize, 0, 9, 0, 0, 1, 0.75, 1, 0, gry, bl);
    tile(tilesize, 1, 9, 0, 0, 1, 1, 0, 1, bl, gry);
}
