

float zaehler=0;
 
void setup()
{
  size(500,500);
 
  colorMode(HSB, 360,100,100);
  smooth();
  background (267,0,99);
   
}
 
void draw()
 
{
  background (267,0,99);
 float sinus = sin(zaehler);
  //zaehler +=0.1;
  
 float zaehler_maus = map(mouseX,0,width/2,0.01,0.2);
zaehler += zaehler_maus;
  float posi_re = map(sinus,-1,1,225,0); //sprung schwarz
  float posi = map(sinus,-1,1,25,height/2); //sprung weiß
  noStroke();
  fill(0);
  rect(0,height/2,width,height/2); 
  
fill(267,0,99);
ellipse (width/2,height/2+posi,50,50);

fill (0);
ellipse (width/2,posi_re,50,50);
  
  


}

