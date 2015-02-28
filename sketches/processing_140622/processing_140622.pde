
/*
 Konkuk University
 SOS iDesign

Name: Da Eun Lee
 ID: leedaeun

*/

PImage img; 
int value = 0;


void setup(){
  size(600,600);
  //noLoop();
    smooth(100);
    img = loadImage ("aa.jpg"); 
  background(0);
}


void draw(){
    println(mouseX,":",mouseY);
  //image (img, 0, 0); 
  
 
  // head
  strokeWeight(2);
  fill(130,206,98);
  bezier(107,289,174,11,490,48,503,309);
  
  
  //eyes
   strokeWeight(2);
   fill(255,255,255);
ellipse(190,142,150,150);

  strokeWeight(2);
 fill(255,255,255);
 ellipse(409,142,150,150);
 
 
 //nose
   strokeWeight(2);
 fill(121,191,92);
 bezier(184,216,181,174,214,161,245,194);
 
   strokeWeight(2);
 fill(121,191,92);
 bezier(351,191,377,162,420,169,412,215);


// All mouse 
  strokeWeight(2);
 fill(121,191,92);
 bezier(88,364,103,143,482,115,513,356);
 
   strokeWeight(2);
 fill(121,191,92);
 bezier(88,364,77,388,101,410,124,403);
 
   strokeWeight(2);
  fill(121,191,92,0);
  bezier(124,403,215,355,403,362,480,401);
  
    strokeWeight(2);
  fill(121,191,92);
  bezier(480,401, 510,401,523,380,513,356);
  
    strokeWeight(2);
  fill(255,255,255);
  bezier(158,151,157,117,192,103,220,146);
  
    strokeWeight(2);
  fill(255,255,255);
  bezier(378,142,400,104,436,121,441,156);
  
    strokeWeight(2);
  fill(121,191,92);
  bezier(120,415,223,339,368,339,479,408);
  
    strokeWeight(2);
  fill(121,191,92);
  bezier(120,415,109,418,109,434,123,449);
  
    strokeWeight(2);
  fill(121,191,92);
  bezier(123,449,226,542,384,542,482,452);
  
    strokeWeight(2);
  fill(121,191,92);
  bezier(482,452,497,432,497,432,479,408);
  
 strokeWeight(0);
  fill(121,191,92);
  triangle(88,364,124,403,243,361);
  
 strokeWeight(0);
  fill(121,191,92);
  triangle(351,358,513,356,479,399);
  
   strokeWeight(0);
    fill(121,191,92);
  quad(120,415,123,449,482,452,479,408);

    


    
if(mousePressed){
    fill(224,45,99);
    bezier(252,363,276,477,348,485,369,365);


//background shap & bonus score

 translate(mouseX, mouseY);
  fill(random(600));
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
}

  


    }
    

void keyPressed(){
setup();

 }

