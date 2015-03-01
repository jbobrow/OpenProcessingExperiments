
void setup(){
size(500,500);
}

void draw(){

beginShape();
noFill();
float headCenterX = width/2; 
float headCenterY = 100;
float headSize = 50;

for (int i =0; i< 6; i++) {
  float radian = TWO_PI/6;
  float x = headCenterX + headSize*cos(radian/2 + radian*i); 
  float y = headCenterY + headSize*sin(radian/2 + radian*i); 
  vertex(x, y);

strokeWeight(1);
line(headCenterX, headCenterY, mouseX, mouseY );

strokeWeight(6); 
}

endShape(CLOSE);
}



