
//CREDIT TO THE AUTHORS OF THE FOLLOWING SCRIPTS WHICH I HAVE ADAPTED AND LEARNED FROM:
//Circle Class + Arrays by Katherine Emma Ng - http://www.openprocessing.org/visuals/?visualID=27103
//Bouncing Ball Physics Engine II by Graham Strang - http://www.openprocessing.org/visuals/?visualID=22459
//Scrollbar from the Processing.org examples - http://processing.org/learning/topics/scrollbar.html
//Composite Objects from the Processing.org examples - http://processing.org/learning/basics/compositeobjects.html

import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
boolean pause = false;
boolean charizard=false;
boolean trashOver=false;
HScrollbar hs1;
HScrollbar hs2;
HScrollbar hs3;
HScrollbar hs4;
HScrollbar hs5;
HScrollbar hs6;
float scrollRad;
float leftmargin=160;

Species species1;

int selected;
int prevselected;
PImage a;  // Declare variable "a" of type PImage
PImage b;  // Declare variable "a" of type PImage
PImage c;  // Declare variable "a" of type PImage
PImage d;  // Declare variable "a" of type PImage
PImage e;  // Declare variable "a" of type PImage
PImage f;  // Declare variable "a" of type PImage
PImage g;  // Declare variable "a" of type PImage
PImage h;  // Declare variable "a" of type PImage

PImage backgroundImage;  

PFont font;
float previewRadius;
float previewX;
float previewY;


void setup() {
  size(640,400);
  species1 = new Species();

  // frameRate(100);
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "dna2.gif");
  loopingGif.loop();
  //background(0);

  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("Helvetica-12.vlw"); 
  textFont(font, 12); 

  backgroundImage = loadImage("background6.jpg");  // Load the image into the program  
  a = loadImage("images-02.png");  // Load the image into the program  
  b = loadImage("images-03.png");  // Load the image into the program  
  c = loadImage("images-04.png");  // Load the image into the program  
  d = loadImage("images-05.png");  // Load the image into the program  
  e = loadImage("images-06.png");  // Load the image into the program  
  f = loadImage("images-07.png");  // Load the image into the program  
  g = loadImage("images-08.png");  // Load the image into the program  
  h = loadImage("trashcanicon.png");  // Load the image into the program 
  smooth();
  noStroke();
  hs1 = new HScrollbar(50, 20, 100, 10, 3*5+1);
  hs2 = new HScrollbar(50, 40, 100, 10, 3*5+1);
  hs3 = new HScrollbar(50, 60, 100, 10, 3*5+1);
  hs4 = new HScrollbar(50, 80, 100, 10, 3*5+1);
  hs5 = new HScrollbar(50, 100, 100, 10, 3*5+1);
  hs6 = new HScrollbar(50, 120, 100, 10, 3*5+1);
}

void draw() {
  //background(0);
  fill(225); 
  rect(0,0,leftmargin,height);
  image(backgroundImage, leftmargin, 0); 
  //fill(255);
  image(a, 10, 5);   
  image(b, 10, 25);   
  image(c, 10, 45);   
  image(d, 10, 65);   
  image(e, 10, 85);
  image(f, 10, 105);
  image(g, leftmargin-60, previewY-previewRadius-20);
  image(h, width-25, height-26);
  //MENU BOXES
  fill(255,50); 
  stroke(0,33); 
  strokeWeight(1); 
  rect(10,151,140,60); 
  //rect(10,10,140,130);
  stroke(0,40);
  line(10,138,150,138);
  line(10,225,150,225);
  noStroke();
  image(loopingGif, 10, 143);

  hs1.update();
  hs1.display();
  hs2.update();
  hs2.display();
  hs3.update();
  hs3.display();
  hs4.update();
  hs4.display();
  hs5.update();
  hs5.display();
  hs6.update();
  hs6.display();

  species1.transmit();
  change();
  preview();
  dnaMove();
}

float rounder(float number, float decimal) {
  return (float)(round((number*pow(10, decimal))))/pow(10, decimal);
}

class Circle
{
  float radius=100;
  float r=128;
  float g=128;
  float b=128;
  float transparency=128;
  float bounce=-.5;
  int id;
  int unique;

  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean move=false;
  boolean show=true;


