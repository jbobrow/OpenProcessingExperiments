
//par Fanny C, modified by Lucille D
 
float l = 30;
float h = 30;
 
void setup(){
  size(400,400);
  background(255);
  noFill();  //pas de remplissage
  smooth();  //lissage
  noStroke();
   
   
 // noLoop();
   
}
 
void draw(){
 
    for(int i = 0; i<width; i+= 50) {  
      for (int j = 0; j<height; j += 50){
       
      fill(150,0,0);
      rect(i + random(10),j + random(10),l,h);
   }
 }  
     
    for(int i = 1; i<width; i+= 45) {  
    for (int j = 1; j<height; j += 45){
      
    fill(mouseY,random(200),random(200));  
    rect(i + random(-5,5),j + random(-5,5),l,h);
    
    
    
    }
    
}

}


 
  



