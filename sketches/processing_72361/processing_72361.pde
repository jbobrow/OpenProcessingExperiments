
float mushroom_x = 210;
float mushroom_y = 350;
float mushroom_radius = 50; 
float mushroom_x_speed = 8;
float mushroom_y_speed = 8; 
PImage img1;
PImage img2;
void setup() {
  size(500, 500);
  
  img1 = loadImage("super-mario-bros1.png");
  img2 = loadImage("mushroom.png");
}
void draw() {
   background(110,208,241);
   textSize(26);
   text("Catch the Mushroom If You Can", 50, 50);
fill( random(238),241,76); 
image(img2, mushroom_x, mushroom_y, mushroom_radius*2, mushroom_radius*2);
if ( dist(mouseX, mouseY, mushroom_x, mushroom_y) < mushroom_radius) {
  image(img1, 200, 150);
  textSize(36);
   text("YAY", 220, 150);
  };

mushroom_x = mushroom_x + mushroom_x_speed; 
  if ((mushroom_x + mushroom_radius > width) || (mushroom_x - mushroom_radius < 0)) {  
  
    mushroom_x_speed = mushroom_x_speed * -1;  
  };

  mushroom_y = mushroom_y + mushroom_y_speed;
  if ((mushroom_y + mushroom_radius > height) || (mushroom_y - mushroom_radius < 0)) {
     
    mushroom_y_speed = mushroom_y_speed * -1;
    
  }
};



