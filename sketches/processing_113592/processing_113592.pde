
//makes image a variable
PImage background;

PImage ny1;
PImage ny2;
PImage ny4;
PImage ny5;
PImage ny6;



void setup() {
  size(500, 500, OPENGL); //OPENGL & P2D render gpx better
  //testing= loadImage("new-york-photos.jpg");
  background= loadImage("city-far.jpg");


  ny1= loadImage("ny_0000_1.png");
  ny2= loadImage("ny_0001_2.png");
  ny4= loadImage("ny_0003_4.png");
  ny5= loadImage("ny_0004_5.png");
  ny6= loadImage("ny_0005_6.png");

  frameRate(random(3));
  imageMode(CENTER);
}

void draw() {
  background(255);
  float x= random (0, 450); // setting the range
  float y= random (0, 200);
  float z= random (0, 450);

  //tint(42, 214, 242, 250);  
  image(background, 250, 250, 500, 500); 

for(int i=0; i<width; i+=150){
  tint(250, 250, 250, 180);
  image(ny1, x+i, y+i, 150, 150);
  image(ny2, x+i, z+i, 100, 100);
  image(ny4, z+i, x+i, 110, 110);
  image(ny5, z+i, y+i, 140, 140);
  image(ny6, y+i, x+i, 150, 150);
}

  //---------
  //image(ny2, z, x, 100, 100);
  //image(ny4, z, y, 300, 300);
  //image(testing, z, y, 300, 300);
}



