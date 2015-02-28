
float baggrundR = 255;
float baggrundG = 255;
float baggrundB = 255;

float cirkelFR = 0;
float cirkelFG = 0;
float cirkelFB = 0;

float textFill = 255;
float textSize = 32;

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
  
 
  
  fill(cirkelFR,cirkelFG,cirkelFB);
  stroke(255,255,255);
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
    cirkelFR = random(0,255);
    cirkelFG = random(0,255);
    cirkelFB = random(0,255);
    textFill = 0;
    textSize = 36;
    
    
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
    fill(255,textFill,textFill);
    textSize(textSize);
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
