
//declare image & font names
PImage img;
PFont font1;
PFont font2;
PFont font3;
 
 
void setup() {
  //load image
  img = loadImage("babyart.jpg");
  size(600,600);
   //load fonts
  font1 = loadFont ("EccentricStd-48.vlw");
  font2 = loadFont ("Harrington-48.vlw");
  font3 = loadFont ("JazzLetPlain-48.vlw");
  //environment
  background(255);
  textAlign(CENTER);
  smooth();
}
 
//mouse moves with the text
void mouseMoved() {
  fill(8,255,249);
  textAlign(CENTER);
  textAlign(CENTER);
  textFont(font1);
  textSize(30);
  background(0);
  text("The box was pressed against Louis's face squashing his nose.", pmouseX,pmouseY);
}
 
//background load tree babies when you click
void mousePressed() {
  background(0);
  imageMode(CENTER);
  image(img,300,300);
  fill(255);
  textFont(font3);
  textSize(40);
  textAlign(LEFT);
  text("They were her specialty",50,500);
}


void mouseDragged() {
  textFont(font1);
  textSize(20);
  fill(255);
  stroke(0);
  text("Even so, when he reached the fifteenth floor, he could smell Miss Mush cooking in the cafeteria.", random(width),random(height));
  text("It smelled like she was making mushrooms.");
}
 
//release mouse
void mouseReleased() {
  textFont(font3);
  background(0);
  textSize(40);
  fill(0,255,151);
  String s = "Maybe on my way back I'll stop by Miss Mush's room and get some mushrooms, he thought. He didn't want to miss Miss Mush's mushrooms";
  text(s, 10, 30, 550, 600);
  fill(250,255,8);
  rect(200,550,20,70);
  fill(255,0,0);
  arc(210,550,98,80, -PI,0);
  fill(250,255,8);
  rect(310,550,20,70);
  fill(255,0,0);
  arc(320,550,98,80, -PI,0);
  fill(250,255,8);
  rect(410,550,20,70);
  fill(255,0,0);
  arc(420,550,98,80, -PI,0);
}


//call draw so that all events are listed for
void draw() {
   
}

