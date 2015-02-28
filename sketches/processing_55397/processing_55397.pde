
//Midterm: Drawing Program
int mode = 1;

//Set Up
void setup(){
  size(800,800);
  smooth();
  noStroke();
  background(255);
}
 
void draw(){
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mode ==1){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        float speedX = abs(mouseX-pmouseX);
        float speedY = abs(mouseY-pmouseY);
          for(int i = 0;i < speedX; i++){
          rect(mouseX,mouseY,i*speedY,i/cos(x));
          fill(random(255),random(255),random(255),75);
        }
      }
    }

  else if(mode == 2){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        float speedX = abs(mouseX-pmouseX);
        float speedY = abs(mouseY-pmouseY);
          for(int i = 0;i < speedX; i++){
          ellipse(mouseX,mouseY,i*3,i/cos(y));
          fill(random(255),random(255),random(255),75);
        }
      }
    }

  else if(mode == 3){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        float speedX = abs(mouseX-pmouseX);
        float speedY = abs(mouseY-pmouseY);
          for(int i = 0;i < speedX; i++){
          rect(mouseX,mouseY,i*3,i/sin(x));
          fill(255,75);
        }
      }
  }
  
  else if(mode == 4){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        float speedX = abs(mouseX-pmouseX);
        float speedY = abs(mouseY-pmouseY);
          for(int i = 0;i < speedX; i++){
          ellipse(mouseX,mouseY,i/cos(x),i*3);
          fill(255,75);
        }
      }
    }
  }
  }
}
    
  
   
//Image Reset
void mouseReleased(){
     background(random(255),random(255),random(255));
}
     void mousePressed(){
       background(0);
}

void keyPressed(){
  if(key == '1'){
    mode = 1;
  }
  else if(key == '2'){
    mode = 2;
  }
  else if(key == '3'){
    mode = 3;
  }
  else if(key == '4'){
    mode = 4;
  }
}

