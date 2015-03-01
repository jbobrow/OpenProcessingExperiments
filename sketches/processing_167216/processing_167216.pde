
rint midax, miday;
int numfigures;
int estat=1;



void setup()
{
  size(700,700);
  numfigures = 20;
  midax = width/numfigures;
  miday = height/numfigures;
  ellipseMode(CORNER);
  noStroke();  
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;

}

void draw()
{
     if(estat == 2) {
     
       int nfigures=5;
       
    for (int j = 0; (j <= height/numfigures); j++)
    {
      for (int i = 0; i < height/numfigures; i++)
      {
        counter++;
        
        fill(random(255),100,255,50);
        
        rect(i*midax+10, j*miday+10, midax/2, miday/2);
        
        
        rect(i*midax+10, j*miday+10, midax/5, miday/5);
      }
    }
}

else {
    for(int j = 0; (j < height/numfigures); j++)
 {
   for (int i =0; i<=j; i++)
    {


     fill(100,0,0);
     ellipse(i*midax, j*miday, midax, miday);
     
     fill(0,0,0);
     ellipse(i*midax, j*miday, midax/6, miday/6);
     
     fill(0);
     ellipse(i*midax, j*miday, midax/2, miday/2);

   
    }
 }
}
}
    
void keyPressed()
{
  if (key == 'r')  estat = 2;
  else                    estat = 1;
}

