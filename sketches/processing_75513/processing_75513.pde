
PFont myFont;
float a = 0.0;
float rSize;  // rectangle size

void setup() {
  size(860, 760, P3D);
  rSize = width / 6;  
  noStroke();
  fill(204, 204);
}

void draw() {
  background(#171717);
  
  a += 0.015;
  if(a > TWO_PI) { 
  a = 0.0; 
  }
  
translate(width/2, height/2);
   
  rotateX(a);
  rotateY(a * 2.0);
  myFont = createFont("Helvetica", 48);
  fill (#1CFFFD);
  textFont(myFont);
  text("FIND",mouseX/3, mouseY/6, rSize*2, rSize*2);
    
     rotateX(a);
  rotateY(a * 2.0);
  fill (#FF1C73);
   text("JOY",mouseX/3, mouseY/6, rSize*2, rSize*2);
   
  rotateX(a * 1.001);
  rotateY(a * 2.002);
    fill (#1CFFFD);
  text("IN",mouseX/3, mouseY/6, rSize*2, rSize*2);
   
    rotateX(a * 1.001);
  rotateY(a * 2.002);
   fill (#FF1C73);
  text("THE",mouseX/3, mouseY/6, rSize*2, rSize*2);
    
    rotateX(a * 1.001);
  rotateY(a * 2.002);
    fill (#1CFFFD);
  text("CHAOS",mouseX/3, mouseY/6, rSize*2, rSize*2);

  fill(#171717,100);
  rect(0,0,width,height);

 
}
