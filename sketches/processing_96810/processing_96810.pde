
/***
Play with Extrusion
**/

PImage extrude;
int[][] values;
float[][] r;
float[][] g;
float[][] b;

float angle= 0;
int img_width;
int img_height;

void setup(){
  // setup the canvas size
  size(650, 550, P3D);
  
  // load the image into a array
  extrude = loadImage("face_boy.jpg");
  //extrude = loadImage("ella.jpg");
  //extrude = loadImage("cat_becca.jpg");
}


void draw(){
  // set the background color
  background(#e6e6e6);

  // update the angle
  angle += 0.002;
  
  // rotate around the mouse cursor
  //translate(width/2, 0, -128);
  translate(mouseX, mouseY);
  rotateY(angle);  
  translate(-width/2, 100, -128);
  
  
  // display the image value points
  extrude.loadPixels();
  
  img_width=extrude.width;
  img_height=extrude.height;
  values = new int[img_width][img_height];
  for(int j = 0; j < img_height; j++)
  {
    for(int i = 0; i < img_width; i++)
    {
      color pixel = extrude.get(i,j);
      values[i][j] = int(brightness(pixel));
      stroke(pixel);
      point(i, j, -values[i][j]);
    }
  }
}


