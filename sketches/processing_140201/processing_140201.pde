
float AMPLITUDE = 200;
float step =0;
float xPos,yPos,y2Pos;

void setup(){
size(640,480);
}

void draw(){
  background(255);
  translate(width/2,height/2);
  
  y2Pos = -1 * cos(step) * AMPLITUDE;
  yPos = -1 * sin(step) * AMPLITUDE;
  
  ellipse((width/2)*0.33,yPos,100,100);
  ellipse((width/2)*-0.33,yPos,100,100);
  
  ellipse((width/2)*0.66,y2Pos,100,100);
  ellipse((width/2)*-0.66,y2Pos,100,100);
  
  
   ellipse(y2Pos,(width/2)*0.33,100,100);
   ellipse(yPos,(width/2)*-0.33,100,100);
   
  step += 0.02;


}
