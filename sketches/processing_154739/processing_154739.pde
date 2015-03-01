
/* v1.0 the goal is to create a shape that changes shape based on frame rate.
Cathal Lindsay ( cathalpaint) 2014*/

int hexNum;
int frame_rate_value;

void setup(){
  size(500,500);
  hexNum= 8;
  frame_rate_value =8;
  frameRate(10);
  rectMode(CENTER); 
  smooth(4);
  
}

void draw(){
  background(255);

  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {
   
  //stroke(0);
  beginShape();
  noFill();
  stroke(100);
  float hexCenterX = x;
  float hexCenterY = y;
  float hexSize = size;
  
  for(int k= 0; k<hexNum;k++){ // here the value of i controls the shape
    
    float radian= TWO_PI/hexNum;
     hexCenterX = hexCenterX + hexSize *cos(radian/2 + radian*k);
     hexCenterY = hexCenterY + hexSize*sin(radian/2 +radian*k);
    vertex(x,y);
    
    //line from center?
    strokeWeight(1);
     
    line(hexCenterX, hexCenterY, x, y);
   
   strokeWeight(6);
  }//efor
 endShape(CLOSE);
}//ed 
  

   

void keyReleased(){
  //right arrow increase framerate
  if (keyCode == RIGHT && hexNum<8){
    hexNum++;
  }
  
  //left arrow decrease the framereate
  if(keyCode == LEFT && hexNum>3){
    hexNum--;
  }
  
  
  println("current hexNum is.." +hexNum);
}//edn key release


