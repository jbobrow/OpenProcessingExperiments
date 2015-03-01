
int rows = 50;
int cols = 50;

float xunit;
float yunit;

int i;
int j;

int [][]field = new int [rows+2][cols+2];
int [][]neighbors;

int colours = 2;

boolean mover=false;
void setup(){
  size(500,500);
  noStroke();
  xunit = width/rows;
  yunit = height/cols;
  
}
void draw(){
  background(0);
  neighbors = new int [rows+2][cols+2];
  strokeWeight(1);
  show();
  strokeWeight(3);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  neighbors();
  if(mover){
    move();
  }
  if (mousePressed){
    
    field[int(mouseX*rows/width)][int(mouseY*cols/height)]=1;
  }
}
void keyPressed(){
  if (key == 'p'){
    mover=false;
  }
  if (key == 'm'){
    mover=true;
  }
  if (key == 'w'){
    clearing();
    mover=false;
  }
  if (key == 'r'){
    Random();
    mover=true;
  }
  /*if (key == CODED) {
  if (keyCode == RIGHT){
    mouseX+=5;
  }
  if (keyCode == LEFT){
    mouseX-=5;
  }
  if (keyCode == UP){
    mouseY-=5;
  }
  if (keyCode == DOWN){
    mouseY+=5;
  }
  }*/
}
void filled(int COLOR){
  switch(COLOR){
    case 0:
      fill(200,0,0);
      break;
    case 1:
      fill(255,200,0);
      break;
    case 2:
      fill(250,100,0);
      break;
    case 3:
      fill(255,255,0);
      break;
    case 4:
      fill(255,0,255);
      break;
    case 5:
      fill(0,255,255);
      break;
    case 6:
      fill(255,128,0);
      break;
    case 7:
      fill(128,0,255);
      break;
    
    default:
      fill(255);
  }
}
void move(){
  int [][]field2 = new int [rows+2][cols+2];
  for(i=0; i <= rows+1; i++){
    for(j=0; j <= cols+1; j++){
      if (field[i][j]==1){
        if (neighbors[i][j] < 2){
          field2[i][j]=0;
        }
        else if(neighbors[i][j] > 3){
          field2[i][j]=0;
        }
        else {
          field2[i][j]=1;
        }
      }
      if (field[i][j]==0){
        if ((neighbors[i][j] == 3)||(neighbors[i][j] == 3)){
          field2[i][j]=1;
        }
        else {
          field2[i][j]=0;
        }
      }
      
    }
  }
  for(i=0; i <= rows+1; i++){
    for(j=0; j <= cols+1; j++){
      field[i][j] = field2[i][j];
    }
  }
}
void clearing(){
  for(i=0; i <= rows+1; i++){
    for(j=0; j <= cols+1; j++){
      field[i][j]=0;
    }
  }
}
void show(){
  for(i=0; i<rows; i++){//the squares
    for(j=0; j<cols; j++){
      filled(field[i][j]);
      rect(i*(xunit), j*(yunit), xunit, yunit);
    }
  }
}
void neighbors(){
  for(i=0; i<rows; i++){//the neighbor number
    for(j=0; j<cols; j++){
      neighbors[i+1][j+1] = field[i][j] + field[i+1][j]
      + field[i+2][j] + field[i][j+1] + field[i+2][j+1]
      + field[i][j+2] + field[i+1][j+2] + field[i+2][j+2];
      fill(0,200,0);
      textSize(xunit);
      //text(neighbors[i+1][j+1], (i+1)*xunit, (j+2)*yunit);
    }
  }
}
void Random(){
  for(i=0; i<rows; i++){//another random
    for(j=0; j<cols; j++){
      field[i][j] = int(random(0,colours));
    }
  }
}
