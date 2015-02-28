


void setup(){
size(1280, 1000);
smooth();
colorMode(HSB, 360, 100, 100);
frameRate(5);
noStroke();
background(219, 1, 96);
}

void draw(){
  for(int i = 5; i<width; i += 80) {//horizontal column
    for(int j = 5; j<height; j += 80){//vertical column
      if (int(random(0, 2)) == 0) {
        fill(random(360),51, 55);//how i got random colors
      }
      else{
        fill(random(360), 50, 96);//how i got random colors
      }
      
      ellipse(i, j, 30, 30);
      fill(43, 32, 2);
      ellipse(i, 85, 30, 30);
      ellipse(85, j, 30, 30);
    }
  }
}





