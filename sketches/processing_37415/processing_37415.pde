
//i'm going to kill myself



void draw(){
  background(0);
  stroke(255);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      if((x % 20) == 0){
        line(x,y,x+9,y-6);
      } else {
        line(x,y,x+6,y+6);
        ellipse(x,y,map(mouseX,0,width,0,10),map(mouseX,0,width,0,10));
    }
   }
  }
 }

