
/*

Railway Station Clock
~~~~~~~~~~~~~~~~~~~~~
by Jaap Steilberg http://steilberg.eu

05-Oct-2009 Updated with steam engine sound

A mouse click on one of the digits of the clockface schedules a train. works like an alarm.
A click outside the clock cancels a train.
Click the spindle of the clock to control clock ticking.
Press SPACEBAR to stop all sounds, 'T' for sound test and
'S' to enter a rail strike.

keywords: sound, clock, railway, station, train.

Credits:
Sound samples for the clock:  http://www.soundjay.com
Steam engine: 45407 departing from York. 20th March 2003  http://www.steamsoundsarchive.com

*/

//__________________________________________________________________

int clockTick, running, mTrain, intro, oldSec;

int[]X1=new int[120];
int[]Y1=new int[120];
int[]X2=new int[120];
int[]Y2=new int[120];

import ddf.minim.*;

Minim minim;
AudioPlayer song1;
AudioSample sample1, sample2;
AudioSnippet snip1, snip2;
PFont font;

//__________________________________________________________________

void Circle(int r)
{
    ellipse(0, 0, r*2, r*2);
}
//__________________________________________________________________

void SetXandYDP(int Div1, int Div2)
{
// this code was ported from C written for a system with no floating point unit!

    int i;
    int[]arr=
    {
        // 0.5 minute:  sin 3 * 10000 =  523
        0, 523, 1045, 1564, 2079, 2588, 3090, 3583, 4067, 4539,
        5000, 5446, 5877, 6293, 6691, 7071, 7431, 7771, 8090, 8387,
        8660, 8910, 9135, 9336, 9510, 9659, 9781, 9877, 9945, 9986, 10000
    };

    for (i=0; i<30; i++)
    {
        X1[i]=Y1[i+30]=arr[i]/Div1;
        X1[i+30]=Y1[i+60]=arr[30-i]/Div1;
        X1[i+60]=Y1[i+90]=-arr[i]/Div1;
        X1[i+90]=Y1[i]=-arr[30-i]/Div1;

        X2[i]=Y2[i+30]=arr[i]/Div2;
        X2[i+30]=Y2[i+60]=arr[30-i]/Div2;
        X2[i+60]=Y2[i+90]=-arr[i]/Div2;
        X2[i+90]=Y2[i]=-arr[30-i]/Div2;
    }
}

//__________________________________________________________________

void Train()
{
    song1.close();
    song1=minim.loadFile("steam.mp3");
    song1.play();
    frameRate(10);
}

//__________________________________________________________________

void setup()
{
    size(360, 360, P3D);
    running=1;
    clockTick=0;
    oldSec=-1;
    mTrain=-1;
    intro=0;

    smooth();
    background(160, 160, 255);

    minim=new Minim(this);
    sample1=minim.loadSample("handbag-lock-3.mp3");
    sample2=minim.loadSample("briefcase-lock-8.mp3");
    song1=minim.loadFile("steam.mp3");
}

//__________________________________________________________________

