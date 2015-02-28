
int husX = 230;
int husY = 150;
int husWidth = 200;
int husHeight = 200;

int grasX = 0;
int grasY = 350;
int grasWidth = 500;
int grasHeight = 500;

int tag1X = 230;
int tag1Y = 150;

int move = 0;

void setup(){
size(500,500);
background(65,69,247);
}

void draw(){
noStroke();
background(65,69,247);
move = move + 1;

//hus
fill(175,14,28);
rect(husX,husY,husWidth,husHeight);

// græs
fill(24,175,14);
rect(grasX,grasY,grasWidth,grasHeight);

// tag
fill(0,0,0);
triangle(150+80,150,250+80,60,350+80,150);

stroke(0,0,0);

// dør
fill(103,28,7);
rect(300,210,80,139);

// hoved
fill(216,127,68);
ellipse(move,225,40,40);

// krop
line(move,245,move,320);

// arme
line(move,250,move+20,285);
line(move,250,move-20,285);

// ben
line(move,320,move+20,355);
line(move,320,move-20,355);

}
