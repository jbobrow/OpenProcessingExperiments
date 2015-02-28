
void setup(){
size(880,660,P3D);
smooth(); 
}
 
int m = 10;
 
void draw(){
 background(40,40,40);

 translate(width/2,height/2,-200);
 noStroke();
 translate(0,0,0);
 fill(237,214,0);
 sphere(32);
 
  
  
  //earth
pushMatrix();
 noStroke();
 rotateY(frameCount*PI*0.006);
 translate(360,0,0);
 fill(0,148,237);
 sphere(26);
 rotateY(m*PI*0.005);
 
 m++;
  
  
 stroke(255,255,50);
  strokeWeight(0);
  noFill();
  rotateX(PI/.05);
  noStroke();
  fill(250,200,150);
  translate(110,0,0);
  sphere(10);
  popMatrix();
  m++;
 
  stroke(255,255,50);
  strokeWeight(12);
  rotateY(frameCount*PI*-0.007);
  noFill();
  rotateX(PI/6);
  noStroke();
  fill(250,10,150);
  translate(260,20,10);
  sphere(28);
  popMatrix();
  
    stroke(255,255,50);
  strokeWeight(12);
  rotateY(frameCount*PI*-0.007);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(250,120,150);
  translate(150,20,0);
  sphere(12);
  popMatrix();
   m++;
 
 
  stroke(255,155,150);
  strokeWeight(12);
  rotateY(frameCount*PI*-0.001);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(250,10,150);
  translate(320,20,210);
  sphere(12);
  popMatrix();
  
    stroke(155,155,250);
  strokeWeight(12);
  rotateY(frameCount*PI*-0.001);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(250,220,250);
  translate(220,20,0);
  rotateY(m*PI*0.005);
  sphere(16);
  popMatrix();
  
     
     pushMatrix();
 noStroke();
 rotateY(frameCount*PI*0.0016);
 translate(360,0,0);
 fill(0,148,237);
 sphere(16);
 rotateY(m*PI*0.005);
 
  stroke(255,255,150);
  strokeWeight(8);
  rotateY(frameCount*PI*-0.001);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(250,10,150);
  translate(268,220,210);
  sphere(14);
  popMatrix();
  
    stroke(255,255,250);
  strokeWeight(12);
  rotateY(frameCount*PI*0.0001);
  noFill();
  rotateX(PI/22);
  noStroke();
  fill(150,120,150);
  translate(224,120,100);
  sphere(12);
  rotateY(m*PI*0.001);
  popMatrix();
  
    stroke(255,255,150);
  strokeWeight(8);
  rotateY(frameCount*PI*-0.001);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(250,10,150);
  translate(268,220,210);
  sphere(24);
  popMatrix();
  
    stroke(255,255,250);
  strokeWeight(12);
  rotateY(frameCount*PI*0.0001);
  noFill();
  rotateX(PI/22);
  noStroke();
  fill(150,120,150);
  translate(224,120,100);
  sphere(5);
  rotateY(m*PI*0.001);
  popMatrix();
  

}
                
