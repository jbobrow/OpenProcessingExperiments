
//-*- Mode: Java; c-basic-indent: 4; indent-tabs-mode: nil -*-
//Incremental Drift
/* Copyright (c) 2008 Jeremy English <jhe@jeremyenglish.org>
*
* Permission to use, copy, modify, distribute, and sell this software and its
* documentation for any purpose is hereby granted without fee, provided that
* the above copyright notice appear in all copies and that both that
* copyright notice and this permission notice appear in supporting
* documentation.  No representations are made about the suitability of this
* software for any purpose.  It is provided "as is" without express or
* implied warranty.
*
* Created: 07-October-2008
*/

final float REV_PER_MIN = 0.000104719755;
final float REV_PER_3MIN = REV_PER_MIN/3;

class ColorCircle{
    private int x, y, size;
    private color c;
    private color complement;
    private float theta;
    private int lastm;
    private float rpm;

    ColorCircle(int x, int y, int size, color c, float rpm){ //rotations per millisecond
        this.size = size;
        this.c = c;
        this.x = x;
        this.y = y;
        this.complement = color((hue(c)+90)%360,100,100);
        this.theta = atan2(y,x);
        this.lastm = 0;
        this.rpm = rpm;
    }

    //Draw the current Circle
    void draw(){
        int m = millis(); //get the time since the program was started
        int diff = max(m - lastm, 0);
        lastm = m;
        theta +=  (rpm * diff);
        pushMatrix();
        rotate(theta);
        fill(c);
        stroke(complement);
        ellipse(x,y,size,size);
        popMatrix();
    }
}

String intStr(int n){
    String s = String.valueOf(n);
    return (n < 10) ? '0' + s : s;
}

class Timer{
    PFont font;
    Timer(){
        font = loadFont("ScalaSans-Caps-32.vlw");
    }
    void draw(){
        int s = second();
        int m = minute();
        int h = hour();
        String time = intStr(h) + ":" + intStr(m) + ":" + intStr(s);
        textFont(font);
        fill(color(0,0,50));
        text(time,-200,200);
    }
}

ColorCircle [] createCircleArray(int num){
    final int MAX_SIZE = 40;
    final int START_POS = 180;
    final int MAX_COLOR = 360;
    final int SIZE_DEC = MAX_SIZE / num;
    final int LOC_DEC = START_POS / num;
    final int COLOR_DEC = MAX_COLOR / num;
    int spos = START_POS;
    int sz = MAX_SIZE;
    int c  = MAX_COLOR;
    ColorCircle [] res = new ColorCircle[num];
    for (int i = 0; i < res.length; i++){
        int j = i+1;
        res[i] = new ColorCircle(spos,0,sz,color(c,100,100), j * REV_PER_3MIN);
        spos -= LOC_DEC;
        sz -= SIZE_DEC;
        c -= COLOR_DEC;
    }
    return res;
}

ColorCircle [] circles;
Timer t;
void setup(){
    size(400,400);
    colorMode(HSB,360,100,100);
    t = new Timer();
    circles = createCircleArray(20);
}

void draw(){
    background(0,0,0);
    translate(200,200); //move to the center of the screen
    for (int i = 0; i < circles.length; i++){
        circles[i].draw();
    }
    t.draw();
}


