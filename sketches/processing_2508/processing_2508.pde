
boolean isDrawing = false;

void setup(){
 size(600,300);
background(20,40,60);
smooth();
  
};

void draw(){
  if(isDrawing) {
    stroke(24,53,86);
    fill(0,0,0);
    rect(mouseX,mouseY,250,200);
    
      line(150,300,pmouseX,pmouseY,mouseX,mouseY);
      stroke(200,211,59);
      
       }
    
    
  };
  
  void mousePressed(){
    isDrawing=!isDrawing;
  };

