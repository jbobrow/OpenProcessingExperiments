
//Lincoln He
//

int phase;
PImage p;
PFont f1;
 

int[] data= {25,482,762};
int[] x = {260,360,150};
int[] y = {170,310,450}; 

void setup()
{
  size(600,600);
  
  textSize(26);
  
//  p = loadImage("cereal.jpg");
//  image(p,0,0);
}

void draw()
{
 f1=loadFont("Archive-48.vlw");
 textFont(f1,20);
 fill(0);
 p = loadImage("cereal.jpg");
 image(p,0,0);
 noStroke();
 ellipse(250,170,width*.03,width*.03);
 ellipse(350,310,width*.03,width*.03);
 ellipse(140,450,width*.03,width*.03);
 text("Dietgram",width*.4,height*.9); 
 checkMouse();

}

void checkMouse()
{
  pushStyle( );
  for ( int i = 0; i < data.length; i++)
  {
    if ( dist( mouseX, mouseY, x[i], y[i]) < 50)
    {
      
      text( data[i]+" calories",x[i],y[i]);  
     
    }
  }
  popStyle( );
}




