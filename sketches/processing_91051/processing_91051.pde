
float incrementRed=7.2;
float incrementBlack=5;
int angle=30;
int verticalStart=-25;
int horizontalEnd=+25;

void setup(){
  size(490,500);
  background(242,219,171);
  smooth();
}

void draw(){
  //White Lines
  noStroke();
  rect(195,0,30,500);
  rect(255,0,30,500);
  rect(0,195,500,30);
  rect(0,255,500,30);
  
  
  //red line vertical
  stroke(149,10,14);
  for(int i=verticalStart;i<=height;i+=incrementRed){
    line(35,i+angle-5,50,i); //left
    line(445,i+angle-5,460,i);  //right
  }
  //red line horizontal
  for(int j=0; j<=width+horizontalEnd; j+=incrementRed){
    line(j,20,j-angle,40); //top
    line(j,460,j-angle,480); //bottom
  }
  
  //black lines horizontal
  stroke(0);
  for(int i=0; i<=width+horizontalEnd; i+=incrementBlack){
    line(i,165,i-angle,195);
  }
  for(int i=0; i<=width+horizontalEnd; i+=incrementBlack){
    line(i,225,i-angle,255);
  }
  for(int i=0; i<=width+horizontalEnd; i+=incrementBlack){
    line(i,285,i-angle,315);
  }
  
  //black lines vertical
  stroke(0);
  for(int j=verticalStart; j<=height; j+=incrementBlack){
    line(165,j+angle,195,j);
  }
  for(int j=verticalStart; j<=height; j+=incrementBlack){
    line(225,j+angle,255,j);
  }
  for(int j=verticalStart; j<=height; j+=incrementBlack){
    line(285,j+angle,315,j);
  }
  
}

