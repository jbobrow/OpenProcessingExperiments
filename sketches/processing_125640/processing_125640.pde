
//Processing 2.0

int alpha=255;           //alpha filter
int x=100;               //initial position
int y=76;                //initial position
PImage img;
float theta=radians(0);  //initial angle of the triangle

void setup(){
  size(600,800);
  background(255,250,245);
  img = loadImage("jimi.jpg");
  noStroke();
  frameRate(900);
  smooth();
}

void draw(){
  color c = img.pixels[y*img.width+x];                    //get pixel color
  int grey=round(red(c)*0.2+green(c)*0.7+blue(c)*0.1);    //transcode color into another one
  float rdmTri = random(0,10);                            //random vale to be used as input
  fill(80,alpha-grey);
  pushMatrix();
  translate(x,y);                                         //position of triangles
  int side=5-grey/100;                                    //update position
  rotate(theta);                                          //rotate triangles in 180 degrees
  triangle(-6,6,6,6,0,-6);                                //draw triangle
  if(rdmTri<0.1){                                         //condition to draw random colored triangles
    fill(random(200,255),random(200,255),random(200,255),random(80,255)); 
    triangle(-6,6,6,6,0,-6);
  }
  popMatrix();
  fill(255,250,245);
  rect(0,0,100,height);                                   //draw borders using same color as the background to hide saw-shaped sides
  rect(width-100,0,width,height);
  theta+=radians(180);                                    //update angle value
  if(theta>150){  theta=radians(0);  }                    //avoid high numbers
  y+=12;                                                  //update axis values
  if(y>=height-64){
    y=76;
    x+=6;
    if(x>=width-94){
      noLoop();                                           //stop program when last triangle is drawn
    }
  }
}


