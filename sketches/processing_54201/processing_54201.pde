
PImage bg;
float mouse;
int a; 

void setup() 
{
  size(400,400);
  frameRate(30);
  smooth();
  noStroke();
  mouse = dist(0,0,width,height);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  bg = loadImage("animals.jpg");
  
}

void draw() 
{

  image(bg,0,0);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/mouse * 66;
      ellipse(i, j, size, size);

  a = (a + 1)%(width+50);
  stroke(296-a, 204-a, 0-a);
  line(0, a, width, a-26);
  line(0, a-6, width, a-32);
}
  }
}      
                