  Circle(int parent, int uni, float radius2, float r2, float g2, float b2, float transparency2, float bounce2) {
    id=parent;
    unique=uni;
    radius = radius2;
    r = r2;
    g = g2;
    b = b2;
    transparency=transparency2;
    bounce=bounce2;

    location = new PVector(random(leftmargin,width), random(0,height)); 
    velocity = new PVector(3,0); 
    acceleration = new PVector(0, .098);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(r,g,b,transparency);
    ellipse(location.x,location.y,radius*2,radius*2);
  }
  void move()
  {
    if(move==true && unique==selected) {
      if(mouseX < (radius+leftmargin)) { 
        location.x = radius+leftmargin;
      } 
      else { 
        location.x = mouseX;
      }
      location.y = mouseY;
      velocity.x = mouseX - pmouseX;
      velocity.y = mouseY - pmouseY;
    }
  }
  void checkEdges() {  

    if (location.x > width - radius) {
      velocity.x = velocity.x * bounce; //simulates bounce energy loss
      location.x = width-radius;
    }
    else if (location.x < (radius+leftmargin)) {
      velocity.x = velocity.x * bounce;
      location.x = radius+leftmargin;
    }

    if (location.y > height - radius) {
      velocity.y = velocity.y * bounce;
      velocity.x = velocity.x * .99; //this simulates ground friction
      location.y = height - radius;
    }
    else if (location.y < radius) {
      velocity.y = velocity.y * bounce;
      location.y = radius;
    }


    //This lets you "catch" and "throw" the ball.
    //dist(location.x, location.y, mouseX, mouseY);
    if(selected==unique) {
      if(dist(location.x, location.y, mouseX, mouseY) < radius) {
        if (mousePressed == true) { 
          move = true;
        }
      }
    }
    if (mousePressed != true) { 
      move=false;
    }
    move();
  }
}
void keyPressed() {
  if(key=='1') {
    selected=0;
    swap();
  }
  if(key=='2') {
    selected=1;
    swap();
  }
  if(key=='3') {
    selected=2;
    swap();
  }
  if(key=='4') {
    selected=3;
    swap();
  }
  if(key==' ') {
    wipe();
  }
}

void dnaMove() {
  if(hs1.over || hs2.over || hs3.over || hs4.over || hs5.over || hs6.over) {
    loopingGif.play();
  } 
  else { 
    loopingGif.pause();
  }
}

void mouseDragged() {
  if(species1.circles[selected].move==false) {
    select();
    change();
  }
}

void mouseReleased() {
  if(trashOver) {
    if(mouseX>width-27 && mouseX<width-9 && mouseY>height-26 && mouseY < height-9) {
      wipe();
    }
  }
  if(species1.circles[selected].move==false) {
    select();
  }
}



void select() {
  for (int i = 0; i < species1.circles.length; i++) {
    if(dist(mouseX,mouseY,species1.circles[i].location.x,species1.circles[i].location.y)<species1.circles[i].radius) {
      selected=i;
      print(species1.circles[selected].id);
    }
  }
}

void preview() {
  fill(species1.circles[selected].r,species1.circles[selected].g,species1.circles[selected].b,species1.circles[selected].transparency);
  previewRadius=((leftmargin-20)/2);
  previewX = leftmargin/2;
  previewY = height-previewRadius-10;
  ellipse((previewX),(previewY),previewRadius*2,previewRadius*2);
  fill(0);

  float previewScale = rounder(previewRadius/species1.circles[selected].radius,1);

  text(""+previewScale+"x", leftmargin-35, previewY-previewRadius);
}


void change() {
  if(dist(mouseX,mouseY,species1.circles[selected].location.x,species1.circles[selected].location.y)<species1.circles[selected].radius) {
    swap();
  }
  int wwx;
  for(wwx=0; wwx< species1.circles.length; wwx++) {
    if(species1.circles[wwx].id==species1.circles[selected].id) {
      species1.circles[wwx].radius=map(hs1.spos,hs1.xpos,100+hs1.xpos-(hs1.sheight),10,100);
      species1.circles[wwx].r=map(hs2.spos,hs2.xpos,100+hs2.xpos-(hs2.sheight),0,255);
      species1.circles[wwx].g=map(hs3.spos,hs3.xpos,100+hs3.xpos-(hs3.sheight),0,255);
      species1.circles[wwx].b=map(hs4.spos,hs4.xpos,100+hs4.xpos-(hs4.sheight),0,255);
      species1.circles[wwx].transparency=map(hs5.spos,hs5.xpos,100+hs5.xpos-(hs5.sheight),10,255);
      species1.circles[wwx].bounce=map(hs6.spos,hs6.xpos,100+hs6.xpos-(hs6.sheight),0,-1);
    }
  }
}


