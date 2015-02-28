
float ra = 0;
int count=0;
 int w=150;
 int y=150;
 int f=200;
 int d=120;
 float r=161;
 float g=255;
 float b=0;
 
void setup() {
  size(300, 300);
  fill(161,255,0,5);
  stroke(5,5,5);
}
  
void draw(){
  translate(width/2,height/2);
  rotate(ra);
  ellipse(0,0,200,120);
  while (count<100){
  
  ellipse (w,y,f,d);
  count= count+2;
  f=f+15;
  d=d+15;
}

}
 
void mouseDragged() {
  ra += atan2(mouseY-height/2, mouseX-width/2) - atan2(pmouseY-height/2, pmouseX-width/2);
}






