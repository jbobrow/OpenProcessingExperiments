
void setup(){
size(300,300,P3D);
}

void draw(){
 background(255); 
 lights();
 translate(width/2,height/2,-100);
 
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/6 * 0.05);
 translate(150,0,0);
 fill(255,255,0);
 sphere(40);
 popMatrix();
 
 pushMatrix();
 stroke(140,0,0);
 rotateY(frameCount * PI/6 * 0.05); 
 fill(255,0,0,100); 
 box(200);
 popMatrix();
 pushMatrix();
 
 translate(0,50 * sin(frameCount * .05),0);
 rotateY(PI/3);
 rotateX(frameCount * PI/3 * 0.05);
 stroke(0,0,180);
 fill(0,0,255,100); 
 box(50,100,50); 
 popMatrix();
}

