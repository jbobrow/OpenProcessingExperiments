
/*
 #####################################
 ##           Evolution Sim         ##
 ##      Created by: Dr. Bacon      ##
 #####################################
 
 (2012/Nov)
 
 http://forum.processing.org/topic/why-won-t-this-code-work
 http://www.openprocessing.org/sketch/78545
 http://studio.processingtogether.com/sp/pad/export/ro.96-VhVDOO989P/latest
 
 This simulation was designed to simulate the
 basic ideas behind natural selection and
 outline them with organisms with a very simple genome.
 Once the simulation is run, there are no controls. One
 of the main flaws of this project is that there is no
 graphical user interface for fiddling with the starting
 values, and it must be tinkered with from within the code.
 Do with the code what you will.
 
 Also, thanks very much to Daniel Shiffman for providing me with Zoog,
 it strangely improves the way I feel about the whole sketch.
 */

// private static final short foodInterv = 3000;
// private static final byte  energyLvl  = 100;

private static final short bg = 0;
private static final short fg = 255;

private static final byte  foodSz = 12;

private static final byte  orgWd  = 32;
private static final byte  orgHg  = 88;
private static final byte  orgSpX = 6;
private static final byte  orgSpY = 3;

private static final byte  foodNum = 50;
private static final byte  orgNum  = 10;

private static final ArrayList<Food> food = new ArrayList();
private static final ArrayList<Organism> organism = new ArrayList();

final void setup() {

    size(700, 500);
    smooth();
    stroke(fg);
    frameRate(50);

    ellipseMode(CENTER);
    rectMode(CENTER);

    for (byte i=0; i<foodNum; ++i)
        food.add( new Food(foodSz, 10) );

    for (byte i=0; i<orgNum; ++i)
        organism.add( 
        new Organism( orgWd, orgHg, orgSpX, orgSpY, 100, 50, 1) );

    for (Food foodie  : food)     foodie.place();
    for (Organism org : organism)    org.place();
}

final void draw() {

    background(bg);

    for (Food foodie : food)
        foodie.display();

    for (Organism org : organism)
        org.all();
}

private final class Food {
    int x, y;
    int r;
    int hp;

    Food (int rad, int energy) {
        r  = rad;
        hp = (int) random(1, energy+1);
    }

    final void place() {
        x = (int) random(r, width  - r);
        y = (int) random(r, height - r);
    }

    final void display() {
        fill(fg);
        ellipse(x, y, r, r);
    }
}

private final class Organism {
    int x, y;
    int w, h;
    int xSpd, ySpd;
    int eLvl, eLvlReq, eSurv;

    Organism (
    int iWidth, int iHeight, int ixSpd, int iySpd, 
    int ieLvl, int ieReq, int ieSurv )
    {
        xSpd = (int) random(1, ixSpd+1) * ( random(2)<1 ? -1:1 );
        ySpd = (int) random(1, iySpd+1) * ( random(2)<1 ? -1:1 );

        w  = iWidth;
        h  = iHeight;

        eLvl = ieLvl;
        eLvlReq = ieReq;
        eSurv = ieSurv;
    }
    final void place() {
        x = (int) random( w, width  - w );
        y = (int) random( h, height - h );
    }

    final void display() {
        fill(128);
        rect(x, y, w/3, h/3); //Body

        fill(fg);
        ellipse(x, y - (h>>2), w*7 >> 3, w*7 >> 3); //Head

        fill(bg);
        ellipse(x - (w>>2), y - (h>>2), w/3, h/5); //Eyes
        ellipse(x + (w>>2), y - (h>>2), w/3, h/5);

        line(x - w/6, y + h/6, x - w/3, y + (h>>2)); //Legs
        line(x + w/6, y + h/6, x + w/3, y + (h>>2));
    }

    final void update() {
        if (x < (w>>1) || x > width  - (w>>1))    xSpd *= -1;
        if (y < h/2.4f || y > height - (h>>2))    ySpd *= -1;

        x += xSpd;
        y += ySpd;
    }

    final void all() {
        update();
        display();
    }
}
