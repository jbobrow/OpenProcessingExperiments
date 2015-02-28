
int a=0;
float b=0;

void setup() {
  size(400, 400);
}

void draw() {
  background(120,200,170);
  fill(0);
  stroke(250,113,60);
  //rect(0,a,width,20);

  for (int y=10; y<=height; y=y+20) {
          strokeWeight (2);
          line (0, y, width, y);
  }
if(mousePressed) {
   
     for (int k=0; k<=height; k=k+int (random(2, 10))) {
       strokeWeight (random (2,7));
     
       for (int w=0; w<=width; w=w+20){
    line (w, k,20+w, k);
       }
     }
  }
}
//void mouseDragged(){
//  if (mouseY>a){
//  a=mouseY;
//  }
//}
//


