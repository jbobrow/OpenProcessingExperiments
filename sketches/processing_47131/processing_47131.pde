
void setup(){
 size(640,360);
 smooth();
background(225,217,196);
}
 void draw() {
     beginShape();  
  fill (53,45,38);
vertex (0,20);
vertex (590,0);
vertex (590,360);
vertex (545,360);
 endShape();
 
  beginShape();  
  fill (239,221,175);
vertex (640,20);
vertex (590,0);
vertex (590,360);
vertex (640,360);
 endShape();
 
 beginShape();  
  fill (180,147,137);
vertex (50,20);
vertex (640,0);
vertex (640,330);
vertex (590,350);
 endShape();
   
   beginShape();  
  fill (72,144,197);
vertex (0,0);
vertex (640,0);
vertex (640,215);
vertex (0,360);
 endShape();
 
  beginShape();  
  fill (248,52,45);
vertex (0,0);
vertex (210,0);
vertex (220,40);
vertex (0,120);
 endShape();
 
 
 fill(37,34,38);
 ellipse(-60,360,600,600);
 
   beginShape();  
  fill (212,209,212);
vertex (0,100);
vertex (325,0);
vertex (425,0);
vertex (0,125);
 endShape();
 
 beginShape();  
  fill (220,19,22);
vertex (425,0);
vertex (0,125);
vertex (mouseX,mouseY);
vertex (485,0);
 endShape();
 }

