
//par Fanny C
//modified by Emilie R
 
float l = 30;
float h = 30;

 
void setup(){
  size(400,400);
  background(255);
  noFill();  //pas de remplissage
  smooth();  //lissage
  noStroke();
  frameRate(10);

   
}
 
void draw(){
   
    for(int i = 0; i<width; i+= 50) {  
      for (int j = 0; j<height; j += 50){
       
      fill(200);
      rect(i + random(10),j + random(10),l,h);
   }
 }  
     
    for(int i = 1; i<width; i+= 45) {  
    for (int j = 1; j<height; j += 45){
       
    fill(255);
    rect(i + random(-10,10),j + random(-10,10),l,h);
    }
    
}
}

void mousePressed(){
  strokeWeight(2);
  fill(255);
  for (float i=30; i<height; i+=50) {
    for (float j=30; j<height; j+=50) {
      stroke(random(200), random(200), mouseX);

    }

  }
}



