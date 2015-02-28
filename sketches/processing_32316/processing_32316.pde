
void setup (){
  size (283,567); //width and height
  background (0); //background colour
  stroke(255);//colour of line
  strokeWeight(0.5);//thickness of line



for(int i = 0; i < width; i = i+2){
      for(int j = height; j >0; j = j-2){
       float choice = random (2);
        if(choice<=1){
        stroke(255);
          point(i,j);
        }
        else {
        stroke(0);
         point(i,j);
        }
     }
  }

}

void draw(){
  
}





void keyPressed(){
  if(key == 's' || key == 'S'){  
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  
      if(filePath != null){  
        save(filePath + ".png");  
      }  
  }  
}

