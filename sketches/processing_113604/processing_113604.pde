
void setup(){
  size(600,600);
  background (255,13,13);
}

void draw(){
  noStroke();
      fill(0);
      smooth();
      rect(80,200,200,200);
      ellipse(425,300,200,200);
      


  if(mouseX > 80 && mouseX < 280){ //Left
          fill(152,33,155);
          rect(80,200,200,200);
          fill(31,145,219);
          rect(100,227,155,155,8);
          fill(0);
          rect(120,250,115,115,10);
  }
  
  if(mouseX > 320 && mouseX < 600){ //Right
      fill(40,198,86);
      ellipse(425,300,200,200);
      fill(61,16,62);
      ellipse(425,300,150,150);
      fill(0);
      ellipse(425,300,100,100);
      
  
      
  }
}



