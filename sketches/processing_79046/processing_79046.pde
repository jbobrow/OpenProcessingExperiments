
void setup(){
size (600,600);
smooth();
frameRate(24);
}

void draw(){
  
  background(0);
  
  
  
  
  for(int i = 0 ; i < height / 1 ; i++){
    strokeWeight(3);
    stroke(255);
    noFill();
    line(1+i* mouseX,1 ,  1,1+i*mouseY);
    
  }
    for(int i = 0 ; i < height / 1 ; i++){
    strokeWeight(3);
    stroke(255);
    line(1 ,1+i* mouseX,  1+i*mouseY,1);
    
     
  }
   for(int j = 0 ; j < height / 1 ; j++){
          strokeWeight(4);
          stroke(110);
          rect(1 ,1+j* mouseX,  1+j*mouseY,1   ,1+j*mouseY,1, 5,9);
      }
 
 for(int i = 0 ; i < height / 1 ; i++){
    strokeWeight(4);
    stroke(110);
    noFill();
    rect(1+i* mouseX,1 ,  1,1+i*mouseY,  1,1+i*mouseY, 5,9    );
 
 }
 for(int j = 0 ; j < height / 1 ; j++){
          strokeWeight(4);
          stroke(110);
          rect(1 ,25+j* mouseX,  25+j*mouseY,1   ,1+j*mouseY,1, 5,9);
      }
 
 for(int i = 0 ; i < height / 1 ; i++){
    strokeWeight(4);
    stroke(110);
    noFill();
    rect(25+i* mouseX,1 ,  1,25+i*mouseY,  1,1+i*mouseY, 5,9    );
 
 }
 float cs = 1+mouseX;
  
  for(int i =0 ; i <width/cs; i = i+1){
    stroke(255);
   ellipse(i*cs, i*cs , cs-5 , cs-5);
   }
 
  
  
  for(int i =0 ; i <width/cs; i = i+1){
    stroke(255);
   ellipse(i*cs, i*cs , cs-25 , cs-25);
   }
 
  
  for(int i =0 ; i <width/cs; i = i+1){
    stroke(255);
   ellipse(i*cs, i*cs , cs-50 , cs-50);
   }
 
}


