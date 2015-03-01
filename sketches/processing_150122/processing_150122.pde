

int cols = 3;
int rows = 3;

boolean play = false;

Cell[][] cell = new Cell[cols][rows];

void setup(){
size(300,300);

for (int i = 0; i < cols;i++){
  for (int j = 0; j <rows;j++){
  cell[i][j] = new Cell(i*width/3,j*height/3,100,100);
  }
}
}


void draw(){
  
  if(play == false){
    background(255);
    fill(0);
    textAlign(CENTER,BOTTOM);
textSize(26);
text("Tic Tak Toe!",150,150);
textAlign(CENTER,TOP);
textSize(10);
text("press A to start ! O is left click, X is right click,",150,150);
text(" R to reset and S to come back here ",150,160);

if(keyPressed && key == 'a' || key == 'A'){
play = true ;
}
}else if(play == true) {
  
background(255);
noFill();
for (int i = 0; i < cols;i++){
  for (int j = 0; j <rows;j++){
  cell[i][j].display();
  cell[i][j].reset();
  }
}
if(keyPressed && key == 's' || key == 'S'){
play = false ;
}
}
}

void mousePressed(){
for (int i = 0; i < cols;i++){
  for (int j = 0; j <rows;j++){
  cell[i][j].click(mouseX,mouseY);
  }
}
}
class Cell{
float x,y;
float w,h;
int state=0;

Cell(float tempX, float tempY, float tempW,float tempH){
x=tempX;
y=tempY;
w=tempW;
h=tempH;
}


void click(int mx, int my){
if(mx>x&&mx<x+100){
  if(my >y&& my < y+100){
   if (mousePressed && (mouseButton == LEFT) && state == 0 ) {
    state = 1;
  } else if (mousePressed && (mouseButton == RIGHT)&& state == 0) {
    state = 2;
  }
  }
}
}

void display(){
  
  if (state == 0){
  stroke(0);
rect(x,y,w,h);
  }
  else if (state == 1){
  stroke(0);
  rect(x,y,w,h);
ellipse(x+50,y+50,w,h);
  }
  else if (state == 2){
  stroke(0);
  rect(x,y,w,h);
line(x,y,x+100,y+100);
line(x+100,y,x,y+100);
  }
}

void reset(){
if(keyPressed && key == 'r'||key == 'R' && state!=0){
state = 0;
}

}




}


