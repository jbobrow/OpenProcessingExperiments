
PImage myImage1, myImage2, myImage4;
float minX, maxX, minY, maxY;
void setup() {
  size (2000, 1500);
myImage1 = loadImage("BranchMotif1.png");
myImage2 = loadImage("BranchMotif2.png");
myImage4 = loadImage("BranchMotif4.png");
imageMode(CENTER);
 PImage bg = loadImage("motifbg.png");
  background(bg);

minX = -width/2;
maxX = width/2;
minY = -height/2;
maxY = height/2;

}
int counter = 0;


void draw() {
pushMatrix();
  
  //translate (maxX, maxY); //(moves the cartesian plane)
rotate(random(0, 2*PI));
//scale(0.5);


float w1 = myImage1.width;
float h1 = myImage1.height;

float x1 = random(minX, maxX);
float y1 = random(minY, maxY);
float s1 = random(0.1, 100);

//tint (255, 255, 255, 50);
image (myImage1, x1, y1, w1/s1, h1/s1);



float w2 = myImage2.width;
float h2 = myImage2.height;
float x2 = random(minX/2, maxX/2);
float y2 = random(minY/2, maxY/2);
float s2 = random(0.5, 50);
image (myImage2, x2, y2, w2/s2, h2/s2);

float w4 = myImage2.width;
float h4 = myImage2.height;
float x4 = random(minX/3, maxX/3);
float y4 = random(minY/3, maxY/3);
float s4 = random(0.1, 200);
image (myImage4, x4, y4, w4/s4, h4/s4);

//image(myImage2, mouseX, mouseY, w2/10, h2/10);


     tint (255, 255, 255, 100);

popMatrix();
counter++;
println(counter);
}
void keyPressed() {
  save("image" + counter + ".png");
}

void mousePressed() { 
   PImage bg = loadImage("motifbg.png");
  background(bg);
}




