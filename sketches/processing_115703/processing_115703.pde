
//  Brittany Cutrone
//  CCF2013 Midterm
//  Interactive spherical space

float angle;
PImage stars;



void setup(){
  size(1300, 700, P3D);
  stars = loadImage("stars.jpg");
}


//turn stroke on and off to create interesting effect
void draw() {
  background(0);
  noStroke();
  //image(stars, 0, 0);
  //resize(1300,700);

  
 
  pointLight(mouseY, 200, 200, mouseX, 100, 100);
 
  pushMatrix();
  //smooth();
    //pointLight(mouseY, 102, 126, mouseX, 30, mouseY);
  translate(125, 125, 0);
  fill(85,98,112);
  sphere(80);
  popMatrix();
  
  pushMatrix();
    //smooth();
    //pointLight(mouseY, 200, 200, mouseX, 40, 40);
  translate(320, 30 , 0);
  fill(199,244,100);
  sphere(65);
    popMatrix();

  
  pushMatrix();
  //smooth();
    //pointLight(mouseY, 200, 200, mouseX, 100, 100);
  translate(100, 375, 0);
  fill(255,107,107);
  sphere(110);
   popMatrix();

  
   pushMatrix();
   //smooth();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(250,200,0);
  fill(78,205,196);
  sphere(10); 
  popMatrix();
  
   pushMatrix();
   //smooth();
   //pointLight(mouseY, 200, 126, mouseX, 40, 40);
   translate(435,180,0);
  fill(196,77,88);
  sphere(50); 
  popMatrix();
  
     pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(425,500,0);
  fill(85,98,112);
  sphere(125); 
     //smooth(8);
  popMatrix();
  
   pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(350,300,0);
  fill(199,244,100);
  sphere(45); 
  //smooth(2);
  popMatrix();
  
       pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(600,600,0);
  fill(255,107,107);
  sphere(100); 
     //smooth(8);
  popMatrix();
  
   pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(700,300,0);
  fill(78,205,196);
  sphere(45); 
  //smooth(2);
  popMatrix();
  
   pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(100,600,0);
  fill(196,77,88);
  sphere(30); 
  //smooth(2);
  popMatrix();
  
  pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(600,75,0);
  fill(85,98,112);
  sphere(100); 
  //smooth(2);
  popMatrix();
  
   pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(850,400,0);
  fill(199,244,100);
  sphere(100); 
  //smooth(2);
  popMatrix();
  
    pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1000,100,0);
  fill(255,107,107);
  sphere(130); 
  //smooth(2);
  popMatrix();
  
    pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1000,600,0);
  fill(78,205,196);
  sphere(50); 
  //smooth(2);
  popMatrix();
  
     pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1300,400,0);
  fill(196,77,88);
  sphere(80); 
  //smooth(2);
  popMatrix();
  
    pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1200,200,0);
  fill(85,98,112);
  sphere(50); 
  //smooth(2);
  popMatrix();
  
  
    pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1250,650,0);
  fill(199,244,100);
  sphere(100); 
  //smooth(2);
  popMatrix();
  
      pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1100,500,0);
  fill(255,107,107);
  sphere(40); 
  //smooth(2);
  popMatrix();
  
      pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(800,650,0);
  fill(78,205,196);
  sphere(50); 
  //smooth(2);
  popMatrix();
 
 pushMatrix();
   //pointLight(mouseY, 102, 126, mouseX, 40, 40);
   translate(1000,275,0);
  fill(196,77,88);
  sphere(60); 
  //smooth(2);
  popMatrix();
}


