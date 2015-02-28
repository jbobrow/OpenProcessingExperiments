
//Kris Qiaochu Li
//Introduction to Digital Media Fall 2012
//Section A
//sep 11

float randomDiameter = 30;  //global variable - float
float strokeRed = 100;  //global variable - float
float strokeGreen = 0;
float strokeBlue = 50;
// = : is assigned to
// == : conditional statement: is equal to
//  == returns a true/false statement


void setup() {
  size(1200, 600);
  background(0);
}

void draw() {
  //background(135,25); 
  //(gray, alpha) 
  //alpha: 0-transparant, 255-fully opaque)
  smooth();
  fill(255, 255, 0, 80);
  noStroke();
  ellipse(mouseX, mouseY, 6, 6);
  //ellipse(mouseX+20,mouseY+30,6,6);


  randomDiameter = random(100);
  //strokeWeight(randomDiameter);
  //stroke(randomDiameter,randomDiameter,randomDiameter);
  //noStroke();
  //fill(randomDiameter,randomDiameter,randomDiameter);
  if (randomDiameter<100) {
    randomDiameter = randomDiameter +20; //x=x+1
  }
  else {
    randomDiameter=0;
  }
}

void mouseClicked() {  
  //an interupt to the draw function
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
   if (strokeRed<255) { 
    strokeRed = strokeRed +50;     
  }
  else {   
    strokeRed = 150;    
  }

  if (strokeGreen<255) {
    strokeGreen = strokeGreen +20;
  }
  else {
    strokeGreen =150;
  }

  if (strokeBlue<50) {
    strokeBlue = strokeBlue +15;
  }
  else {
    strokeBlue = 0;
  }

  float a = 0.0;
  float inc = TWO_PI/75.0;

  for (int i = 0; i < 796; i=i+4) {

    //stroke(strokeRed,strokeRed,255-strokeRed,60);
    stroke(strokeRed, strokeGreen-50, strokeBlue, 50);
    strokeWeight(2);
    bezier(mouseX, mouseY, mouseX+cos(a)*randomDiameter, mouseY+sin(a)*randomDiameter, mouseX+cos(a)*randomDiameter, mouseY+sin(a)*randomDiameter, mouseX+cos(a)*randomDiameter*1.2, mouseY+sin(a)*randomDiameter+randomDiameter*.8);
    //stroke(strokeRed, strokeGreen, strokeBlue, 30);
    //bezier(mouseX+cos(a)*randomDiameter*1.2, mouseY+sin(a)*randomDiameter+50+1, mouseX+cos(a)*randomDiameter*1.3, mouseY+sin(a)*randomDiameter+80, mouseX+cos(a)*randomDiameter*1.3, mouseY+sin(a)*randomDiameter+80, mouseX+cos(a)*randomDiameter*1.4, mouseY+sin(a)*randomDiameter+120);
    //line(mouseX, mouseY, mouseX+cos(a)*100, mouseY+sin(a)*100);
    //line(mouseX+cos(a)*100, mouseY+sin(a)*100,mouseX+cos(a)*120, mouseY+sin(a)*100+50);
    a = a + inc;
  }
}

void keyPressed() {
  if (key == 's') {
    save("krisQiaochuLi2.png");
  }
}
