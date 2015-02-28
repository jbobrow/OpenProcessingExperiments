
PImage pose1;
PImage pose2;
PImage pose3;
PImage pose4;
PImage pose5;
PImage pose6;
PImage pose7;
PImage pose8;
PImage pose9;
PImage pose10;
 
int counter;
 
void setup() {
  size(600, 600);
  pose1 = loadImage("boxerpose1.jpg");
  pose2 = loadImage("boxerpose2.jpg");
  pose3 = loadImage("boxerpose3.jpg");
  pose4 = loadImage("boxerpose4.jpg");
  pose5 = loadImage("boxerpose5.jpg");
  pose6 = loadImage("boxerpose6.jpg");
  pose7 = loadImage("boxerpose7.jpg");
  pose8 = loadImage("boxerpose8.jpg");
  pose9 = loadImage("boxerpose9.jpg");
  pose10 = loadImage("boxerpose10.jpg");
 
  counter = 0;
  frameRate(1);
  imageMode(CENTER);
  background(0);
}
  
void draw() {
  //background(0);
   
  if( counter > 30){
     counter = 0;
     background( 0);
  }
  int chooser =  int( random(9));
  float degree = random(360);
  translate(width/2, height/2);
  pushMatrix();
   
  rotate(radians(degree));
  //float x = random(width/2);
  //float y = random(height/2);
  float x = random(width/4);
  float y = random(height/4);
  float d = random(100, 300);
  float tr = random( 255);
  float tg = random( 255);
  float tb = random( 255);
   
   
  tint( tr, tg, tb);
   
  switch( chooser){
     case 0: image(pose1, x, y, d, d); 
              break;
     case 1:  image(pose2, x, y, d, d);
              break;
     case 2:  image(pose3, x, y, d, d);
              break;
     case 3:  image(pose4, x, y, d, d);
              break;
     case 4:  image(pose5, x, y, d, d);
              break;
     case 5:  image(pose6, x, y, d, d);
              break;
     case 6:  image(pose7, x, y, d, d);
              break;
     case 7:  image(pose8, x, y, d, d);
              break;
     case 8:  image(pose9, x, y, d, d);
              break;
     case 9:  image(pose10, x, y, d, d);
              break;      
     default: println("not reached");
              break;
     
  }
   
  popMatrix();
  translate(-(width/2), -(height/2));
 // if( counter == 0)
   
   
  //if( counter == 1)
 // image(pose2, x, y, d, d);
   
  counter++;
}

