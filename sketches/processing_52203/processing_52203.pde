
int mode = 1;

void setup(){
  size(800,600);
}

void draw(){
  if(mode == 1){
    background(255,0,0);
  } else if(mode ==2){
    background(0,0,255);
  }
}

void keyPressed(){
  if(key == '1'){
    mode = 1;
      background(255,0,0);
      translate(width/2,height/2);
      for(int i = 0; i < 432; i++){
          rotate(radians(1));
          ellipse(mouseX,mouseY-100,mouseX*40,400/43);
      }
          } else if(key == '2'){
           mode = 2;
          background(255,123,31);
          translate(width/2,height/2);
          for(int i = 0; i < 432; i++){
        rotate(radians(3));
        ellipse(mouseX,mouseY-100,mouseX*40,400/43);
        }
                  } else if(key == '3'){
           mode = 3;
          background(255,223,131);
          translate(width/2,height/2);
          for(int i = 0; i < 432; i++){
        rotate(radians(3));
        ellipse(mouseX,mouseY-100,mouseX*40,400/43);
        }
                  } else if(key == '4'){
           mode = 4;
          background(9,23,231);
          translate(width/2,height/2);
          for(int i = 0; i < 432; i++){
        rotate(radians(3));
        ellipse(mouseX,mouseY-100,mouseX*40,400/43);
        }
        }
}

