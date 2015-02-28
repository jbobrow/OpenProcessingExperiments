
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
int leng = 40;
float x = 0;
float x2 = 600;
float y1 = 300;
float y2 = 300;
float speed = 1;
 
void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);
  colorMode( HSB, 360, 100, 100);
  //frameRate(10);
  
}
 
void draw() {
  println(frameRate);
  //background(0);
 
 
  //snake shape
   
  int snakefillHue;
  int snakefillHue2;
  //snakefillHue = (int)random(0, 360);
  snakefillHue = 100; 
  snakefillHue2 = 200; 
  int snakefillBrightness;
  snakefillBrightness = (int)random(0, 100);
  int snakefillBrightness2;
  snakefillBrightness2 = (int)random(0, 100);
  int snakefillSaturation;
  snakefillSaturation = (int)random(0, 100);
  int snakefillSaturation2;
  snakefillSaturation2 = (int)random(0, 100);
   
 
  x += speed;
  x2 -= speed;
  y1 += speed; 
  y2 -= speed;
   
  fill(snakefillHue, snakefillBrightness, snakefillSaturation);
  fill(snakefillHue2, snakefillBrightness2, snakefillSaturation2);
  noStroke();
  rect(x+(leng/2), 300, leng, 30);
  triangle(x, y1, x, y1+30, x+(leng/4), y1);
  triangle(x, y2, x, y2-30, x+(leng/4), y2);

  rect(x2-(leng/2), 300, leng, 30);
  triangle(x2, y1, x2, y1+30, x2-(leng/4), y1);
  triangle(x2, y2, x2, y2-30, x2-(leng/4), y2);
   
 /* ellipse(x+leng, 300, 50, 29);
  
   if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
   */
}
