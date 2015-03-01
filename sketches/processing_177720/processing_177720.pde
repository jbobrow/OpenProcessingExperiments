
//Happy New Year to everyone

//Global variables
int x = 30;
int y = 30;
float z;
color[] palette = {#C2418A, #199A52, #FEB704, #FFF30D, #BA2702};

//setup()
void setup() {
  //size and colour
  size (800, 600);
  //local variable
  background (palette[2]);
  
}

//draw()
void draw() {
  x++;
  //for
  for (int x = 25;x < width; x +=50) {
  for (int y = 25;y < height; y +=50) {   
  float r = random(3,5);
  strokeWeight(random(6));
   stroke(palette[int(r)]); 
   noFill();
 rect(x, y, 30, 30);
   z+=16;
   float p = random(5);
  //elements
  noFill();
  strokeWeight(random(9));
  stroke(#67A64B);
  ellipse(z, random(height), 110, 110);
  x = constrain(x, 0, width+250);
 x = constrain(x, 0, width+350);
 }
}

PImage tree;

  tree = loadImage("tree.jpg");

  image(tree, 100, 350);
}
void keyReleased(){
if (key == 'a') background (360);
if (key == 'b') background (0);

PImage Happy;
Happy = loadImage("Happy.JPG");
image(Happy, 0, 0);
}





