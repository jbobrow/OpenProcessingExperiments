
int baggrundR = 255;
int baggrundG = 255;
int baggrundB = 255;

float cirkelX = 250;
float cirkelY = 250;
int cirkelR = 50;

int hopAfstand = 5;

float musCirkel = 0;
int point = 0;

void setup()
{
  
  size(500,500);
  frameRate(60);
 
}


void draw()
{
   background(baggrundR,baggrundG,baggrundB);
  
  fill(0,0,0);
  ellipse(cirkelX,cirkelY,cirkelR,cirkelR);
  
  musCirkel = sqrt(((mouseX-cirkelX)*(mouseX-cirkelX))+((mouseY-cirkelY)*(mouseY-cirkelY)));
  
  
  if(musCirkel <= 25+hopAfstand)
  {
    cirkelX = random(25,475);
    cirkelY = random(25,475);
  }
  
  if(musCirkel <= 25){
    
    point++;
    hopAfstand++;
    
    
    /*baggrundR = 0;
    baggrundG = 0;
    baggrundB = 230; */
  }
  /*
  else
  {
    baggrundR = 255;
    baggrundG = 255;
    baggrundB = 255;
  }*/
    
    //point
    fill(0,0,0);
    textSize(32);
    text("POINT" + " " + point,20,40);
    noFill();
}


/*
void mouseClicked() {
 
  if (musCirkel <=25) {
    ellipse(cirkelX,cirkelY,cirkelR,cirkelR);
   point++;
  } 
  */


