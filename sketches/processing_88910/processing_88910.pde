

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PFont font;
void setup (){
  size (740,550);
  smooth();
  background (127,178,241);
  img1= loadImage("game character.svg");
  img2= loadImage("brown pickup.svg");
  img3= loadImage("blue car.svg");
  img4= loadImage("car mirror.svg");
  img5= loadImage("cellphone.svg");
  img6= loadImage("dashboard.svg");
  //img7= loadImage("green car.svg");
  img8= loadImage("red car.svg");
  //img9= loadImage("stop sign.svg");
 // img10= loadImage("street lamp.svg");
  img11= loadImage("traffic light.svg");
  img12= loadImage("tree.svg");
  img13= loadImage("white car.svg");
  //img14= loadImage("yield sign.svg");
  font=loadFont("Cabin-Medium-48.vlw");
}
void draw (){
  if(mousePressed)
  {
  image(img5,355,350,200,200);
  fill(0);
  textFont(font);
  textSize(10);
  textAlign(LEFT);
  text("Are you on your way?",373,400,100,200);
  }
  else {
    fill(0);
  line(0,110,600,110);
  image(img11,100,110,15,15);//traffic light
  fill(1,51,0);
  rect(0,150,750,350);
  fill(59,59,59);
  noStroke();
  image(img12,410,25,150,150);
  image(img12,430,25,200,200);
  image(img12,480,25,250,250);
  image(img12,540,25,300,300);
  beginShape();//road
   vertex(0,150);
   vertex(450,150);
   vertex(750,400);
   vertex(-300,700);
   endShape(CLOSE);//road
   fill(242,239,222);
   beginShape();//white wall right
   vertex(450,130);
   vertex(450,150);
   vertex(750,400);
   vertex(750,300);
   endShape(CLOSE);
   fill(255,204,0);
   beginShape();//yellow line
   vertex(230,150);//tl
   vertex(235,150);//tr
   vertex(-260,710);//br
   vertex(-300,700);//bl
   endShape(CLOSE);//yellow line
  image(img3,380,130,50,50);//blue
  image(img2,230,135,120,120);//brown
  image(img8,400,180,180,180);//red
  image(img13,120,210,300,300);//white
  fill(89,89,89);
  beginShape();
  vertex(0,400);
  vertex(50,70);
  vertex(60,50);
  vertex(650,50);
  vertex(660,70);
  vertex(740,400);
  vertex(740,0);
  vertex(0,0);
  endShape();
  rect(0,400,750,200);
  image(img6,-7,350,740,700);//dashboard
  image(img4,235,30,200,150);//mirror
  image(img1,10,10,50,50);
  image(img1,60,10,50,50);
  }
}


