
color linecolor = #FFFFFF;

void setup(){
  size(1000,1000);
}

void draw(){
  background(#000000);
  for(int i=0;i<12;i=i+1){
    horizontalLine(i*100);
    verticalLine(i*100);
  }
  for(int i=0;i<12;i=i+1){
    if(mousePressed){
      circleRow(i);
    }
  }
}

void horizontalLine(float yPos){
  float y = yPos,x,prev_x=0,prev_y=yPos;
  float a = PI/2;
  float inc = TWO_PI/100.0;
  for(int i=0; i<1100; i=i+1) {
    x = i;
    y = y + sin(a) * max(((mouseY-70)/1000.)*3.,0);
    if(mousePressed){
      stroke(#606060);
    }else{
      stroke(#FFFFFF);
    }
    strokeWeight(15);
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}

void verticalLine(float xPos){
  float y,x = xPos,prev_x=xPos,prev_y=0;
  float a = PI/2;
  float inc = TWO_PI/100.0;
  for(int i=0; i<1100; i=i+1) {
    y = i;
    x = x - sin(a) * max(((mouseY-70)/1000.)*3.,0);
    if(mousePressed){
      stroke(#606060);
    }else{
      stroke(#FFFFFF);
    }
    strokeWeight(15);
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}

void circleRow(int yPos){
  for(int j=0;j<11;j=j+1){
    fill(#FFFFFF);
    noStroke();
    ellipse(j*100,yPos*100,20,20);
  }
}
  


