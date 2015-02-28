
void setup(){
size(400,400,P3D);

camera(-200, -150, 200, width/2, height/2, -100, 0, 1, 0);


}
 
void draw(){
 background(0);
 translate(width/2,height/2,-100);
  
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI * 0.05);  // green mercury
 translate(100,0,0);
 fill(90,100,50);
 sphere(8);
 popMatrix();
 
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/3 * 0.05);  // blue
 translate(150,0,0);
 fill(10,100,255);
 sphere(10);
 popMatrix();
 
  
 
  pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/4 * 0.05);  //green
 translate(200,0,0);
 fill(10,200,5);
 sphere(15);
 popMatrix();
 
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/6 * 0.05);
 translate(270,0,0);
 fill(253,254,50);
 sphere(20);
 popMatrix();
 
 
  
 pushMatrix();
 noStroke();
 rotateY(frameCount * PI/6 * 0.05);
 fill(255,0,0,205);
 sphere(60);
 popMatrix();
 

}


