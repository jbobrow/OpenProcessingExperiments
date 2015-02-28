
float r = random(255);
float g = random(255);
float b = random(255);

float x;
float y;

 float xspeed = 5;
 float yspeed = 6;
 boolean edge = false; 

boolean value = true;

int maxsquares = 300;
Square[] squares = new Square[maxsquares];

int numofsquares = 0;

boolean squarefall = false;

void setup() {
  size(400, 400);
  background(0);
  randomSeed(0);
  frameRate(30);
}

void draw() {
  noFill();
  background(0);
  stroke(random(255), random(255), 0);

  //circles from diameter 100, in increments of 20, with the mouse position in the center
  for (int d = 100; d>0; d-=20) {
    ellipse(mouseX, mouseY, d, d);
  }
  
  if(squarefall) {
    boolean done = makeNewSquare();
  }
  // squares jump off the edges in random directions up to the number numsquares
  for( int i = 0; i< numofsquares;i++) {
    squares[i].moveSquare();
    squares[i].bounceSquare();
    squares[i].colorSquare();
   
  }
  //squares will be drawn until the numofsquares are reached
  for(int i = 0; i < numofsquares; i++){
    squares[i].drawSquare();
    
  } //see functions
  moveBall();
  bounceBall();
  drawBall();
  drawSplatters();
 
}
    
// if mouse is dragged, make scary face    
void mouseDragged(){
  background(0);
  noFill();
  // draws the eyebrows
  stroke(255,0,0);
  strokeWeight(5);
  line(40,20,180,80);
  line(360,20,220,80);
  smooth();
  //draws the left eye from my point of view
  beginShape();
  curveVertex(40,40);
  curveVertex(40,40);
  curveVertex(35,60);
  curveVertex(40,90);
  curveVertex(40,90);
  endShape();
  beginShape();
  curveVertex(40,90);
  curveVertex(40,90);
  curveVertex(100,95);
  curveVertex(170,90);
  curveVertex(170,90);
  endShape();
  beginShape();
  curveVertex(40,40);
  curveVertex(40,40);
  curveVertex(115,65);
  curveVertex(170,90);
  curveVertex(170,90);
  endShape();
  //draws the right eye from my point of view
  beginShape();
  curveVertex(360,40);
  curveVertex(360,40);
  curveVertex(365,60);
  curveVertex(360,90);
  curveVertex(360,90);
  endShape();
  beginShape();
  curveVertex(360,90);
  curveVertex(360,90);
  curveVertex(300,95);
  curveVertex(230,90);
  curveVertex(230,90);
  endShape();
  beginShape();
  curveVertex(230,90);
  curveVertex(230,90);
  curveVertex(275,65);
  curveVertex(360,40);
  curveVertex(360,40);
  endShape();
  //draws the bottom mouth
  beginShape();
  curveVertex(40,200);
  curveVertex(40,200);
  curveVertex(110,340);
  curveVertex(200,380);
  curveVertex(200,380);
  endShape();
  beginShape();
  curveVertex(200,380);
  curveVertex(200,380);
  curveVertex(290,340);
  curveVertex(360,200);
  curveVertex(360,200);
  endShape();
  //draws the top mouth
  beginShape();
  curveVertex(40,200);
  curveVertex(40,200);
  curveVertex(145,240);
  curveVertex(200,250);
  curveVertex(200,250);
  endShape();
  beginShape();
  curveVertex(200,250);
  curveVertex(200,250);
  curveVertex(255,240);
  curveVertex(360,200);
  curveVertex(360,200);
  endShape();
  //makes teeth!!
  line(70,215,110,300);
  line(110,300,145,240);
  line(145,240,173,300);
  line(173,300,200,250);
  line(200,250,227,300);
  line(227,300,255,240);
  line(255,240,277,300);
  line(277,300,330,215);
}
    
void mousePressed() {
  squarefall = true;
}

void mouseReleased() { 
  squarefall = false;
}
//make squares until reaches its max, then stops
boolean makeNewSquare() {
  if (numofsquares == maxsquares - 1) return false;
  //speed changes randomly
  float xrate = random(1, 5);
  float yrate = random(1, 5);

  if (random(10) > 5) {
    xrate *= -1;
  }
  if (random(10) >5) {
    yrate *= -1;
  }

  float w = 15 + random(10);
  float h = w;

  squares[numofsquares] = new Square(mouseX, mouseY -10, xrate, yrate, w, h);
  numofsquares++;

  return true;
}
//creates a class for squares
class Square {
  float x;
  float y;
  color c;
  float xrate;
  float yrate;
  boolean edge = false;
  float w;
  float h;
//elements for squares
  Square( float x_, float y_, float xrate_, float yrate_, float w_, float h_) {
    x=x_;
    y = y_;
    c= color(0,random(255),0);
    xrate = xrate_;
    yrate = yrate_;
    w = w_;
    h = h_;
  }
//draws the square
  void drawSquare() {
    fill(c);
    noStroke();
    rect(x, y, w, h);
  }
//colors the squares randomly
  void colorSquare() {
    float squareR, squareG, squareB;
    if (edge) {
      edge = false;
      if (random(10)>8) {
        squareR = random(255);
        squareG = random(180);
        squareB = random(255);
      }
    }
  }
//bounces the squares off the edges
  void bounceSquare() { 
    if (x> width || x < 0) {
      xrate = xrate* -1;
      edge = true;
    }

    if (y> height || y < 0) {

      yrate = yrate * -1;
      edge = true ;
    }
  }
//moves the squares in different directions
  void moveSquare() {
    x = x+xrate;
    y = y +yrate;
  }
}
//when a key is pressed, the background is reset to black
void keyPressed() {
  if(value == true) {
    background(0);
    numofsquares = 0;
  }
}
//moves the ball using speed
void moveBall() {
  x = x + xspeed;
  y = y + yspeed;
}
// bounce the ball off edges
void bounceBall() {
  if(x > width || x < 0) {
    xspeed = xspeed * -1;
    edge = true;
  }
  if(y > height || y < 0) {
    yspeed = yspeed * -1;
    edge = true;
  }
}
//draw ball
void drawBall() {
  fill(255,255,0);
  ellipse(x,y,20,20);
}
//creates light rectangles that change as the ball hits the quadrant
void drawSplatters() {
  noStroke();
  if(x< width/2 && y < height/2) {
    fill(0,0,255,80);
    rect(0,0, width/2,height/2);
  } else if (x > width/2 && y < height/2) {
    fill(255,0,0,80);
    rect(width/2,0,width,height/2);
  } else if(x<width/2 && y> height/2) {
    fill(0,255,0,80);
    rect(0,height/2,width/2,height); 
  } else if(x>width/2 && y>height/2) {
    fill(255,0,255,80);
    rect(width/2,height/2,width,height);}
}
 
  

