
PImage photo_1;
PImage photo_2;
PImage photo_3;
PImage photo_4;
PImage photo_5;
PImage photo_6;

  
void setup() {
  smooth();
  size(500,500);
  colorMode(HSB, 210, 100, 100);
   
  imageMode(CENTER);
  //IMAGES_run through them
  frameRate(10);
  photo_1 = loadImage("S6.jpeg");
  photo_2 = loadImage("S2.jpeg");
  photo_3 = loadImage("S1.jpeg");
  photo_4 = loadImage("S4.jpeg");
  photo_5 = loadImage("S5.jpeg");
  photo_6 = loadImage("S3.jpeg");
  
   

  
   
   
}
   
void draw() {
   
  //color map for background so its not boring
  float r = map(mouseX, 0, width, 210,27); 
  float g = map(mouseX, 0, width, 30,22);
  float b = map(mouseX, 0, width, 20,216);
  background(r,g,b);
   
   
 
  float a = random (50,90);
  float bb = random (105,75);
  float c = random (21,40);
  float d = random(90, 10);
  float e = random(200,400);
  float f = random(100,200);
  float gg = random(100,150);
  float h = random (20,95);

   
   
 

image(photo_1, width/1, height/1, a, a );
image(photo_2, width/2, height/2, bb,bb);
image(photo_3, width/2, height/2, c, c);
image(photo_4, width*4, height*4, d,d);
image(photo_5, width/2, height/2, f,f);
image(photo_6, width/2, height/2, gg,gg);

 
 
 
 
}


