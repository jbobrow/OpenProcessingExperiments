
PImage myPic;

void setup() {
  size(500,500,P3D);
  myPic = loadImage("fruitfly.jpg");


  camera(-200, 150, -250, width/2, height/2, 230, 0, 1, 0);
  lights();
  smooth();
  stroke(0);
  frameRate(5);
}


void draw() {

  background(204);

  int q = floor(random(0,myPic.width));    //randomly selects pixels from image
  int x = floor(random(0,myPic.height));

  color myColor = myPic.get(x,q);     
  fill(myColor);









  for(int y = 0; y < height; y+=60) {       //sets up grid and spacing
    for(int z = 0; z < width; z+=60) {

      pushMatrix();                         //draws spheres at random sizes and pic colors
      noStroke();
      translate(250,y,z);
      fill(myColor);
      sphere(random(5,20));
      popMatrix();
    }
  }
}




