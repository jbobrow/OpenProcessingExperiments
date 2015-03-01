
int modus = 0;

PImage Baer_oH;
PImage Baer_mH;
PImage Brille;
PImage Buch;

void setup ()
{
  size (500,333);
  Baer_oH = loadImage ("B1.png");
  Baer_mH = loadImage ("B2.png");
  Brille = loadImage ("B3.png");
  Buch = loadImage ("B4.png");
}
void draw ()
{
  noTint ();
  println (mouseY);
  image (Baer_mH,0,0);
  image (Brille,0,5);
  
  if (mousePressed == true && mouseX>70 &&mouseX<82 
      && mouseY > 256 && mouseY< 260)
      {
        tint (20);
        image (Baer_mH,0,0);
        image (Brille,0,5);
        //fill (0);
        //rect (0,0,502,335);
      }
  if (mousePressed == true && mouseX> 212 && mouseX <320
      && mouseY> 80 &&mouseY< 122)
      {            
         tint (255,0,0);
         image (Baer_mH,0,0);           
       }
          
   if (mousePressed == true && mouseY >270 && mouseY<320
       && mouseX>300 &&mouseX <4200)
       {             
             image (Baer_mH,0,0);
             image (Brille,0,5);
             image (Buch,6,0);
         }
  if (mousePressed == true && mouseX> 140 &&mouseX <207 
      && mouseY> 268 &&mouseY< 292)
      {
        fill (0);
        translate (270,150);
        filter(INVERT);
        scale (-1+millis()/10000.0);
        //rect (0,0,502,335);
        rotate (millis()/10.0);
        tint (0+random(255),0+random(255),0+random(255));
        image (Baer_oH,100,0,120,120); 
        image (Baer_oH,200,100,120,120);       
        image (Baer_oH,300,200,120,120);
        image (Baer_oH,400,300,120,120);
        image (Baer_oH,500,400,120,120);
        
          for (int i=0; i<360;i+=20)
  {
    pushMatrix();  
     noStroke ();  
    rotate (radians (i));
    fill (0+random(255),0+random(255),0+random(255));
    ellipse (100+sin(millis()/100.0+i)*10,0,10,10);
    float radius = 100+sin(millis()/100.0+i)*10;
    popMatrix();
  } 
      }

}


