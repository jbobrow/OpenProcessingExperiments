
int w =100;
int h =100;

void setup() {
  size(400, 600, P3D);
  noFill();
}

void draw() {
  background(0);

  specular(255, 255, 255);
  ambientLight(100, 100, 100);
  lightSpecular(204, 204, 204);
  directionalLight(132, 132, 132, -1, 1, 1);



  translate(width/2, height/2, 0); 
   rotateX(radians(((mouseY/(float)width)*180)-90));
  rotateY(radians(((mouseX/(float)height)*180)-90));  

  //rotateY(radians(frameCount));
  //rotateX(radians(frameCount));

  //body
  pushMatrix();
  scale(1, 1.3, 0.5);
  fill(255, 234, 0);
  box(100);
  popMatrix();


  translate(0, -105, 0); 

  //head 
  pushMatrix();    
  scale(1.3, 0.8, 0.7);
  box(100);
  popMatrix();


  //leg1
  pushMatrix();


  translate(-30, 195, 0); 
  scale(0.3, 0.5, 0.5);
  rotateX(radians(sin(frameCount/8)*30));
  box(100);
  popMatrix();

  //leg2  
  pushMatrix();
  translate(30, 195, 0); 
  scale(0.3, 0.5, 0.5);
  rotateX(radians(-sin(frameCount/8)*30));
  box(100);
  popMatrix();  




  //arm 1
  pushMatrix();
  translate(-85, 100, 0); 
  rotateX(radians(-sin(frameCount/7)*30));
  rotate(PI/6);
  scale(0.3, 0.8, 0.3);
  box(100);
  popMatrix();  

  //arm 2  
  pushMatrix();
  translate(85, 100, 0);   
  rotateX(radians(sin(frameCount/7)*30));
  rotate(PI/-6);
  scale(0.3, 0.8, 0.3);
  box(100);
  popMatrix();


  //left eye
  pushMatrix();
  translate(30, -50, 40); 
  translate(-5, 40, 0); 
  rotate(PI/-6);
  scale(0.1, 0.1, 0.1);
  fill(random(0, 255), random(0, 255), random(0, 255));
  box(100);
  popMatrix();  

  pushMatrix();
  translate(30, -50, 40); 
  translate(-60, 40, 0); 
  rotate(PI/-6);
  scale(0.1, 0.1, 0.1);
  fill(random(0, 255), random(0, 255), random(0, 255));
  box(100);

  popMatrix();  




  //mouth
  pushMatrix();
  translate(60, -20, 40); 
  translate(-60, 40, 0); 
  rotate(PI/-6);
  scale(0.2, 0.03, 0.1);
  fill(183, 0, 0);
  box(100);

  popMatrix();  


  pushMatrix();
  translate(60, -20, 40); 
  translate(-60, 40, 0); 
  rotate(PI/6);
  scale(0.2, 0.03, 0.1);
  fill(183, 0, 0);
  box(100);

  popMatrix();  




  //right ear
  pushMatrix();
  translate(30, -70, 10); 
  scale(0.2, 0.6, 0.3);
  fill(150, 74, 0);
  box(100);

  popMatrix();    


  //left ear
  pushMatrix();
  translate(-30, -70, 10); 
  scale(0.2, 0.6, 0.3);
  fill(150, 74, 0);
  box(100);

  popMatrix();  


  //tail
  pushMatrix();
  translate(-1, 150, -30); 
  scale(0.2, 0.2, 0.2);
  fill(255, 120, 0);
  box(100);

  popMatrix();  



  
  pushMatrix();
    translate(-1, 100, 30); 
  scale(0.5, 0.5, 0.1);
  fill(random(0, 255), random(0, 255), random(0, 255));
  box(100);

  popMatrix();
}



