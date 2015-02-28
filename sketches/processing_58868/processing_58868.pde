
float x = mouseX;
float y = mouseY;
int d = 30;
int l = 80;
PImage img;
PFont font;

float easing = 0.01;

void setup(){
  size(720,480);
  smooth();
  strokeWeight(2);
  img = loadImage("bamboo.jpg");
  font = loadFont("AmericanTypewriter-Bold-48.vlw");
  textFont (font);
}

void draw(){
  background(204);
  image(img,0,0);
  textSize(24);
  text("z3276544", 550,450);
  textSize(18);
  text("Yin Ren", 550,470);
  
  
    if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      x--;
    }else if (keyCode == RIGHT) {
      x++;
    }
  }
  
  if (keyPressed && (key == CODED)) {
    if (keyCode == UP) {
      y--;
    }else if (keyCode == DOWN){
      y++;
    }
  }
  
  float targetX = mouseX;
  x += (targetX -x)*easing;
  
  //Neck
  fill(40);
  rect(x+145,y+190,d,l/2);
  
  //head
  strokeWeight(2);
  fill(0);
  ellipse(x+110,y+130,d,d);
  ellipse(x+210,y+130,d,d);
  fill(255);
  ellipse(x+160,y+155,d*4,d*3);
  fill(0);
  ellipse(x+160,y+175,d,d);
  fill(255);
  ellipse(x+160,y+165,10,10);
  strokeWeight(8); 
  line(x+120,y+155,x+150,y+145);
  line(x+170,y+145,x+200,y+155);
  
  
  strokeWeight(2);
  if (mousePressed == true) {
   //eye
   float r = random (0,255);
   float b = random (0,255);
   fill(r,0,b);
   ellipse(x+145,y+150,10,10);
   ellipse(x+175,y+150,10,10);
  }else{
    //eye
   float r = random (0,255);
   float b = random (0,255);
   fill(r,0,b);
   ellipse(x+145,y+150,5,5);
   ellipse(x+175,y+150,5,5);
  }
  
 
  
   //Arm
   strokeWeight(20);
   if (mousePressed){
   line(x+210,y+250,x+250,y+210);
   line(x+60,y+240,x+110,y+250);
   line(x+160,y+320,x+250,y+390);
   line(x+70,y+400,x+160,y+320);
   }else{
     line(x+210,y+250,x+250,y+190);
     line(x+60,y+220,x+110,y+250);
     line(x+160,y+320,x+250,y+410);
     line(x+70,y+420,x+160,y+320);
   }
    
    
    
  
  
  //Body
  strokeWeight(2);
  fill(255);
  ellipse(x+160,y+290,d*4,d*5);
  
  if (mousePressed == true) {
   float r = random (0,255);
   float b = random (0,255);
   fill(r,0,b);
   ellipse(x+160,y+310,d*2.5,d*3);
  }else{
   fill(0);
  ellipse(x+160,y+310,d*2.5,d*3);
  }
  
  
}

