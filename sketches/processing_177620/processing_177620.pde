
int modus = 0;
float high = 1;
float counter = 0;
float random;
PImage Kaugummiautomat;
PImage Kaugummi; 

void setup()
{
  size(500, 500);
  Kaugummiautomat = loadImage("Kaugummiautomat.JPG");
  Kaugummi = loadImage("Kaugummi.png");
}

void draw()
{
  noTint();
  background(255);
  translate(0, 0);

  
  image(Kaugummiautomat, 0, 0);
  counter += 0.01;
  if (modus == 1)
  {
    
    pushMatrix();
    translate(0, 0);
    image(Kaugummi, 0, 0);
   
    popMatrix();
    
    
  } else if (modus == 2)
  {
    pushMatrix();
    translate(0, 0);
    tint(0, 153, 204);
    image(Kaugummi, 0, 0);
    popMatrix();
  }

}





void mousePressed()
{

  if (modus == 0)
  {
    modus = 1;
  } else if (modus == 1)
  {
    modus = 2;
  }
  
 
 
}



