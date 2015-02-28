
float xPos1;
float yPos1;
float xCon1;
float yCon1;
float xPos2;
float yPos2;
float xCon2;
float yCon2;

void setup() {
size(700,400);
smooth();
}

void draw() {
background(0);
fill(255);
ellipse(200,200, 120, 120);
ellipse(500,200, 120, 120);


if(dist(mouseX,mouseY,200,200)<=50){
  
//LEFT EYE (inside eyeball)
  fill(0,0,255);
  xPos1 = constrain(mouseX, 0, 700);
  yPos1 = constrain(mouseY, 0, 400);
  ellipse(xPos1, yPos1, 20, 20);
  
  //Right EYE (outside eyeball)
  xCon2 = (((mouseX-500)*50)/pow((pow(mouseX-500,2)+pow(mouseY-200,2)),.5))+500;
  yCon2 = (((mouseY-200)*50)/pow((pow(mouseX-500,2)+pow(mouseY-200,2)),.5))+200;
  
  xPos2 = constrain(mouseX, xCon2, xCon2);
  yPos2 = constrain(mouseY, yCon2, yCon2);
  
  fill(0,0,255);
  ellipse(xPos2, yPos2, 20, 20);
  
}

else if(dist(mouseX,mouseY,500,200)<=50){
  
  //RIGHT EYE (inside eyeball)
  fill(0,0,255);
  xPos2 = constrain(mouseX, 0, 700);
  yPos2 = constrain(mouseY, 0, 400);
  ellipse(xPos2, yPos2, 20, 20);
  
  //LEFT EYE (outside eyeball)
  xCon1 = (((mouseX-200)*50)/pow((pow(mouseX-200,2)+pow(mouseY-200,2)),.5))+200;
  yCon1 = (((mouseY-200)*50)/pow((pow(mouseX-200,2)+pow(mouseY-200,2)),.5))+200;
  
  xPos1 = constrain(mouseX, xCon1, xCon1);
  yPos1 = constrain(mouseY, yCon1, yCon1);
  
  fill(0,0,255);
  ellipse(xPos1, yPos1, 20, 20);
}

else{
  
//LEFT EYE (outside eyeball)
  xCon1 = (((mouseX-200)*50)/pow((pow(mouseX-200,2)+pow(mouseY-200,2)),.5))+200;
  yCon1 = (((mouseY-200)*50)/pow((pow(mouseX-200,2)+pow(mouseY-200,2)),.5))+200;
  
  xPos1 = constrain(mouseX, xCon1, xCon1);
  yPos1 = constrain(mouseY, yCon1, yCon1);
  
  fill(0,0,255);
  ellipse(xPos1, yPos1, 20, 20);
  
  
//Right EYE (outside eyeball)
  xCon2 = (((mouseX-500)*50)/pow((pow(mouseX-500,2)+pow(mouseY-200,2)),.5))+500;
  yCon2 = (((mouseY-200)*50)/pow((pow(mouseX-500,2)+pow(mouseY-200,2)),.5))+200;
  
  xPos2 = constrain(mouseX, xCon2, xCon2);
  yPos2 = constrain(mouseY, yCon2, yCon2);
  
  fill(0,0,255);
  ellipse(xPos2, yPos2, 20, 20);
}

if (mousePressed){
  background(0);
}
  
}

