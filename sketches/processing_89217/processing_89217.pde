
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
 
int x1=20;
int x2=220;
int x3=430;
 
int y=450;
int h=475;
 
int w=50;
 
 
void setup(){
size(500,500);
smooth();
background(255);
}
float i = 0;
float j = 0;
float k = -255;
 
void draw(){
fill(255,100,0);
  noStroke();
  rect(20,450,50,25);
   
  fill(17,165,84);
  rect(width/2-20, 450, 50,25);
   
  fill(0,0,255);
  rect(430,450,50,25);
  
}
 
void mouseDragged(){
 
  if (button1){
    fill(random(255,255),80,0);
    ellipse(mouseX,mouseY,50,50);
     
  }
   

  if (button2){
    fill(0,random(10,255),80);
    ellipse(mouseX,mouseY,50,50);
    ellipse(mouseX,mouseY,90,20);
  }
   
  if (button3){
   
    fill(0,0,random(40,255));
    ellipse(mouseX,mouseY,50,50);
    ellipse(mouseX,mouseY,90,20);
     i = i + .1;
  j = j + 1;
  k = k + 1;
  float r = random(0,255);
  float g = random(0,255);
  float b = random(0,255);
  translate(mouseX, mouseY);
  rotate(i);
  if(j<255){
  fill(r, g, b);
  } else {
  fill(r, g, b);
  }
  fill(r, g, b);
  beginShape();
  vertex(-50, -50);
  vertex(0, -100);
  vertex(50, -50);
  vertex(50, 50);
  vertex(0, 100);
  vertex(-50, 50);
  endShape(CLOSE);

  }
   
   
}
 
   
void mousePressed(){
  if((mouseX>x1)&&(mouseX<x1+w)&&(mouseY<y+h)){
  button1 = !button1;
    button2 =false; 
    button3 = false;
  }
   
  if((mouseX>x2)&&(mouseX<x2+w)&&(mouseY<y+h)){
  button2 = !button2;
  button1 = false; 
    button3 = false;
  }
   
  if((mouseX>x3)&&(mouseX<x3+w)&&(mouseY<y+h)){
  button3 = !button3;
  button1 = false; 
    button2 = false;
  }
}
 
void keyPressed(){
if (key=='c'){
fill(255);
rect(0,0,width,height);
}
}
