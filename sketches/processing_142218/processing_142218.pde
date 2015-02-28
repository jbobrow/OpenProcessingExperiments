
/*
 Konkuk University
 SOS iDesign

Name: Da Eun Lee
 ID: leedaeun

*/

 
int value = 0;
float x,y;
float rX,rY;



void setup(){
  size(600,600);
  //noLoop();
  
    smooth();
 
  x=width/2;
y=height/2;


}

  
void draw(){
  
  fill(0,0,0);
  quad(0,0,600,0,600,600,0,600);
 
  

  
   float eyeRightX = map(mouseX, 0,width,155,50);
  ellipse(eyeRightX, 105, 50, 50);
  float eyeRightY = map(mouseY, 0,width,109,152);
  ellipse(eyeRightY, 105, 50, 50);
  
  float a = constrain (mouseX,155,213);
  float b = constrain(mouseY,109,152);
  float c = constrain(mouseX,379,438);
  float d = constrain(mouseY,109,152);
  
  float e = random(-10,10);
e=random(-10,10);

float f = random(-50,50);
f=random(-50,50);

 
  // head
  strokeWeight(2);
  fill(130,206,98);
  bezier(107,289,174,11,490,48,503,309);
  
    
  //eyes

strokeWeight(0);
   fill(255,255,255);
ellipse(a,b ,150,150);

strokeWeight(0);
 fill(255,255,255);
 ellipse(c,d,150,150);

 
 
 //nose
   strokeWeight(2);
 fill(121,191,92);
 bezier(184+e,216+e,181+e,174+e,214+e,161+e,245+e,194+e);
 
   strokeWeight(2);
 fill(121,191,92);
 bezier(351+e,191+e,377+e,162+e,420+e,169+e,412+e,215+e);


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
  
//Eyes
    noStroke();
  fill(0, 0, 0);
  ellipse(403, 155 ,76, 76);
  ellipse(195, 155 ,76, 76);

  
  //Heart
   stroke(0, 0, 0, 40); 
   strokeWeight(5); 
   fill(random(255),random(255),random(255), 200); 
   rectMode(CENTER); 
   rect(mouseX, mouseY, 20, 55); 
   triangle(mouseX-20, mouseY+55, mouseX+20, mouseY+55, mouseX, mouseY+89); 
   ellipse(mouseX, mouseY, 120, 120);
 
  rect(width-mouseX, mouseY, 20, 55); 
  triangle(width-mouseX-20, mouseY+55, width-mouseX+20, mouseY+55, width-mouseX, mouseY+89); 
  ellipse(width-mouseX, mouseY, 120, 120);
 
  rect(mouseX,  height-mouseY, 20, 55); 
  triangle(mouseX-20,  height-mouseY+55, mouseX+20,  height-mouseY+55, mouseX,  height-mouseY+89); 
  ellipse(mouseX,  height-mouseY, 120, 120);
 
  rect(width-mouseX, height-mouseY, 20, 55); 
  triangle(width-mouseX-20, height-mouseY+55, width-mouseX+20, height-mouseY+55, width-mouseX, height-mouseY+89); 
  ellipse(width-mouseX, height-mouseY, 120, 120);

}

if(keyPressed){


}
    }
    

void keyPressed(){
setup();
background(random(255), random(255), random(255), 100);



}


 /*import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }

 //-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; // Sensitivity = standard is 0.2*volumeF
 }

 //-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();
 } 
*/
