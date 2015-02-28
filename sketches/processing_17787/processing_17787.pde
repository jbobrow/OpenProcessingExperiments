

float w, i, j, k, s, sep;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int [] colors;
PImage img;
color pix;
int count;
 
void setup()
{
  size(400, 400, P3D);
  img = loadImage("still_life_small.jpg");
  colors = new int[img.width * img.height];
  countColours();
}
 
void draw()
{
  background(0);
  s = s; 
  sep = 10;
  w = 1;
 
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      s = s - 0.01;
    }
    else if (mouseButton == RIGHT) {
      s = s + 0.01;
    }
  }
 
  pushMatrix(); 
 
  stroke(50);
  strokeWeight(1);
  smooth();
  translate(width/2, height/2, 0);
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
 
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0;
  }
 
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0;
  }
 
  rotateX(-ymag); 
  rotateY(-xmag); 
 

  scale(s,s,s);
   line(-127.5, -127.5, -127.5, -127.5, -127.5, 127.5);
   line(-127.5, -127.5, -127.5, -127.5, 127.5, -127.5);
   line(-127.5, -127.5, -127.5, 127.5, -127.5, -127.5);
   line(127.5, 127.5, 127.5, 127.5, 127.5, -127.5);
   line(127.5, 127.5, 127.5, -127.5, 127.5, 127.5);
   line(127.5, 127.5, 127.5, 127.5, -127.5, 127.5);
   line(-127.5, -127.5, 127.5, 127.5, -127.5, 127.5);
   line(-127.5, -127.5, 127.5, -127.5, 127.5, 127.5);
   line(-127.5, 127.5, -127.5, -127.5, 127.5, 127.5);
   line(-127.5, 127.5, -127.5, 127.5, 127.5, -127.5);
   line(127.5, -127.5, -127.5, 127.5, 127.5, -127.5);
   line(127.5, -127.5, -127.5, 127.5, -127.5, 127.5);
   
   strokeWeight(3);
   
  for(int i = 1; i < colors.length; i++){
    stroke(red(colors[i]), green(colors[i]), blue(colors[i]), 100);
    point(red(colors[i]) - 127.5, green(colors[i]) - 127.5, blue(colors[i]) - 127.5);
  }

  popMatrix();
 

}

void countColours(){
  
  for(int i = 1; i < img.width; i++){
    for(int j = 1; j < img.height; j++){
      pix = img.get(i, j);
      colors[i * j] = pix;
    }
  }
  colors = sort(colors);
  count = 1;
  for(int i = 1; i < img.width * img.height; i++){
    if(i != 1){
      if(colors[i] == colors[i - 1]){
        count = count + 1;
      }else{
        count = 1;
      }
    }
    
    
  }
}



