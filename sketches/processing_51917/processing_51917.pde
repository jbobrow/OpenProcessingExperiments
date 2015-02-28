
Cell[][] grid;
PFont f;
boolean word = true;
int moveX;

int cols = 50;
int rows = 30;

void setup() {
  size(800,500);
  f = createFont("Comic Sans MS",60, true);
  background(0);
  moveX = 0;
  noCursor();
  grid = new Cell[cols][rows];
  for (int a = 0; a < cols; a++) {
    for (int b = 0; b < rows; b++) {
      grid[a][b] = new Cell(a*20,b*20,20,20,a+b);
    }
  }
}

void draw() {
  textword();
  rect(mouseX,mouseY,15,15);
  fill(random(255),random(100),random(255));
  stroke(random(255),random(100),random(255));
  strokeWeight(4);
  
  if(mousePressed){
    word=false;
  }else{
    word=true;
  }
  if(word){
  }else{
    size(800,500);
     
 for (int a = 0; a < cols; a++) {
    for (int b = 0; b < rows; b++) {
      grid[a][b].oscillate();
      grid[a][b].display();
    }
  }
  
  }
 
  } 

class Cell {
  float x,y;   
  float w,h;   
  float angle; 


  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  

  void oscillate() {
    angle += 0.02; 
  }

  void display() {
    stroke(random(255),random(255),random(255));
    // Color calculated using sine wave
    fill(random(255),random(255),random(255));
    rect(x,y,w,h); 
  }
}
 
  
void textword(){
  background(0);
  textFont(f);
  fill(random(255),random(100),random(200));
  textAlign(RIGHT);
  text("Hi." ,moveX,100);
  textAlign (LEFT) ;
  text("Hello!" ,moveX,200);
  textAlign(CENTER);
  text("Hi~" ,moveX,400);
  
    moveX++; moveX=moveX+1;
  if(moveX+10>=width){
    moveX=0;
  }
 
}

void mouseMoved(){
  background(0);
   textFont(f);
  fill(random(255),random(100),random(200));
  textAlign(LEFT);
  text("Hi." ,moveX/6,100);
  textAlign (LEFT) ;
  text("Hello!" ,moveX/2,200);
  textAlign(LEFT);
  text("Hi~" ,moveX/3,400);
  textSize(40);
  textAlign(CENTER);
  text("Hi.",moveX/7,100);
  text("Hello!",moveX/3,200);
  text("Hi~",moveX/4,400); 
  textSize(30);
  textAlign(CENTER);
  text("Hi.",moveX/8,100);
  text("Hello!",moveX/4,200);
  text("Hi~",moveX/5,400); 
  
  moveX++;
  if(moveX+40>=width){
    moveX=0;
  }



}