void swap() {
  int zx;
  for(zx=0; zx< species1.circles.length; zx++) {
    if(species1.circles[zx].id==species1.circles[selected].id) {
      hs1.spos=map(species1.circles[zx].radius,10,100,hs1.xpos,100+hs1.xpos-(hs1.sheight)); 
      hs1.newspos=map(species1.circles[zx].radius,10,100,hs1.xpos,100+hs1.xpos-(hs1.sheight));
      hs2.spos=map(species1.circles[zx].r,0,255,hs2.xpos,100+hs2.xpos-(hs2.sheight)); 
      hs2.newspos=map(species1.circles[zx].r,0,255,hs2.xpos,100+hs2.xpos-(hs2.sheight));
      hs3.spos=map(species1.circles[zx].g,0,255,hs3.xpos,100+hs3.xpos-(hs3.sheight)); 
      hs3.newspos=map(species1.circles[zx].g,0,255,hs3.xpos,100+hs3.xpos-(hs3.sheight));
      hs4.spos=map(species1.circles[zx].b,0,255,hs4.xpos,100+hs4.xpos-(hs4.sheight)); 
      hs4.newspos=map(species1.circles[zx].b,0,255,hs4.xpos,100+hs4.xpos-(hs4.sheight));
      hs5.spos=map(species1.circles[zx].transparency,10,255,hs5.xpos,100+hs5.xpos-(hs5.sheight)); 
      hs5.newspos=map(species1.circles[zx].transparency,10,255,hs5.xpos,100+hs5.xpos-(hs5.sheight));
      hs6.spos=map(species1.circles[zx].bounce,0,-1,hs6.xpos,100+hs6.xpos-(hs6.sheight)); 
      hs6.newspos=map(species1.circles[zx].bounce,0,-1,hs6.xpos,100+hs6.xpos-(hs6.sheight));
    }
  }
}



class Species {
  Circle [] circles = new Circle[4];

  Species() {
    for (int i = 0; i < circles.length; i++) {
      circles[i] = new Circle(i, i, random(10,90), 128,128,128,128,-.5);
    }
  }

  void transmit() {
    for (int i = 0; i < circles.length; i++) {
      if(circles[i].show) {
        circles[i].display();
        circles[i].update();
        circles[i].checkEdges();
      }
    }
  }
}



void idTest() { 
  charizard=false;
  int cake;
  for (cake=0; cake< species1.circles.length; cake++) {
    if(species1.circles[cake].id==species1.circles[selected].id) {
      if(dist(mouseX,mouseY,species1.circles[cake].location.x,species1.circles[cake].location.y)<species1.circles[selected].radius) {
        charizard = true;
      }
    }
  }
}
void mousePressed() {   
  if(mouseX>width-27 && mouseX<width-9 && mouseY>height-26 && mouseY < height-9) {
    trashOver=true;
  } 
  else { 
    trashOver=false;
  }
  if (mouseButton == RIGHT) {
    if(!trashOver) {
      idTest();
      if(!charizard) {
        //  Circle [] circles = new Circle[4]; 
        Circle Instance = new Circle(species1.circles[selected].id, species1.circles.length, species1.circles[selected].radius, species1.circles[selected].r, species1.circles[selected].g, species1.circles[selected].b, species1.circles[selected].transparency, species1.circles[selected].bounce);
        species1.circles = (Circle[]) append(species1.circles, Instance);
      }
    }
  }
}
void wipe() {
  if(selected>3) { 
    selected=0;
  }
  while(species1.circles.length>4) {
    int wip=species1.circles.length;
    species1.circles = (Circle[]) shorten(species1.circles); 
    print(species1.circles.length);
  }
}


