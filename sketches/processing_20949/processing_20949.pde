
void setup(){
size(400,400,P3D);
camera(200,-200, 300, width/2, height/2, 0, 0, 1,0 );
}
int i=0;
void planet(float x, float y,float z,int r) {
 pushMatrix();
 stroke(180);
 rotateY(frameCount*PI/x * 0.05);
 translate(y,0,0);
 fill(r);
 sphere(z);
 popMatrix();
}
 
void draw(){
 background(0);
 lights();
 translate(width/2,height/2,-100);
 
 pushMatrix();
 stroke(237,155,48);
 rotateY(frameCount * PI/12 * 0.05);
 fill(237,155,48);
 sphere(60);
 stroke(255);
 noFill();
 popMatrix();
 
 pushMatrix();
 stroke(136,180,220);
 rotateY(frameCount * -PI/6 * 0.05);
 translate(200,0,0);
 fill(136,180,220);
 sphere(30);
 
 stroke(200,200,100);
 rotateY(frameCount * -PI/3 * 0.05);
 translate(60,0,0);
 fill(200,200,100);
 sphere(20);
 popMatrix();

 planet(6,100,15,230);
 planet(4,150,20,160);
 planet(5,150,10,120);
 planet(3,250,15,180);
 planet(4,300,20,160);
}


