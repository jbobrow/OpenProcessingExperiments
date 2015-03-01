
PImage[] myImageArray = new PImage[5];

void setup() {
  size(500,500);
  background(10,10,10);
  smooth();
}

void draw() { 
 imageMode (CENTER); 
  for (int i=0; i < myImageArray.length; i++) {
   myImageArray [0] = loadImage( "art.jpg");
   myImageArray [1] = loadImage( "c.jpg");
   myImageArray [2] = loadImage( "ME PROCESING.jpg");
   myImageArray [3] = loadImage( "ho.jpg");
   myImageArray [4] = loadImage( "SKB.jpg");
  }
}

void mousePressed(){
  imageMode(CENTER);
  image(myImageArray[(int)random(5)],width/2,height/2,width,height);
  image(myImageArray[(int)random(5)],width/2,height/2,width,height);
} 

 


