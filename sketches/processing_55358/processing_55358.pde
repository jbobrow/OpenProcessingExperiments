
int x,y,prevX,prevY;
int mode = 3;
float angle,easing;

void setup(){
 size(1000,800);
 smooth();
 background(0);
 strokeWeight(1);
 for(int i = 0; i < 100000; i++){
   x = int(random(width));
   y = int(random(height));
   }
   prevX = x;
   prevY = y;
 }

void draw(){
    if(mode == 1){
 line(mouseX,mouseY,prevX,prevY);
 println(dist(mouseX,mouseY,prevX,prevY));
   float ellSize = 0;
  for(int x = 0; x < width; x+=8){
    for(int y = 0; y < height; y+=8){
      ellSize = sin(x*y)*10;
      fill(255,pmouseX,pmouseY);
      ellipse(mouseX,100,32,ellSize);
      rotate(radians(pmouseX));
 

}
  }
    }
  else if (mode == 2){
  float ellSize = 0;
  for(int x = 0; x < width; x+=8){
    for(int y = 0; y < height; y+=8){
      ellSize = sin(x*y)*10;
      fill(255,pmouseX,pmouseY);
      ellipse(x,y,ellSize,ellSize);
      rotate(radians(mouseY));

    }
}
    }
    else if (mode == 3){
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      strokeWeight(0.1);
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(255,10);
  float speedX = abs(mouseX-pmouseX);
  for(int i = 0;i < speedX; i++){
    strokeWeight(random(255));
    ellipse(mouseX,mouseY,i*2,i);
    fill(random(255),random(255),random(255));
  }
      }
      }
  }
    }
}
      


    


  void keyPressed(){
  if(key == '1'){
    mode = 1;
  }
    if(key == '2'){
      mode = 2;
    }
    if(key == '3'){
      mode = 3;
    }
  }


void mouseReleased(){
     background(255,255,255);
}

void mousePressed(){
  background(0);
}




