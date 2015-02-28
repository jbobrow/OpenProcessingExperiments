
void setup(){
  
  size(400,400);
  colorMode(HSB);
}

void draw(){
  for (float x=0; x<width; x+=20){
    for (float y=0;y<height; y+=20){
      fill(random(70,x+y),random(100,x),random(x+y));
          if (mouseX>width/2){
            break;
          }else{
            loop();
          
          }
      rect(x,y,20,20);
    }

  }
  }




