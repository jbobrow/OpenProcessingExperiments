
int baggrundR = 255;
int baggrundG = 255;
int baggrundB = 255;
 
float cirkelX = 250;
float cirkelY = 250;
int cirkelz = 50;
 
int jump = 5;
 
float mCirkel = 0;
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
  ellipse(cirkelX,cirkelY,cirkelz,cirkelz);
   
  mCirkel = sqrt(((mouseX-cirkelX)*(mouseX-cirkelX))+((mouseY-cirkelY)*(mouseY-cirkelY)));
   
   
  if(mCirkel <= 25+jump)
  {
    cirkelX = random(25,475);
    cirkelY = random(25,475);
  }
   
  if(mCirkel <= 25){
     
    point++;
    jump++;
     
     
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
     
    //point system
    fill(0,0,0);
    textSize(32);
    text("POINT" + " " + point,20,40);
    noFill();
}


