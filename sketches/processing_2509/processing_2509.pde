
boolean isDrawing = false;

void setup(){
  
  size(500,500);
  background(0,0,0);
  smooth();
  
};


void draw(){
  
  if(isDrawing) {
  stroke(250,250,250,200);
  line(250,250,mouseX,mouseY);
  stroke(250,40,12,200);
  fill(250,40,12,200);
  rect(mouseX,mouseY,10,10);
  
   if(isDrawing) {
    stroke(35,200,248,200);
    line(200,200,mouseX,mouseY);
    stroke(250,40,12,200);
    fill(250,40,12,200);
    rect(mouseX,mouseY,12,12);
   }
  
  
  line(200,200,pmouseX,pmouseY,mouseX,mouseY);
  stroke(243,48,250,200);
  fill(139,27,143,200);
  ellipse(mouseX,mouseY,5,5);
  stroke(248,235,33,200);
  line(mouseX,mouseY, mouseX + random(0,20) , mouseY + random(0,20));
  }
  
  };
  
 
    
  
  void mousePressed(){
    
    isDrawing=!isDrawing;
    
  };

