
float boxSize = 20;    
float distance = 30;   
float halfDis;    
int boxNum = 6; 

int angle; 

void setup() {
  size(400, 400, P3D);
 halfDis = distance*(boxNum-1)/2;
  angle = 0;  
}
 
void draw() {
  background(0);
    angle += 1;
   if(angle > 360) angle = 0;  
  stroke(255, 0, 0, 100);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
 
  translate(width/2, height/2);  
    rotateY(radians(angle)); 
     rotateX(radians(angle));    
  rotateY(radians(mouseX));    
  rotateX(radians(mouseY));   
 
  fill(255);

  scale(50);    //拡大
  beginShape(QUADS);
  
    for(int y = 0; y < boxNum; y ++){      
    for(int x = 0; x < boxNum; x ++){    
      pushMatrix();
      translate(x*distance-halfDis, y*distance-halfDis, 0);
      box(boxSize, boxSize, boxSize);    
      popMatrix();

  
 
  //正面
  fill(255, 0, 0);
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);
  //右
  fill(0, 255, 0); 
  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  //後ろ
  fill(0, 0, 255); 
  vertex( 1,  1, -1);
  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  //左
  fill(255, 255, 0); 
  vertex(-1,  1, -1);
  vertex(-1,  1,  1);
  vertex(-1, -1,  1);
  vertex(-1, -1, -1);
  //下
  fill(0, 255, 255); 
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);
  //上
  fill(255, 0, 255); 
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);
 
  endShape();
  
}
    }
}
