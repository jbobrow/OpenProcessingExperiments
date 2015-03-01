
int counter;
int red;
int green;
int blue;
PFont myFont;

void setup() {  //setup function called initially, only once
  size(500, 500);
  red = (int)(Math.random() * 255);
  green = (int)(Math.random() * 255);
  blue = (int)(Math.random() * 255);
  background(red,green,blue);
  myFont = createFont("Calibri",40);
  textfont(myFont);
}

void draw() {  //draw function loops 
  
  fill(red,green,blue,10);
  rect(0,0,500,500);
  fill((int)(Math.random() * 255),(int)(Math.random() * 255),(int)(Math.random() * 255),100);
  arc((int)(Math.random() * 475),(int)(Math.random() * 475),25,25,PI,PI+QUARTER_PI);
  
  fill(0,0,0,50);
  text("girls byte",250,250);
  
  if (mousePressed == true) {
      red = (int)(Math.random() * 255);
      green = (int)(Math.random() * 255);
      blue = (int)(Math.random() * 255);
  }
  
  if (keyPressed == true)
  {
      if (key == 's') {
          saveFrame("myImg-#####.tif");
      }
  }
}
