
/*int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
*/
 
// global variables
int leng = 235;
float x = -leng;
float y = 315;
float speed = 0.5;
 
void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);
  colorMode( HSB, 100, 100, 100);
  //frameRate(10);
  
}
 
void draw() {
  println(frameRate);
  //background(0);
 
 
  //snake shape
   
  int snakefillHue;
  //snakefillHue = (int)random(0, 360);
  snakefillHue = 100; 
  int snakefillBrightness;
  snakefillBrightness = (int)random(0, 100);
   
  int snakefillSaturation;
  snakefillSaturation = (int)random(0, 100);
   
 
  x += speed;
  y -= speed; 
  //int _y;
  //_y = (int)random(15, 585);
   
  fill(snakefillHue, snakefillBrightness, snakefillSaturation);
  noStroke();
  rect(x+(leng/2), 300, leng, 30);
  triangle(x,y,x,y+30,x+(leng/4),y);
  triangle(x,y,x,y-30,x+(leng/4),y);
  //triangle(x, y, x, y-90, x+(leng/4), y);
  //triangle(x+(leng/3), 315, x+(leng/1.5), 315, x+(leng/3), 450);
   
  //ellipse(x+leng, 300, 50, 29);
   
}
