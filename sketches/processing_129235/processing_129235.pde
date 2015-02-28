
int counter;
int keyLevel = 1;
int cols, rows;
int randColor = 50;



void setup() {  
  size(300, 300);
  background(255);
  counter = 0;
  cols = width/keyLevel;
  rows = height/keyLevel;
}

void draw() {
  counter++;
  noStroke();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*cols;
      int y = j*rows;
      fill(random(255),(randColor+100),255,randColor);
      rect(x,y,cols,rows);
      }
   }
} 
  

void keyPressed(){
    if(key == 'f' && keyLevel < 15){
        keyLevel = keyLevel + 1;
        cols = width/keyLevel;
        rows = height/keyLevel;
        randColor = random(100);
    }
    if(key == 'j' && keyLevel > 2){
        keyLevel = keyLevel - 1;
        cols = width/keyLevel;
        rows = height/keyLevel;
        randColor = random(100);
    }
    if(key == ' '){
        keyLevel = 1;
        cols = width/keyLevel;
        rows = height/keyLevel;
        randColor = 50;
    }
}
