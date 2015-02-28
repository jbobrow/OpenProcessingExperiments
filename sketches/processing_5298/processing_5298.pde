
float a=0;

void setup(){
  size(600,600,P3D);
  background(0);
  

}
void draw() {
   background(random(60),50,0);
   pushMatrix();
   translate(300,-2000,-3500);
   

for(int i=0;i<100;i++) {
  translate(1200,0,-1200);
  noStroke();
  fill(255,100,100,100);
  sphereDetail(10,10);
  sphere(100);
  translate(sin(i*10),50,-500);
  rotateY(a);
a+=0.00001;
  
}
popMatrix();


}

