
class Creature {
  float razX, razY, razW, razH, z, xspeed, yspeed;
  color razColor;

  
//contructor
Creature (float tempRazX, float tempRazY, float tempXspeed, float tempYspeed, color tempRazColor)
{
  razX = tempRazX;      
  razY = tempRazY;
  xspeed = tempXspeed;
  yspeed = tempYspeed;
  razColor = tempRazColor;

}

void display (){
 
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  stroke(0);
  fill(175);
  ellipse(razX,razY,20,120);
  ellipse (razX, razY, 120, 20);

  stroke(0);
  //float w = random(0,255);
  
  /*float r = random (0,255);
  float g = random (0,255);
  float b = random (0,255);
  float a = random (0,100);*/
  fill(razColor);
  float z = random (10, 90);
  ellipse(razX,razY,z,z); 
   
   
  //blinkR = random(255);
  //blinkG = random(255);
  //blinkB = random(255);
  fill(razColor);
  
  ellipse(razX-19,razY-30,16,16); 
  ellipse(razX+19,razY-30,16,16);
  ellipse(razX-19, razY+30, 16,16);
  ellipse(razX+19, razY+30, 16,16);
  ellipse(razX, razY, 16,16);
  
  fill(0);
  ellipse(razX-65, razY, 10,10);
  ellipse(razX + 65,razY, 10,10);
  ellipse(razX, razY+65, 10,10);
  ellipse(razX, razY-65,10,10);
  
}

  
void paintCircles (){

  for (int x = 0; x< width; x = x+ 5)
  for (int y = 0; y< height; y = y + 5) {
  noStroke();
  
float r = random (0,255);
float g = random (0,255);
float b = random (0,255);
float a = random (0,255);
float x1 = random (0, 50);
float y1 = random (0, 25);
  fill (r,g,b,a);
  ellipse ( x, y, x1,y1);
    }
}

void drawRaz () {
  //moving & contatining Raz within window
  razX = razX + xspeed;
  razY = razY + yspeed;
  
  if ((razX > width) || (razX< 0)) {
    xspeed = xspeed * -1;
  }
    if ((razY >height || razY <0)) {
      yspeed = yspeed * -1;
    }
}
}



 

