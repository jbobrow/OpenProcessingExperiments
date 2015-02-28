
void setup(){
  noFill();
  size (600,700);
  translate(0,300);
  background(0);
  drawTriangle(width/2,height/2,width/2);
  drawone(width/2,height/2,width/4);

}

void drawTriangle(float x, float y, float dia){
   noStroke();
  ellipse(x, y,dia/2,dia/2);
 
  //rect(x,y, dia,10); 
  fill(random(220),random(100),200);  
  //x = x+ dia/2;
 // y = y;
  if (dia>2){
  drawTriangle(x+dia/2,y,dia/2);
  drawTriangle(x-dia/2,y,dia/2);
  drawTriangle(x,y-dia,dia/2);
  drawTriangle(x,y-dia,dia/2);
 //x= x*-1;
//if (dia>1)drawCircle(dia*=.75);
}    
}
void drawone(float x1, float y1, float d){
   noStroke();
   
   color c = color(random(125), random(205), 225, 200);
   fill(c);
  ellipse(x1, y1,d/4,d/4);
//translate(0,50);
float value = alpha(c);
  //rect(x,y, dia,10); 
  fill(value);  
 
 // y = y;
  if (d>2){
  drawone(x1+d/2,y1,d/2);
  drawone(x1-d/2,y1,d/2);
  drawone(x1,y1-d,d/2);
  drawone(x1,y1-d,d/2);
 //x= x*-1;
//if (dia>1)drawCircle(dia*=.75);
}    
}