void draw()
{
    int i=0, h, m, s, sh;

    h=hour(); if (h>11) h-=12;
    m=minute();
    s=second();

    if (running==0) h=m=s=0;

    // clock sounds
    if (clockTick==1 && oldSec!=s && oldSec!=-1)
    {
        sample1.trigger();
        if (s==0) sample2.trigger();

    }
    oldSec=s;
    if (intro==0)
    {
        Train();
        intro=1;
    }

    if (m==mTrain && s==0)
    {
        mTrain=-1;
        Train();
    }
    h=(h%12*60+m)/6;

    translate(width/2, height/2);

    // case 1
    strokeWeight(13);
    stroke(0);
    fill(255);
    Circle(139);

    stroke(200);
    sh=2;

    // spindle shadow
    strokeWeight(0);
    fill(200);
    ellipse(sh, sh, 2*16, 2*16);

    // hour hand shadow
    strokeWeight(18);
    SetXandYDP(145, -350);
    line(X1[h]+sh, Y1[h]+sh, X2[h]+sh, Y2[h]+sh);

    // minute hand shadow
    sh=4;
    strokeWeight(12);
    SetXandYDP(77, -300);
    line(X1[m*2]+sh, Y1[m*2]+sh, X2[m*2]+sh, Y2[m*2]+sh);

    // second hand shadow
    sh=6;
    strokeWeight(6);

    SetXandYDP(77, 95);    // --O-----------.--
    line(X1[s*2]+sh, Y1[s*2]+sh, X2[s*2]+sh, Y2[s*2]+sh);

    SetXandYDP(120, -270);
    line(X1[s*2]+sh, Y1[s*2]+sh, X2[s*2]+sh, Y2[s*2]+sh);

    fill(200, 0);
    SetXandYDP(107, 107);
    ellipse(X1[s*2]+sh, Y1[s*2]+sh, 23, 23);
    ellipse(X1[s*2]+sh, Y1[s*2]+sh, 22, 22);


    // minute digits
    stroke(0);
    strokeWeight(5);
    SetXandYDP(77, 85);
    for (i=0; i<120; i+=2) {line(X1[i], Y1[i], X2[i], Y2[i]);}

    // 5 minute digits
    strokeWeight(10);
    SetXandYDP(77, 110);
    for (i=0; i<120; i+=10) {line(X1[i], Y1[i], X2[i], Y2[i]);}

    // hour hand
    stroke(0);
    strokeWeight(18);
    SetXandYDP(145, -350);
    line(X1[h], Y1[h], X2[h], Y2[h]);

    // hour hand spindle
    strokeWeight(0);
    stroke(0);
    fill(0);
    Circle(16);

    // minute hand
    strokeWeight(12);
    stroke(0);
    SetXandYDP(77, -300);
    line(X1[m*2], Y1[m*2], X2[m*2], Y2[m*2]);

    // second hand spindle
    strokeWeight(0);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    Circle(8);
    Circle(6);

    // second hand
    strokeWeight(6);
    stroke(255, 0, 0);

    SetXandYDP(77, 95);    // --O----------.--
    line(X1[s*2], Y1[s*2], X2[s*2], Y2[s*2]);

    SetXandYDP(120, -270);
    line(X1[s*2], Y1[s*2], X2[s*2], Y2[s*2]);

    fill(255, 0, 0, 0);
    SetXandYDP(107, 107);
    ellipse(X1[s*2], Y1[s*2], 23, 23);
    ellipse(X1[s*2], Y1[s*2], 22, 22);

    // case 2
    strokeWeight(13);
    stroke(0);
    fill(0, 0);
    Circle(139);

    SetXandYDP(69, 74);

    // green arc
    if (mTrain>-1)
    {
        strokeWeight(2);
        stroke(100, 255, 100);
        fill(0, 0);
        Circle(139);

        strokeWeight(16);
        stroke(0);
        for (i=0; i<60; i++)
        {
            if (m!=mTrain)
            {
                if (m<mTrain && (i>=m && i<mTrain)) continue;
                if (m>=mTrain && (i>=m || i<mTrain)) continue;
            }
            line(X1[i*2], Y1[i*2], X2[i*2], Y2[i*2]);
        }

        // mark train time
        strokeWeight(12);
        stroke(100, 255, 100);
        line(X1[mTrain*2], Y1[mTrain*2], X2[mTrain*2], Y2[mTrain*2]);
    }
}

//__________________________________________________________________

void keyPressed()
{
    // stop all sound
    if (key==' ')
    {
        mTrain=-1; song1.pause();
        clockTick=0;
    }

    // railway strike
    if (key=='s' || key=='S')
    {
        if (running==1)
        {
            mTrain=-1;
            redraw();
            running=0;
            frameRate(1);
        }
        else
        {
            clockTick=1;
            running=1;
            frameRate(10);
        }
    }

    // test
    if (key=='t' || key=='T') Train();
}
//__________________________________________________________________

void mousePressed()
{
    int minuteI;
    float at=0;
    float minuteF, x1, y1;

    running=1;
    frameRate(10);

    x1=mouseX-width/2;
    y1=mouseY-height/2;

    // click center to control clock tick
    if (abs(x1*x1+y1*y1)<90 *90) clockTick^=1;

    // click outside for cancel
    else if (abs(x1*x1+y1*y1)>145*145)
    {mTrain=-1; song1.pause(); }

    else if (running==1)
    {
        if (x1==0 && y1<0)
            mTrain=0;
        else if (x1==0)
            mTrain=30;
        else
        {
            minuteF=atan(-y1/x1)*30.0/PI;
            // rounding float to int just between the minutes
            minuteI=(minuteF>0) ? (int)(minuteF+0.5) : (int)(minuteF-0.5);
            mTrain=2*60-minuteI-15;
            if (x1>0) mTrain+=30;
        }
        mTrain=mTrain%60;
        if (mTrain==minute())
           mTrain=-1;

        song1.pause();
    }
}

//__________________________________________________________________

void stop()
{
    song1.close();
    sample1.close();
    sample2.close();
    minim.stop();
    super.stop();
}






