





PImage type;
int x,y;


void setup()
{
  colorMode(HSB,360,100,100);
  size(900,900);
  smooth();
  

  
  //image should be black and white type:
  type = loadImage("type.png");
  background(45,50,100);
  strokeWeight(.8); //create thin, delicate lines
  
  //goes through 100000 iterations!
  for (int i = 0; i < 100000; i++){
     //get random x and y coordinates
     x = int(random(width));
     y = int(random(height));

     //gets the color values of the current pixel
     color cp = type.get(x,y);

     //determines their brightness
     float b = brightness(cp);

     //b == 0 is black
     //Checks for instances in which the chosen pixel is black
     if (b == 0){
        fill(200, 125, 45);
        float ellSize = random(5,10); //Random ellipse size between 5 and 30
        ellipse(x,y,ellSize,ellSize);
     }
  }
}

