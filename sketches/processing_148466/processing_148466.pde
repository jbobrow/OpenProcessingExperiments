
PVector starship1loc = new PVector(400, 400);
PImage c;
PImage a;
PImage b;
PImage troll;
int drops = 0;


//Menu
int stage = 0;

//Text
int lifes = 2;
int hitscore = 0;
String s = "LIVES:" +lifes;
String score = "SCORE :" +hitscore;



FallingObject[] dropping = new FallingObject[3000];


void setup() {

  size(500, 500);

  a = loadImage("starship1.png");
  b = loadImage("RenderBackgroundPS.png");
  c = loadImage("Intromenu.png");
  troll = loadImage("Troll.png");


  dropping[0] = new FallingObject();
}


void draw() {

  if ( stage == 0) {

    image(c, 0, 0, 500, 500);

    if (keyPressed == true ) { //press key change menu
      stage = 2;
    }
  }
  if ( stage == 2 ) {

    image(b, 0, 0, 500, 500);
    image(a, starship1loc.x, starship1loc.y, a.width/8, a.height/8);


    fill(255);
    stroke(153);
    //   <-----
    // long ,x,short,y
    line(500, 470, 0, 470); 


    // Score and Lives
    fill(255);
    text(s, 10, 10, 70, 80); 
    text(score, 10, 480, 200, 200);
  }
  if (random(100) < 1 ) { //difficulty
    dropping[++drops] = new FallingObject();
  }
  for ( int i = 0 ; i < drops; i++ ) {
    dropping[i].fall(); // make the drop
  }

/*IF ASTEROID HIT STARSHIP LOC 
LIFE -- ; 
SCORE -200;

IF LASER LINE HIT THE OBJECT TROLL
SCORE + 500 ;
REMOVE IMAGE THAT IS HIT


*/




  if ( lifes == 0 ) {
    gameover();
  }
  if (keyPressed && key == CODED ) {

    if (keyCode == RIGHT) {
      if (starship1loc.x + 30 <= width  ) {
        starship1loc.x +=5;
      }
      println("RIGHT");
    }
    if ( keyCode == LEFT ) {
      if (starship1loc.x + 30 >= 0  ) {
        starship1loc.x -= 5;

        println("LEFT");
      }
    }
    if (keyCode == UP ) {
      println("UP");

      stroke(random(255), 0, 0);
      line(starship1loc.x + 31, starship1loc.y+10, 0, -25000 );
    }
  }
}

class FallingObject {
  float r = random(500); //loc rdm
  float y = 0; 


  void fall() {

    noFill();
    y = y + 1; //speed
    fill(53, 234, 0);
    image(troll, r, y, 30, 30);
  }
}

void gameover() {
  exit();
}




