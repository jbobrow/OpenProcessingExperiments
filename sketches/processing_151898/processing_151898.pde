
float headCenterX = width/2;
 float headCenterY = 100;
 float headSize = 50;
void setup(){
   size(500,600);
   smooth();
}
void draw(){
  background(255);
 
  drawShape(mouseX, mouseY,headSize);
  //if(keyPressed == true)
     //headSize += 5;
  
 
}
void drawShape(float headCenterX, float headCenterY,float headSize){
  beginShape();
  noFill();
   for(int i = 0; i < 6;i++){
       float radian  = TWO_PI/6;
       float x = headCenterX + headSize*cos(radian/2+radian*i);
       float y = headCenterY + headSize*sin(radian/2+radian*i);
       //stroke(random(255),random(255),random(255));
       vertex(x,y);
       strokeWeight(1);
       line(headCenterX,headCenterY,x,y); 
       strokeWeight(6);
       
   } 
  endShape(CLOSE); 

}
