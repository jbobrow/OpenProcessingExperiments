
PImage img0;
//g is yvalue, - = growing plant
int g = 0; 
//int for water from can
int wx = 65;
int wy = 65;

float wxs = 0.5;
int wys = 3;

int wo = 155;


void setup(){
  size(400,400);
  img0 = loadImage("2.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
  noCursor();
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
  




  fill(100, 100, 200, wo);
  ellipse(mouseX-wx, mouseY+wy, 20, 20);
  wx += wxs;  
  wy += wys; 
  if (mouseY+wy>320) {
    wy=65;
    wx = 65;
    wo = 200;
  } if (wy>300){
     wo -= 5;
  }




  //WATERING CAN
  translate(mouseX, mouseY);
  rotate(QUARTER_PI);
  fill(225, 225, 225);
  stroke(225, 225, 225);
  strokeWeight(9);
  rect(0, 0, 50, 50);
  line(0, 95, 49, 51);
  noFill();
  arc(25, 0, 50, 50, -PI, 0);  

  


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


