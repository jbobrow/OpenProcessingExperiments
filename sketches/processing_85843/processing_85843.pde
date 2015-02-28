
float i = 0;
PImage texture;

void setup() {
  size(800,800,P3D);
  background(0);
  texture = loadImage("texture.jpg");
  
  // http://www.processing.org/reference/blend_.html
  blend(texture, 0, 0, 800, 800, 0, 0, 800, 800, BLEND);
  fill(0,255,0);
   ellipse(400,300,300,400);
    filter(BLUR, 2);
}
  
void draw ()  {
  stroke(255,255,255);
  strokeWeight(5);
   i = i + 0.01;
   fill(255,255,255,5);
 ellipse(400,300,300,400);
 
 noStroke();
 fill(255, 0, 0, 30);
 ellipse(mouseX, mouseY, 20, 20);

 // http://fc07.deviantart.net/fs30/f/2009/238/4/b/Brown_noise_texture_by_texturemaker.jpg







 println("mouseX:");
 println(mouseX);
 println("mouseY");
 println(mouseY);
  
}
