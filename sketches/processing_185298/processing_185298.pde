

void setup(){
  size(600,400,P3D);
}
void draw(){
  background(50);
  translate(width/2,420,-200);
 for(float ang=0;ang<=PI; ang+=PI/24){
    pushMatrix();
    stroke(#717170);
  rotateZ(ang*4);
    translate(180,0,100);
    box(40);
//    box(50);
    popMatrix();
  }
}


