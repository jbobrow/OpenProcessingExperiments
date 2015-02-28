

float angle1, angle2;
float directionX;
float startPointX;
float startPointY;
color fillColor;
//float fillColor;
float degree;

void setup(){
size(700,700);
smooth();
noStroke();
//fill(0);
directionX = 1;
startPointX = width/2;
startPointY = 0;
fillColor = 0;
degree = 0;

}

void draw(){
   //for(int i = 0; i <100; i++){
   // noFill();
   // ellipse(mouseX,mouseY,i*10, i*10);
  
    background(fillColor);

  if(mouseX < 250){
      fillColor=color(#4F6190);
    }else if (mouseX > 250 && mouseX < 500){
      fillColor=color(#A6B4D8);
    }else{
      fillColor=color(#5872FF);
      //noFill();
    }
  
float ang1 = radians(angle1);
float ang2 = radians(angle2);

  float x = startPointX + (cos(ang1) * 250.0);
  
  float y = startPointY + (sin(ang2) * 10.0);
  
  translate(width/2,height/2);
  rotate(degree);
  ellipse(x, y, 45, 80);
  degree ++;
  
  
fill(random(255), random(100, 150), 100);
  angle1 += 2;
  angle2 += 15;
  
  startPointY += .05;
  
  for(int i = 0;i < 250; i++){
    //fill(#B5CEC0,200);
    //noFill();
    ellipse(mouseX,mouseY,i,i);
  }
  
 
// if(startPointY > 100){
  // startPointY = 800;
// }
 
 
 
 
 
 
}


