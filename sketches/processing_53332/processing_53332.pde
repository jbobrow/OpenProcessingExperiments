
PImage[] myImageArray = new PImage[10];

float angle = 0.0;

void setup() {
  size(500, 500);
  smooth();
  
  
   imageMode (CENTER); 
  for (int i=0; i < myImageArray.length; i++) {
   myImageArray [0] = loadImage( "bone.jpg");
   myImageArray [1] = loadImage( "btwo.jpg");
   myImageArray [2] = loadImage( "bthree.jpg");
   myImageArray [3] = loadImage( "bfour.jpg");
   myImageArray [4] = loadImage( "bfive.jpg");
   myImageArray [5] = loadImage( "bsix.jpg");
   myImageArray [6] = loadImage( "bseven.jpg");
   myImageArray [7] = loadImage( "beight.jpg");
   myImageArray [8] = loadImage( "bnine.jpg");
   myImageArray [9] = loadImage( "bten.jpg");
  }
  
}

void draw() {

  
tint(255, 150);

translate(width/2, height/2);
rotate(angle);


image(myImageArray[(int)random(10)],width/2,height/2);

angle += 0.1;


delay(200);
  
  
}

//void mousePressed(){
//  tint(255, 150);
//  image(myImageArray[(int)random(10)],width/2,height/2);
//  
//  //image(myImageArray[(int)random(10)],width/2,height/2);
//} 



