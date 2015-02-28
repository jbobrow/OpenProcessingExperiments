
  //HIT
  float x = 20;
  float y = 20;
  float w = 55;
  float h = 30; 
  



   

void setup(){
  size(500,600);
  smooth();
  frameRate(100);
  noCursor();
  background(255,255,255);

  

  
}


void draw(){
  noStroke();
  PFont font;
  font = loadFont ("Corbel-Bold-48.vlw");
  textFont (font);
  fill(#000000, 1);
  text ("Press 1 or 2", 125, 550);




  float n = random (-10, 10);
  float n1 = random (-100, 100);
  float n2 = random (-50, 50);
  float n3 = random (-100, 100);
  
  float m = random (-10, 10);
  float m1 = random (-100, 100);
  float m2 = random (-50, 50);
  float m3 = random (-100, 100);
  
  float o = random (5, 20);
  float p = random (2,5);
  int show = 1; 
  int k = 1;
  
 
  
  PImage cursor;
  cursor = loadImage("cursor_02.png");  
  cursor(cursor, 20, 20);
 

  
if(keyPressed){
  fill(#000000);
  stroke(#000000);
for (int i = 0; i < height; i = i +15)
rect(0,i,width,10);
 }
    
if(mousePressed){
  

    
  //FARBWAHL
    if (key == '1') {
      show = 1;
    }
    
          if (key == '2') {
      show = 2;
    }
  
  //FARBE 1    
  if (show == 1) {
    
  fill (#1228C6);
  ellipse (mouseX + n, mouseY + m, o, o);  
  fill (#1228C6, 5);
  ellipse (mouseX + n1, mouseY + m1, o+300,o+300);  
  fill (#1228C6, 5);
  ellipse (mouseX + n2, mouseY + m2, o+100, o+100);  
  fill (#426BD1, 135);
  ellipse (mouseX +n2, mouseY +m2, o, o);
  fill (#FFFFFF, 200);
  ellipse (mouseX +n, mouseY +m, 6, 6); 
  fill (#FFFFFF, 200);
  ellipse (mouseX +n, mouseY +m, p, p); 
  
  fill(#66B32E, 1);  
  rect(0,0,width-1,height-1);
  filter(BLUR, 1); 
  }
  
  //FARBE 2
  if (show == 2) {
      
  fill (#8411C1);
  ellipse (mouseX + n, mouseY + m, o, o);  
  fill (#CE15CE, 5);
  ellipse (mouseX + n1, mouseY + m1, o+300,o+300);  
  fill (#8411C1, 15);
  ellipse (mouseX + n2, mouseY + m2, o+100, o+100);  
  fill (#8411C1, 135);
  ellipse (mouseX +n2, mouseY +m2, o, o);   
  fill (#FFFFFF, 200);
  ellipse (mouseX +n, mouseY +m, o, o); 
 
  fill(#414142, 1);  
  rect(0,0,width-1,height-1);
  filter(BLUR, 1);  

  }
}
 
float a = random(-200,800);
float b = random(-500,800);
float c = random(-200,800);
float d = random(-500,800);
float h = random(-500,500);
float w = random(-500,500);

fill(#FFFFFF,5);
noStroke();
beginShape();
vertex(mouseX,mouseY);
bezierVertex(w,w,h,h,a,b);
bezierVertex(a,w,b,w,h,b);
endShape();



  
}
  
 



