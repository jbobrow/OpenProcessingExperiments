
//-*- Mode: Java; c-basic-indent: 4; indent-tabs-mode: nil -*-
//SemiCircle Drift
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
    private int size;
    private float theta;
    private int lastm;
    private float rpm;

    ColorCircle(int size, float rpm){ //rotations per millisecond
        this.size = size;
        this.theta = 0;
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
        noStroke();
        fill(color(0x0,0x0,0xff));
        arc(0,0,size,size,0,PI);
        fill(color(0xff,0xff,0xff));
        arc(0,0,size,size,PI,TWO_PI);
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
        fill(color(0xA0,0xA0,0xA0));
        text(time,-200,200);
    }
}

ColorCircle [] createCircleArray(int num){
    final int MAX_SIZE = 400;
    final int SIZE_DEC = MAX_SIZE / num;
    int sz = MAX_SIZE;
    ColorCircle [] res = new ColorCircle[num];
    for (int i = 0; i < res.length; i++){
        int j = i+1;
        res[i] = new ColorCircle(sz, j * REV_PER_3MIN);
        sz -= SIZE_DEC;
    }
    return res;
}

ColorCircle [] circles;
Timer t;
void setup(){
    size(400,400);
    t = new Timer();
    circles = createCircleArray(50);
}

void draw(){
    background(0xff,0xff,0xff);
    translate(200,200); //move to the center of the screen
    for (int i = 0; i < circles.length; i++){
        circles[i].draw();
    }
    t.draw();
}


