
//Chris Jernigan 
// Homework 3: Trig Functions and Motion

void setup(){
size(600,600);
background(0);
smooth();
noStroke();
colorMode(HSB);
}

//controls amplitude
float scalar = 50;
float angle = 0;
float scalar2 = 150;


void draw(){
  //background changing color
  float ang1 = radians(angle);
  float fillColor = 150 + sin(ang1/20) * 60;
  fill(fillColor,255,55,20);
  noStroke();
  rect(0,0,width,height);
  

  
  
  //changes position of circle
  float xpos2 = sin(ang1/30) * scalar2;
  float ypos2 = cos(ang1/45) * scalar2;

  circleSpin(xpos2+300,ypos2+300);

  
}


//spinning circles!
void circleSpin(float x_Pos, float y_Pos){
  
 
  pushMatrix();
  translate(x_Pos,y_Pos);
  float ang1 = radians(angle);
  float ang2 = radians(angle);
  float colorAng = radians(angle);
  
  //changes circle colors
  float strokeColor = 120 + sin(ang2/50) * 60;
  
  float xpos = sin(ang1/21) * scalar*2;
  float ypos = cos(ang1/20) * scalar*2;
  
  //changes circles width+height
  float cWidth = sin(ang2/10) * scalar;
  float cHeight = sin(ang2/12) * scalar;
  
  angle+=33;
  
  
  fill(strokeColor,255,100,0);
  stroke(strokeColor,255,255);
  strokeWeight(1);
  
  //circle1
  ellipse(xpos,ypos,cHeight*5,cWidth*5);
  
  //circle2
  stroke(strokeColor-50,255,255,255);
  ellipse(xpos,ypos,cWidth*3,cHeight*3);

  //circle3
  stroke(strokeColor-80,255,255,255);
  ellipse(xpos,ypos,cos(ang2/7)*250,sin(ang2/8)*250);
  popMatrix();
}



