
/*Code by Sarah Tse
York Sheridan Joint Program of Design*/

int h = 0;
int r = 0;
int g = 0;
int b = 0;
int z = 0;
int u = 0;
int w = 0;

void setup(){
  size(438,390);
  background(0,0,0);
  ellipseMode(CENTER);
  smooth();
  noFill();
  frameRate(25);
}
 
void draw(){
  strokeWeight(50);
  stroke(r,g,b);
  ellipse(90,90,h+12,h+12);
  stroke(0,0,0);
  ellipse(90,90,h+8,h+8);
  strokeWeight(30);
  stroke(z,u,w);
  ellipse(90,90,h+4,h+4);
  stroke(0,0,0);
  ellipse(90,90,h,h);

  if(h>950){
    h=0;
  }else{
    h+=6;
  }
  
  strokeWeight(50);
  stroke(r,g,b);
  ellipse(100,300,h+12,h+12);
  stroke(0,0,0);
  ellipse(100,300,h+8,h+8);
  strokeWeight(30);
  stroke(z,u,w);
  ellipse(100,300,h+4,h+4);
  stroke(0,0,0);
  ellipse(100,300,h,h);
   
  if(h>950){
    h=0;
  }else{
    h+=5;
}
  
  translate(250,150);
  strokeWeight(50);
  stroke(r,g,b);
  ellipse(50,50,h+12,h+12);
  stroke(0,0,0);
  ellipse(50,50,h+4,h+8);
  strokeWeight(30);
  stroke(z,u,w);
  ellipse(50,50,h+2,h+4);
  stroke(0,0,0);
  ellipse(50,50,h,h);
   
  if(h>950){
    h=0;
  }else{
    h+=6;
  }
    
  if(mouseX > 0 && mouseX < 320) {
    r = mouseX + 5;
    g = mouseX + 5;
    b = mouseY + 5; 
  }
  
   else{
    r = 255;
    g = 164;
    b = 44;
  }
  
  if(mouseY > 10 && mouseY > 200){
    z = mouseY + 5;
    u = mouseY + 5;
    w = mouseX + 5;
  }
    
  else{
    z = 249;
    u = 252;
    w = 139;
  }
}



