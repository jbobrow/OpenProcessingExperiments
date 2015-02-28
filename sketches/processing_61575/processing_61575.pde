
    int vineXA = 250;
    int vineYA = 0;
    int vineXB = 250;
    int vineYB = 500;
    int vineColour = 0;
    int vineStroke = 1;
    
    int fanXA = vineXA;
    int fanYA = 0;
    int fanXB = 250;
    int fanYB = 500;
    int fanColour = 0;
    int fanStroke = 1;
    
    float vineRot = 10;
    float fanRot = 10;
  

void setup(){
  size(500,500);
  background(255);
  smooth();
  
}

void draw(){
  background(255);
  
  vine();
//rotate(10);
  fan();


}


void vine(){
  
  
    if (vineYB < 100){
 vineYB = vineYB +50;
}
    
    for(int vineYB = 0;vineYB <500; vineYB = vineYB+20){
    
    translate(vineXA,vineXB);
 rotate (mouseY);
 translate(-vineXA,-vineXB);
      
    stroke(vineColour);
    strokeWeight(vineStroke);
    line(mouseY,mouseY, mouseY,mouseX);
    }
    
    if (vineRot <200){
    vineXA = 250;
    vineYA = 250;
    vineXB = 250;
    vineYB = 250;
  }
  
  
}  
    
    void fan(){
     
     
     
     for(int fanYB = 0;fanYB <500; fanYB = fanYB+20) {
     
    translate(fanXA,fanXB);
 rotate (mouseY);
 translate(-fanXA,-fanXB);
         
       
       
     stroke(fanColour);
     strokeWeight(fanStroke);
     line(mouseY,mouseY, mouseX,mouseX);
     
     }
    
 
    
    }
    
    
    
    

