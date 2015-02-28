
 //Random number variable
 //Copyright kYlE hArWi
float depth = random(-250,250);
float r = random(1.0,255.0);
float v = random(1.0,10.0);
int[] boxes = new int[100];//stores the sizes
color[] colors = new color[100];//stores the colors
float[][] locations = new float[100][3];//locations
int numBoxes= 0;
void setup() {
  size(600,600, OPENGL);
  frameRate(30);
  fill(random(255), random(255), random(255));
  depth = random(900);
}


void draw(){
 
 background(r,r,r);
 lights();
 translate(width/2, height/2, 0);
 rotateX( radians(frameCount / 2));
 rotateY( radians(frameCount / 2));
 fill(random(1, 255));
 pushMatrix();
   box(100);
   translate(100, -100, 0);
   fill(100, 200, 10);
   ellipse(50, 70, 100, 150);
   translate(50, 50, 0);
   box(100);
   translate(width/5000, height/5000, 0);
 popMatrix();
 pushMatrix();
   fill(130,250,80);
   sphere(900);
   translate(width/5, height/5, 0);
   fill(250, 90, 140);
   sphere(40);
   translate(r,r, 0);
 popMatrix();
 
 for(int i = 0; i < numBoxes; i++)
 {
 pushMatrix();
  fill(colors[i]);
 translate(locations[i][0], locations[i][1], locations[i][2]);
  box(boxes[i]);
 popMatrix(); 
 }
}
void keyPressed(){
  if (key == ' '){
    //divide by 0
    if (numBoxes < 100)
    {
      color c = color(random(255),random(255),random(255));
      colors[numBoxes] = c; 
      boxes[numBoxes] = (int)random(10,100);
      locations[numBoxes][0] = random(width) - width/2;
      locations[numBoxes][1] = random(height) - height/2;
      locations[numBoxes][2] = random(depth) - 450;
      numBoxes++;
    }
  }
  else 
    {
      fill(random(255), random(255), random(255));
    }
}


