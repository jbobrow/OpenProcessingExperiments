
PImage earth;
z=100;
 
void setup() {
  size(800, 600);
  earth= loadImage("http://ut-images.s3.amazonaws.com/wp-content/uploads/2010/05/Earth-Western-Hemisphere.jpg");
}
 
void draw() {
  background(0);
  translate(width/2,height/2);
  imageMode(CENTER);
 scale(z);
 z=z*.99;
  image(earth,width/4+random(2)-random(2),height/4+random(2)-random(2));
}
