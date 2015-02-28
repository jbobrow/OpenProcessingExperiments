
void setup(){
  size (500,500); 
  background(255);
  stroke(254,20);
}



void draw(){
  float col = random(255);//255;
float col2 = random(255);//0;
float col3 = random (255);//255; 
  fill(col,col2,col3,20);  
    ellipse(mouseX,mouseY,50,50);
   smooth();

}

void keyPressed(){
  if (key == 'r'){
   fill(255);
   rect(0,0,500,500); 
  }
  if(key == 's' || key == 'S'){  
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  
      if(filePath != null){  
        save(filePath + ".png");  
      }  
  }  
}

