
/**
 * Simple plan to volume, using "particules".
 *
 * Converts a flat image into spatial data points and rotates the points
 * around the center. Click to stop/start rotation. Hit Space bar to start/stop transformation.
 * Hit 1 2 or 3 to change the type of volume: 1 for sphere, 2 for cylinder, 3 for tore.
 */
 
PImage extrude;
int[][] values;
float[][][]X;
float[][][]Y;
float[][][]Z;
int X0;
int Y0;
float angle = 0;
float rayon=100;
float rayon2=200;
float theta;
float phi;
int pas=3;
float YRotation=0;
float XRotation=0;
float speed=0.01;
boolean rotation=true;
float count=1;
boolean unwrap=true;
float amortissement=0.1;
float deceleration=0.001;
int volumeTypeFrom=3;
int volumeTypeTo=1;
 
 
 
void setup() {
   
  strokeWeight(2);
  // Load the image into a new array
  extrude = loadImage("IMG_1543.jpg");
  extrude.loadPixels();
  //size(extrude.width, extrude.height, P3D);
  size(480,600,P3D);
  X=new float[5][extrude.width][extrude.height];
  Y=new float[5][extrude.width][extrude.height];
  Z=new float[5][extrude.width][extrude.height];
  values = new int[extrude.width][extrude.height];
  volume();
}
 
void draw() {
  background(0);
   
    if(rotation){
  YRotation=((float)mouseX-width/2)/100;
  XRotation=-((float)mouseY-height/2)/100;
    }
translate(width/2, height/2, 0);
  rotateY(YRotation);
  rotateX(XRotation);
  translate(-width/2, -height/2, 0);
 if(unwrap){
   count+=speed;
  if(count>1){
    speed=-speed;
    volumeTypeTo=floor(random(5));
  }
  if(count<0){
    speed=-speed;
    volumeTypeFrom=floor(random(5));
  }
 }
  // Display the image mass
  for (int y = 0; y < extrude.height; y+=pas) {
    for (int x = 0; x < extrude.width; x+=pas) {
      stroke(values[x][y]);
      point(X[volumeTypeTo][x][y]-(X[volumeTypeTo][x][y]-X[volumeTypeFrom][x][y])*count,
      Y[volumeTypeTo][x][y]-(Y[volumeTypeTo][x][y]-Y[volumeTypeFrom][x][y])*count,
      Z[volumeTypeTo][x][y]-(Z[volumeTypeTo][x][y]-Z[volumeTypeFrom][x][y])*count);
    }
  }
}
void volume(){
  for (int i = 0; i < 5; i++) {
  for (int y = 0; y <extrude.height; y+=pas) {
    for (int x = 0; x < extrude.width; x+=pas) {
      color pixel = extrude.get(x, y);
      values[x][y] = pixel;
      if(i==0){
        X[i][x][y]=x;
        Y[i][x][y]=y;
        Z[i][x][y]=0;
      }
      if(i==1){
        phi=((y-(extrude.height/2))*PI/extrude.height)+PI/2;
        theta=(x-(extrude.width/2))*2*PI/extrude.width+PI;
        rayon=100;
        X[i][x][y]=extrude.width/2-rayon*sin(theta)*sin(phi);
        Y[i][x][y]=extrude.height/2-rayon*cos(phi);
        Z[i][x][y]=-rayon*cos(theta)*sin(phi);
      }
      if(i==2){
        theta=(x-(extrude.width/2))*2*PI/(extrude.width)+PI;
        rayon=100;
        X[i][x][y]=extrude.width/2-rayon*sin(theta);
        Y[i][x][y]=y;
        Z[i][x][y]=-rayon*cos(theta);
      }
      if(i==3){
        phi=((y-(extrude.height/2))*2*PI/extrude.height)+PI/2;
        theta=(x-(extrude.width/2))*2*PI/extrude.width+PI;
        rayon=100;
        X[i][x][y]=extrude.width/2-(rayon2+rayon*sin(phi))*sin(theta);
        Y[i][x][y]=extrude.height/2-rayon*cos(phi);
        Z[i][x][y]=-(rayon2+rayon*sin(phi))*cos(theta);
      }
      if(i==4){       
        X[i][x][y]=x;
        Y[i][x][y]=y;
        Z[i][x][y]=rayon*sin((float)x/100)*cos(3*(float)y/100);
      }
    }
  }
  }
}
 void mouseReleased(){
    if(mouseButton==LEFT)rotation=!rotation;
     if(mouseButton==RIGHT){
       volumeTypeFrom=floor(random(5));
       volumeTypeTo=volumeTypeFrom+floor(random(5-volumeTypeFrom));
     }
    }
void keyPressed(){
  if (keyCode==32)unwrap=!unwrap;
  if ((keyCode>=97)&&(keyCode<106)){
    pas=keyCode-95;
    strokeWeight(1+pas/2);
    volume();
  }
// loading and Image
 
// PImage is a special Datatype.  It is used to store images
PImage img; // Setting up an image variable called img
 
void setup(){
  size (610,610);
  // using Processing's loadImage method to import an image and store it in the variable img
  img = loadImage("IMG_1543.jpg");
}
 
 
 
void draw(){
  background(255);
  // using Processing's image method to display the image
// the image method has three arguments (the name of the image, the x position , the y position)
// when we write a method we will often add what we call arguments.  For example the rectangle
// method has 4 arguments the x and y position and the width and height. 
// the code as we have see looks like this rect (10,10,50,50);
// the arguments are the information that goes inside the brackets
// each argument is separated by a comma
 
  image(img, 0, 0);
 
}

}
