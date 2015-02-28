
int mode = 1;


void setup(){
  size(1000,600);
  
  smooth();
  background(80);
}
  
void draw(){
  if(mode == 1){
    for(int x = 0;x < width; x+=10){
        for(int y = 0;y < height; y+=10){
          if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
           fill(mouseX,300,mouseY);
          } else{
           noFill();
          }
         stroke(80);
          ellipse(x,y,10,10);
          
          if(x%40 == 0 && y%40 ==0){
          ellipse(x,y,300,300);
        }
        }
      }
  }else if(mode == 2){
      for(int x = 0;x < width; x+=10){
      for(int y = 0;y < height; y+=10){
        if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
         fill(mouseY,300,mouseX);
        } else{
         noFill();
        }
        stroke(80);
        ellipse(x,y,20,20);
        
        if(x%40 == 0 && y%40 ==0){
        ellipse(x,y,400,200);
      }
  
      }
    }
  }else if(mode == 3){
     for(int x = 0;x < width; x+=10){
      for(int y = 0;y < height; y+=10){
        if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
         fill(mouseY,300,mouseX);
        } else{
         noFill();
        }
        stroke(80);
        ellipse(x,y,10,20);
        
        if(x%40 == 0 && y%40 ==0){
        ellipse(x,y,200,100);
      }
      }}
  }
      
}

void keyPressed(){
  if(key == 'a'){
     mode = 1;
  }else if(key == 's'){
    mode = 2;
  }else if(key == 'd'){
     mode = 3;
  } 
  
  
}
  
  
void mouseReleased(){
  background(80);
}


