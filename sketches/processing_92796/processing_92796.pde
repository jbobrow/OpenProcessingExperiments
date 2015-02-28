
import processing.xml.*;
import processing.opengl.*;

int popup = 0;
int selected = 0;
int[]counter = new int[10];

int read;
int ignored;
String rating;

int moving = 1;
int loading = 1;

//GLOBAL PHYSICS STUFF VARIABLES
float spring = .05;
float gravity = -0.06;
float friction = -0.9;
int offset = 90;

//TYPE VARIABLES
PFont sans;
PFont serif;
PFont bigserif;
PFont italic;

//FLYER VARIABLE
Flyer arrows;

//SHOOTING VARIABLES
int ammo = 400;
int shots=0;
int wait;
int waitlength=10;
Bullet[] bullets = new Bullet[ammo];
int hits;

//BALL VARIABLES
int sectioncount = 6;
int numBalls = 1000;
int totalballs = 6;
CatBall[] balls = new CatBall[numBalls];

String[]sections=new String[sectioncount];

String[][]titles = new String[sectioncount][10];
String[][]links = new String[sectioncount][10];
String[][]imgurls = new String[sectioncount][10];
PImage[][]imgs = new PImage[sectioncount][10];

color[]colors = new color[7];

//CONTROLS
boolean left;
boolean right;
boolean up;
boolean notup;
boolean fire;

//READING FILES
String[] lines;
int recordCount;

void setup() 
{
  //BASIC FILES
  size(1400, 900, OPENGL);
  //size(800, 600, OPENGL);
  noStroke();
  // smooth();

  //DECLARING FLYER
  arrows = new Flyer();

  sections[0]="Top Stories";
  sections[1]="World";
  sections[2]="US";
  sections[3]="Business";
  sections[4]="Sports";
  sections[5]="Opinion";

  colors[0]=#BDBDB0;
  colors[1]=#959A8F;
  colors[2]=#ABADB0;
  colors[3]=#809EAD;
  colors[4]=#DAD7C5;
  colors[5]=#B0A690;
  colors[6]=#FFFFFF;
  
  counter[0]=10;
    counter[1]=10;
      counter[2]=10;
        counter[3]=10;
          counter[4]=10;
            counter[5]=10;

  // LOADING INTIAL BALL
  for (int i = 0; i < numBalls; i++) {//for each ball
    if (i < totalballs) {
      balls[i] = new CatBall(random(width), random(height), i,balls);//create it
      balls[i].topic=i;
      balls[i].level=1;
      balls[i].title=sections[i];
    }
    else {
      balls[i] = new CatBall(random(width), random(height), i, balls);//create it
      balls[i].exist=false;
    }
  }

  //DECLARING TYPE
  serif = loadFont("Georgia-Bold-10.vlw");
  bigserif = loadFont("Georgia-48.vlw");
  italic = loadFont("Georgia-Italic-10.vlw");
  sans = loadFont("Arial-BoldMT-12.vlw");
}
int ind;
void draw() 
{
  if (read+ignored<1) {
    rating="try harder";
  }
  else if (read>ignored+2) {
    rating="nice start";
  }
  else if (read+5<ignored) {
    rating="you'd be better off just play real asteroids";
  }
  else {
    rating="keep it up";
  }
  bg();
  if (loading==1) {
    loadrss();
  }
  else {
    //GO THROUGH EVERY BALL
    for (int i = 0; i < numBalls; i++) {
      if (moving == 1) {
        balls[i].collide();
        balls[i].move();
      }
      else {
      }
      balls[i].display();
    }
    if(popup==1) {
      popup();
    }
    else {
    }
  }
  //DISPLAY FLYER
  arrows.fly();
  arrows.display();
  ind++;
  save("aster_"+ind+".jpg");
}


