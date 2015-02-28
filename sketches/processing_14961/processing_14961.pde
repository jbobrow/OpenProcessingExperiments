
PImage photo;
PImage photo2;
PImage photo3;
void setup() {
  photo = loadImage ("photo 2-3.jpg");
  photo2 = loadImage ("photo-4.jpg");
  photo3 = loadImage ("photo 3-2.jpg");
size (700,700);
} 

void draw() {
  background(0);
  tint(255,250,250,150);
  image(photo,50,50);
  tint(255,250,250,100);
  image(photo2,75,100);
  tint(250,250,250,50);
  image(photo3,125,150);
}




