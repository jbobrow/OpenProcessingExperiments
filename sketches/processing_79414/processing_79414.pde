
PImage img;

void setup() {
  size(440, 551);
  smooth();

  img = loadImage ("GustavKlimt_DerKuss.jpg");
  
  frameRate (1000000);
  background (0);
}



void draw() {
  
  background (0);
  noStroke();
  float cs = 10;
  
   for (int j = 0; j<height/cs+1;j++) {
     for (int i = 0; i<width/cs+1 ; i++) {
      
      color c = img.get(int(i*cs),int(j*cs));
       fill(c);
     float  cs2 = saturation(c)/20;
     float b = blue (c)/ (5+mouseX);
     ellipse(i*cs, j*cs, cs2+b, cs2+b);
    }
  }
  
}


