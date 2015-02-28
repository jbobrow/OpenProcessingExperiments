
PFont f;
String[] intro = {"Hello!", "Left mousebutton = Rainbow.", "Right mousebutton = Eraser.", "Middle mousebutton = Empty screen."}; 
int i = 0;
int a = 100;

void setup(){
  
  size(500,500);
  frameRate(30);
  f = loadFont("Impact-48.vlw");
  background(255);
  smooth();
  
}

void draw(){
 
 
  textFont(f,17);
  fill(i,a);
  
  text(intro[0], 10, 30);
  text(intro[1], 10, 50);
  text(intro[2], 10, 70); 
  text(intro[3], 10, 90);
 
  if (mousePressed && (mouseButton == LEFT)) {
    
    line(pmouseX,pmouseY, mouseX, mouseY);
    stroke(random(255),random(255),random(255));
    strokeWeight(50);
  
  
  } else if (mousePressed && (mouseButton == RIGHT)){
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke(255);
    strokeWeight(40);
    
  } else if (mousePressed && (mouseButton == CENTER)){
    background(255);
    i = 255;
    a = 0;
  }
    
  
  
  
  
}

