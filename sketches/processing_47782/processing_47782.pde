
/**
 * Random. 
 * 
 * Random numbers create the basis of this image. 
 * Each time the program is loaded the result is different. 
 */
void setup() {
size(600, 400);

PImage img1;
img1 = loadImage("wc1494.jpg");
image(img1, 0, -20);
}
void draw() {
  
  int s = second();
smooth();
//background(0);
strokeWeight(1);
frameRate(200);


for(int i = 0; i < width; i++) {
  float r = random(3);
  float x = random(0, width *i );
  stroke(r,50);
  //line(i, 0, x, height);
  
  line(i , x , i + r, x) ;
  line(i - r , x , i, x) ;
 line( i, x - r , i, x) ;
 line(i , x , i, x + r) ;
  


}
}

