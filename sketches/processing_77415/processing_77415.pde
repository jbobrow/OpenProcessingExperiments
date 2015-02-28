
//global variables
int i;
int NUM_Bolts= 0;
int d= 20;
int MAX_NUM= 7;

//lighning bolt array
Bolt[] myBolt= new Bolt[MAX_NUM];

//raindrop array
Raindrop [] raindrops = new Raindrop[330];

void setup () {
  size (500, 500);
  smooth ();

  //initialize raindrops
  for (int i = 0; i<raindrops.length; i++) {
    raindrops[i] = new Raindrop(color(0, 255, 255), random(width), random(height), 1/20.0);
  }
}

void draw () {
  noStroke();
  background (140, 0, 255);

  //draw clouds
  noStroke ();
  fill(200);
  ellipse(0, 20, 500, 50);
  ellipse(500, 20, 500, 50);
  ellipse(250, 20, 500, 50);
  ellipse(150, 50, 250, 50);

  //draw ground
  fill (100, 200, 70);
  rectMode (CORNER);
  rect (0, 425, 500, 500);

  //loop for raindrop animation
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i].fall();
    raindrops[i].display();
  }

  //loop for lightening bolt animation
  for (int i = 0; i < MAX_NUM; i++) {
    if (myBolt[i] != null) {
      myBolt[i].step();
      myBolt[i].display();
    }
  }
} 

void mousePressed() {
  myBolt[NUM_Bolts]= new Bolt(mouseX, mouseY);
  NUM_Bolts= (NUM_Bolts + 1) % MAX_NUM;
  drawFlash ();
}

//lightning flash

void drawFlash () {
  background (255);
}

//create lightening bolt class
class Bolt {
  //variables
  int x;
  int y;
  int w;
  int h;
  // constructor
  Bolt (int xCoordinate, int yCoordinate) {
    x= xCoordinate;
    y= yCoordinate;
    w= 75;
    h=100;
  }
  //display lightning bolt
  void display() {
    noStroke();
    fill(242, 258, 6);

    beginShape();
    vertex(x, y);
    vertex(x+.5*w, y);
    vertex(x+.25*w, y+.45*h);
    vertex(x+.4*w, y+.45*h);
    vertex(x+.25*w, y+.8*h);
    vertex(x+.4*w, y+.8*h);
    vertex(x-.2*w, y+1.5*h);
    vertex(x-.15*w, y+.9*h);
    vertex(x-.3*w, y+.9*h);
    vertex(x-.15*w, y+.55*h);
    vertex(x-.3*w, y+.55*h);
    vertex(x, y);
    endShape(CLOSE);
  }
  //function to shoot lightning bolts
  void step() {
    if (x >=0) {
      x= x+1;
    }
    if (y >= 0) {
      y= y+1;
    }
  }
}


//create raindrop class
class Raindrop { 
  color c;
  float xpos;
  float ypos;
  float yspeed;

  //determine variables
  Raindrop(color c_, float xpos_, float ypos_, float yspeed_) {
    c=c_;
    xpos = xpos_;
    ypos = ypos_;
    yspeed = yspeed_;
  }

  //create raindrop
  void display () {
    ellipseMode(CENTER);
    fill(0, 255, 255);
    noStroke ();
    ellipse(xpos, ypos, 3, 25);
  }

  //make rain fall
  void fall() {
    ypos = ypos + yspeed*25;
    if (ypos > height ) {
      ypos = 55;
    }
  }
}
