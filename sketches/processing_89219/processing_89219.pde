

PShape img1;
PShape img2;
PShape img3;
PShape img4;
PShape img5;
PShape img6;
PShape img7;
PShape img8;
PShape img9;
PShape img10;
PShape img11;
PShape img12;
PShape img13;
PShape img14;
PShape img15;
PFont font;
void setup (){
  size (740,550);
  smooth();
  background (127,178,241);
  img1= loadShape("game character.svg");
  img2= loadShape("brown pickup.svg");
  img3= loadShape("blue car.svg");
  img4= loadShape("car mirror.svg");
  img5= loadShape("cellphone.svg");
  img6= loadShape("dashboard.svg");
  //img7= loadImage("green car.svg");
  img8= loadShape("red car.svg");
  //img9= loadImage("stop sign.svg");
 // img10= loadImage("street lamp.svg");
  img11= loadShape("traffic light.svg");
  img12= loadShape("tree.svg");
  img13= loadShape("white car.svg");
  //img14= loadImage("yield sign.svg");
  font=loadFont("Cabin-Medium-48.vlw");
}
void draw (){
  if(mousePressed)
  {
  shape(img5,355,350,200,200);
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
  shape(img12,410,25,150,150);
  shape(img12,430,25,200,200);
  shape(img12,480,25,250,250);
  shape(img12,540,25,300,300);
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
  shape(img3,380,130,50,50);//blue
  shape(img2,230,135,120,120);//brown
  shape(img8,400,180,180,180);//red
  shape(img13,120,210,300,300);//white
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
  shape(img6,-7,350,740,700);//dashboard
  shape(img4,235,30,200,150);//mirror
  shape(img1,10,10,50,50);
  shape(img1,60,10,50,50);
  }
}


