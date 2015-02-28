
PImage bild;


void setup() {
  size(600, 400);
  smooth();

  bild = loadImage("box.jpg");
  //image(bild,0,0);
  frameRate(1000000);
  background(0);
}


void draw() {
    background(0);
  noStroke();
  float cs = 5+mouseX;

 

   for (int j = 0; j<height/cs+1;j++) { 
     for (int i = 0; i<width/cs+1 ; i++) {
       
      color c = bild.get(int(i*cs),int(j*cs));
       fill( brightness(c) );
       fill(random(255), random(255), 0);
     float  cs2 = brightness(c)/20.0;
      ellipse(i*cs, j*cs, cs2, cs2);
    }
  }
  
  if (key == 's') {
   saveFrame("bild.jpg"); 
  }
  
}



