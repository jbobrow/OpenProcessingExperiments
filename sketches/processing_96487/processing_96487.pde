


PImage img;

void setup() {
  size (500, 500);
  background(255);

  img = loadImage("arch.jpg");
}


void draw () {

   
  
  int ladox;
  int ex =4;
ladox = (width -7*ex)/8;

  for (int i = 0; i<20; i++)
    for (int j = 0; j<20;j++)
    {
      rect(i*(ladox+ex), j*(ladox+ex), ladox, ladox);
      image (img,i*(ladox+ex),j*(ladox+ex),ladox,ladox);
      
      
    }
}



