
boolean drawTime=true;
int z=0;

void setup(){
  size(500,500,P3D);
  background(0);
 
}

void draw(){
  background(0);
  
  stroke(255,0,0);
  fill(255);
  translate(mouseX,mouseY,z);
 
  
  //translate(width/2,height/2,0);
  float mx=map(mouseX,0,width,0,360);
  println(mx);
rotateZ(radians(mx));
float my=map(mouseY,0,height,0,360);
rotateX(radians(my));
 box(50);
  }



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      z+=10;
    } else if (keyCode == DOWN) {
     z-=10;
    }
  }
} 
  
void mousePressed(){
 
  drawTime=false;
}
  


void mouseReleased(){
 drawTime=true;
}

 
 
