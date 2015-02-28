
//Assignment 4--line translations
//Yssa Badiola
//I don't know if you realized by now
//but my goal is to make every assignment based on
//Adventure Time with Fionna and Cake

PImage gumball;
PImage fionna;
PImage cake;
PImage sword;
PImage ruby;
PImage marshall;
PImage lee;
float x,y;
float dx,dy;
float easing;
int mode = 0;
PFont font;

void setup(){
  size(500,250);
  gumball = loadImage("princemouse.png");
  fionna = loadImage("fionna.png");
  cake = loadImage("cake.png");
  sword = loadImage("sword.png");
  ruby = loadImage("sword2.png");
  marshall = loadImage("marshall.png");
  lee = loadImage("lee.png");
  noStroke();
  x = 0;
  y = 0;
  easing = .05;
}

void draw(){
  background(255);
  color from = color(255,253,197);
  color to = color(255);
  color interA = lerpColor(from, to, .33);
  color interB = lerpColor(from, to, .66);
  fill(from);
  rect(0,0,width,height/4);
  fill(interA);
  rect(0,height/4,width,height/4);
  fill(interB);
  rect(0,height/2,width,height/4);
  fill(to);
  fill(0,125,width,height/4);
  textAlign(CENTER);
  fill(30);
  text("ADVENTURE TIME!",width/2,20);
  textSize(12);
  text("C'mon and grab your friends!",width/2,32);
  text("Go to very distant lands",width/2,44);
  text("With Cake the cat",width/2,56);
  text("and Fionna the human",width/2,68);
  text("the fun will never end",width/2,80);
  textSize(18);
  text("it's Adventure Time!",width/2,110);
  fill(0);
  noCursor();
  
  switch(mode){
    case 49:
    //P111
    translate(0,height/2);
    imageMode(CENTER);
    image(fionna,0,0);
    image(fionna,100,0);
    image(fionna,200,0);
    image(fionna,300,0);
    image(fionna,400,0);
    image(fionna,500,0);
    break;
    
    //P1M1
    case 50:
    translate(0,height/2);
    imageMode(CENTER);
    image(sword,0,0);
    image(sword,259,0);
    image(sword,518,0);
    break;
    
    //P112
    case 51:
    imageMode(CORNER);
    image(fionna,0,0);
    pushMatrix();
    translate(200,200);
    rotate(radians(180));
    image(fionna,0,0);
    popMatrix();
    image(fionna,200,0);
    pushMatrix();
    translate(400,200);
    rotate(radians(180));
    image(fionna,0,0);
    popMatrix();
    image(fionna,400,0);
    break;
    
    //P1G1
    case 52:
    image(marshall,0,0);
    image(lee,100,124);
    image(marshall,200,0);
    image(lee,300,124);
    image(marshall,400,0);
    break;
    
    //PMM2
    case 53:
    translate(0,height/2);
    imageMode(CENTER);
    image(ruby,0,0);
    pushMatrix();
    translate(150,0);
    rotate(radians(180));
    image(ruby,0,0);
    popMatrix();
    image(ruby,300,0);
    pushMatrix();
    translate(450,0);
    rotate(radians(180));
    image(ruby,0,0);
    popMatrix();
    break;
    
    //PM11
    case 54:
    translate(0,height/2);
    image(cake,0,0);
    image(cake,174,0);
    image(cake,348,0);
    image(cake,522,0);
    break;
    
    //PMG2
    case 55:
    translate(0,height/2);
    image(cake,0,0);
    pushMatrix();
    translate(174,0);
    rotate(radians(180));
    image(cake,0,0);
    popMatrix();
    image(cake,348,0);
    pushMatrix();
    translate(522,0);
    rotate(radians(180));
    image(cake,0,0);
    popMatrix();
    break;
  }

  
  //PRINCE GUMBALL!!!
  dx = mouseX - x;
  dy = mouseY - y;
  x = x + dx * easing;
  y = y + dy * easing;
  image(gumball,x,y);
}

void keyPressed(){
  mode = keyCode;
  println(mode);
}

//didn't use your code, Nick. Sorry!
/*I tried to put it in the void draw section, but since
it would play every frame, it would do funny things :6*/

