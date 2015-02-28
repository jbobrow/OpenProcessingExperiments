
int numPetalos = 15;
int i=1;
int iColorR = 1;
int iColorG = 1;
int iColorB = 1;
float incrementoR = 1;
float incrementoG = 2;
float incrementoB = 6;
int miAlpha = 10;

void setup(){
  size(1024, 1024, P3D);
  stroke(100,100,100);
  background(0,0,0);
  fill(200,30,120,50);
  //noFill();
}

void draw(){

  translate(width/2, height/2);
  scale(0.05*i/5);

  rotate(TWO_PI/(numPetalos+5)*i);
  ellipse(50,75,50,200);
  fill(155-(iColorR*155/255),30-(iColorG*30/255),180-(iColorB*180/255), miAlpha);
  //delay(500);

  if(iColorR >= 255 || iColorR <= 0)     incrementoR = incrementoR*(-1);
  if(iColorG >= 255 || iColorG <= 0)     incrementoG = incrementoG*(-1);
  if(iColorB >= 255 || iColorB <= 0)     incrementoB = incrementoB*(-1);

  iColorR += incrementoR;
  iColorG += incrementoG;
  iColorB += incrementoB;  
  i++;
  
  
  
  
}


  void keyPressed()
{
  if ( key == '+' ) 
  {
    saveFrame("Mantrix"+ i + ".png");
  }
}

