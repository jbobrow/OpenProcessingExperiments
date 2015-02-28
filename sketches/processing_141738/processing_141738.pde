
int[][] grad = new int[1][1];



void setup() {
  grad = new int[8][8];
  size(512, 512);
  for(int x = 0; x < grad.length; x++){
    for(int y = 0; y < grad[x].length; y++){
      grad[x][y] = int(random(100, 255));
    }
  }
  
  for(int x = 0; x < grad.length; x++){
    for(int y = 0; y < grad[x].length; y++){
      int colorValue = grad[x][y];
      if (colorValue < 128){
        fill(colorValue, colorValue, 255 - colorValue/2);
        stroke(colorValue, colorValue, 255 - colorValue/2);
      }else{
        fill(255 - colorValue, colorValue, 255 - colorValue);
        stroke(255 - colorValue, colorValue, 255 - colorValue);
      }
      rect((x * width / grad.length), (y * height / grad[x].length), (width / grad.length), (height / grad[x].length));
    }
  }
}

void draw() {
}



void mouseClicked(){
  int[][] temp = new int[grad.length * 2 - 1][grad[1].length * 2 - 1];
  
  for(int x = 0; x < grad.length; x++){
    for(int y = 0; y < grad[x].length; y++){
      temp[x*2][y*2] = grad[x][y];
    }
  }
  
  for(int x = 0; x < grad.length - 1; x++){
    for(int y = 0; y < grad[x].length; y++){
      temp[x*2 + 1][y*2] = abs((grad[x][y] + grad[x + 1][y])/2 + int(random(-5, 5)));
    }
  }
  
  for(int x = 0; x < grad.length; x++){
    for(int y = 0; y < grad[x].length - 1; y++){
      temp[x*2][y*2 + 1] = abs((grad[x][y] + grad[x][y + 1])/2 + int(random(-5, 5)));
    }
  }
  
  for(int x = 0; x < grad.length - 1; x++){
    for(int y = 0; y < grad[x].length - 1; y++){
      temp[x*2 + 1][y*2 + 1] = abs((grad[x][y] + grad[x + 1][y] + grad[x][y + 1] + grad[x + 1][y + 1])/4 + int(random(-10, 10)));
    }
  }
  
  grad = temp;
  
  display();
  
}

void display() {
  for(int x = 0; x < grad.length; x++){
    for(int y = 0; y < grad[x].length; y++){
      int colorValue = grad[x][y];
      if (colorValue < 128){
        fill(colorValue*0.8, colorValue*0.8, 350 - colorValue/2);
        stroke(colorValue*0.8, colorValue*0.8, 350 - colorValue/2);
      }else{
        fill(200 - colorValue, colorValue, 200 - colorValue);
        stroke(200 - colorValue, colorValue, 200 - colorValue);
      }
      rect((x * width / grad.length), (y * height / grad[x].length), (width / grad.length), (height / grad[x].length));
    }
  }
}

void keyPressed() {
  if (key == 's') {
    save("background.png");
  }else{
    if (key == ' '){
      //create greater contrast, smooth it out
      int[][] temp = grad;
      for(int x = 1; x < grad.length - 1; x++){
        for(int y = 1; y < grad[x].length - 1; y++){
          int borderValue = 0;
          if (grad[x+1][y+1] > 128) {
            borderValue += 1;
          }
          if (grad[x][y+1] > 128) {
            borderValue += 1;
          }
          if (grad[x-1][y+1] > 128) {
            borderValue += 1;
          }
          if (grad[x+1][y] > 128) {
            borderValue += 1;
          }
          if (grad[x-1][y] > 128) {
            borderValue += 1;
          }
          if (grad[x+1][y-1] > 128) {
            borderValue += 1;
          }
          if (grad[x][y-1] > 128) {
            borderValue += 1;
          }
          if (grad[x-1][y-1] > 128) {
            borderValue += 1;
          }
          if ( temp[x][y] < 150 && temp[x][y] > 50){
            temp[x][y] += (5 * (borderValue - 4));
          }
          
        }
      }
      grad = temp;
      display();
    }
  }
}






