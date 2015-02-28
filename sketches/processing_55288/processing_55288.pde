
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
  if(mode == 1){
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(random(255),random(255),random(255));
        rect(400,400,0,0);
        float speedX = abs(mouseX-pmouseX);
          for(int i = 0;i < speedX; i++){
          rect(mouseX,mouseY,i*3,i*3);
          fill(random(255),random(255),random(255),75);
        }
      }
    }
  }
}

  if(mode == 2){
    for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(random(255),random(255),random(255));
        ellipse(400,400,0,0);
        float speedX = abs(mouseX-pmouseX);
          for(int i = 0;i < speedX; i++){
          ellipse(mouseX,mouseY,i*3,i*3);
          fill(random(255),random(255),random(255),75);
        }
      }
    }
  }
}

  if(mode == 3){
    for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(random(255),random(255),random(255));
        rect(400,400,0,0);
        float speedX = abs(mouseX-pmouseX);
          for(int i = 0;i < speedX; i++){
          rect(mouseX,mouseY,i*3,i*3);
          fill(255,75);
        }
      }
    }
  }
  }
  
  if(mode == 4){
    for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(random(255),random(255),random(255));
        ellipse(400,400,0,0);
        float speedX = abs(mouseX-pmouseX);
          for(int i = 0;i < speedX; i++){
          ellipse(mouseX,mouseY,i*3,i*3);
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

