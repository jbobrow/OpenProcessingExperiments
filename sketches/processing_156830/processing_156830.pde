
int i = 255;
int CC = 50;
int j;
float circleX;
float circleY;
float diameter;

void setup(){
  size(1000, 1000);
  
}

void draw(){
  background(0);
//  fill(i, 0, 0);
////  i--;
//  
//  do{ellipse(25+i, 25, 50, 50);
//    i++;
//  }
//  while(i<10);
//    
  
  for (int i=0; i<10; i++){     
//    declare variable equal to certain value, if its < or > to a value, add
    for (int j=0; j<10; j++){
      setCC (i, j);
      setDiameter();
      makeEllipse();
    }
  }
}




void setCC(int i, int j){
  circleX = (mouseY/1000*CC)+(i*CC);
  circleY = (mouseX/1000*CC)+(j*CC+diameter);
}

void setDiameter (){
  diameter = dist(mouseX, mouseY, circleX, circleY);
}


void makeEllipse(){
  fill((diameter/mouseX*circleX), (diameter/mouseY*circleY), random(255));
  stroke((diameter/mouseX*circleX), (diameter/mouseY*circleY), 255);
  line(circleX+diameter, circleY, diameter+circleX,diameter);
}
