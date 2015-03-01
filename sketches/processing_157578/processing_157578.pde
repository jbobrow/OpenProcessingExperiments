
void setup() {
size(750,500,P3D);
background(200,0,0);
smooth();

}

float w = 100;
float l = 100;
float h = 100;

void draw() {
  background(200+40*sin(millis()/1800)*sin(millis()/1800),73,73);

   noFill();
   stroke(255);
    for(int i=0;i<50;i++)
  {
  pushMatrix();
  translate(i*10,0,i*30);
  
  translate (300,200,10);
  scale(0.6);
     for(int i = 0; i<100; i++) {
    
      box(w,l,h);
      scale (0.9+0.10*sin(millis()/1800));
      rotateZ(map(mouseY,0,height,0,-2*PI,2*PI));
       rotateY(map(mouseX,0,height,0,-2*PI,2*PI));
      translate(90,0,0);   
  }
  
  
   for(int i = 0; i<100; i++) {
      box(w,l,h);
      scale (0.9+0.10*cos(millis()/1800));
      rotateZ(radians(10+(mouseY*2/75)));
      translate(50,0,0);   
  }
 }
 popMatrix();
}
