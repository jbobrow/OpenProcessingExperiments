
void setup() {
 size(400,600);
  smooth();
  background(255)
    mouseX=width/2;
    mouseY=height/2;
} 
void draw(){
 courbe1();
}
void courbe1() {
  
  fill(0,0,0,15);
    rect(-2,-2,width+10,height+10);
 stroke(0,122,random(110));
  fill(0,0,0,0);
  strokeWeight(2)
  bezier(width/2,0,mouseX,3/4*mouseY,mouseX,3/4*mouseY,width/2,height);
 
}
 
