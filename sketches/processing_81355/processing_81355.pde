
PImage img0;
//g is yvalue, - = growing plant
int g = 0; 
//int for water from can
int wx = 65;
int wy = 150;
float wxs = 0.5;
int wys = 3;
int wo= 255; 

PFont myFont;


void setup(){
  size(400,400);
  img0 = loadImage("2.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
  noCursor();
  myFont = createFont("BLANCH_CAPS.otf",50);
  textFont(myFont);
  textSize(35);
}

void draw(){
  image(img0, 0, 0, 400, 400);
  fill(20, 200, 125);
  noStroke();

  //PLANT
  ellipse(180, 260-g, 40, 40);
  ellipse(220, 260-g, 40, 40);
  triangle(140, 260-g, 175, 240-g, 175, 280-g);
  triangle(260, 260-g, 225, 240-g, 225, 280-g);

  stroke(255, 50);
  strokeWeight(2);
  line(170, 260-g, 230, 260-g);

  strokeWeight(5);
  stroke(20, 200, 125);
  line(200, 260-g, 200, 310);

  //GROUND
  noStroke();
  fill(150, 100, 50);
  arc(200, 330, 60, 60, -PI, 0);




  fill(255, wo);
  text ("D", mouseX-wx-5, mouseY+wy-105);
  text ("R", mouseX-wx-5, mouseY+wy-80);
  text ("I", mouseX-wx-3, mouseY+wy-55);
  text ("P", mouseX-wx-5, mouseY+wy-30);
  fill(190, 190, 255, wo);
  triangle(mouseX-wx, mouseY+wy-20, mouseX-10-wx, mouseY+wy-2, mouseX+10-wx, mouseY+wy-2);
  ellipse(mouseX-wx, mouseY+wy, 20, 20);
  wx += wxs;  
  wy += wys; 
  wo -=4; 
  if (mouseY+wy>330) {
    wy = 150;
    wx = 65;
    wo = 255;
  } 

  //WATERING CAN
  translate(mouseX, mouseY);
  rotate(QUARTER_PI);
  fill(225, 225, 225);
  stroke(225, 225, 225);
  strokeWeight(9);
  rect(0, 0, 50, 50);
  line(-5, 88, 49, 51);
  noFill();
  arc(25, 0, 50, 50, -PI, 0);
  noStroke(); 
  fill(255);
  ellipse(20, 17, 15, 15); 
  ellipse(20, 30, 15, 15); 
  triangle(23, 37, 23, 9, 38, 24);




  if (mouseX > 200 && mouseX < 330 && mouseY > 0 && mouseY < 200){
    g+=1; 
    if (g>200){
      g=200;
    }
  }
  else {
    g=0;

  }

}





