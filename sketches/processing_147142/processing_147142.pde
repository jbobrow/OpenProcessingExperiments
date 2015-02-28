
//this is a color tweak of Octopuss by Daniel Wyllie

float cont2;
float h,directionh, speedh;  
float lite1,lite2;

void setup()
{
 // size(1280,720);
 size(600,400);
 frameRate(20);
 colorMode(HSB,360,100,100,100);   
 float h=15;
 float speedh = 1.0;
 float directionh = 1; 
}
 
void draw()
{   
h += speedh*directionh;                       
if(h>60){
speedh = -speedh;
}
if(h<15){
directionh = -directionh;
}  
   
  fill(0,0,0,1);//background
  rect(0,0,width,height);
  translate(width/2,height/2);
  for (int i =0; i<8; i++)
  {
    for (float cont=0; cont<PI; cont = cont + PI/60)
    {
        lite1 = 300-30*PI*cont;
        lite2 = 300-lite1;
        stroke(lite1,100,100,10);  //outline 
        fill(lite1,100,100,lite2); //change color,opacity
     ellipse(  
         mouseX/8.0*sin(cont2-6*cont),
         cont*height/PI,
         20+cont*30,20+cont*30); 
      ellipse(
         mouseX/8.0*sin(cont2-6*cont),
         cont*height/PI,
         4+cont*6,4+cont*6);
    }
     cont2 = cont2 + PI/240;
     rotate(TWO_PI/8);
     smooth();              
  }    
 println(frameCount);
 println(frameRate); 
}

 
  
