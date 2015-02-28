
import processing.pdf.*;

void setup (){
  
  size (312,595); //width and height
 // beginRecord(PDF, "version1.pdf");
  background (0); //background colour
  stroke(255,218,3);//colour of line
  strokeWeight(1);//thickness of line

  int xAmount =15;
  int yAmount = 15;

  for(int i = 0; i < width; i = i+xAmount){
    for(int j = height; j >0; j = j-yAmount){
      float choice = random (4);
        if(choice<=1){
          line(i,j, i+xAmount,j-yAmount);
        }
        else if (choice>1&&choice<=2){
          line(i,j-yAmount,i+xAmount,j);
        }
        else if (choice>2&&choice<=3){
          line(i,j, i,j-yAmount);
        }
        else if (choice>3&&choice<=4){
          line(i,j,i+xAmount,j);
        }
     }
  }
//endRecord();
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

void mousePressed(){
 fill(0);
 noStroke();
  rect(0,0,width, height);
 
 stroke(255,218,3);//colour of line
  strokeWeight(1);
  
  int xAmount =15;
  int yAmount = 15;

  for(int i = 0; i < width; i = i+xAmount){
    for(int j = height; j >0; j = j-yAmount){
      float choice = random (4);
        if(choice<=1){
          line(i,j, i+xAmount,j-yAmount);
        }
        else if (choice>1&&choice<=2){
          line(i,j-yAmount,i+xAmount,j);
        }
        else if (choice>2&&choice<=3){
          line(i,j, i,j-yAmount);
        }
        else if (choice>3&&choice<=4){
          line(i,j,i+xAmount,j);
        }
     }
}
}

