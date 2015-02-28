
float theta = radians(60);
int value = 255;
int x = 50;
float angle =90;
void setup(){
  noFill();
  size (900,900);
  translate(width/3,height/2);
  background(0);
  drawTriangle(width/2,height/2,width/2);
  drawone(width,height/2,width);

}

void drawTriangle(float x, float y, float dia){
   noStroke();
   frameRate(2);
  x *= 0.34+ (.6);
  y *= 0.8*noise(x);
 // dia *= 1.5; 
  ellipse(x, random(y*PI/4),dia,dia);


  //fill(value); 

  //rect(x,y, dia,10); 
  fill(random(220),random(100),120,250);  
  //x = x+ dia/2;
 // y = y;
  if (dia>4 ){
  
   rotate(frameRate*0.6);
   drawTriangle(x+dia/2,y,dia/2);
    //drawTriangle(mouseX,y,dia/2);
  
 
  translate(0,y); 
 
  drawTriangle(x-dia/2,y,dia/2);
  drawTriangle(x*.20,y-dia,dia/2);
  drawTriangle(x,y-dia,dia/2);
 //x= x*-1;
//if (dia>1)drawCircle(dia*=.75);
}    
}

void mouseClicked(){
 drawone(random(100),random(100),random(100));
}
void drawone(float x1, float y1, float d){
   //noStroke();
      
   color c = color(random(100), random(205), 225, 50);
   fill(c);
  //fill(value); 
  ellipse(x1, y1,d/3,d/3);
//translate(0,50);
//float value = random(c);
  //rect(x1,y1, d/2,10); 
  
 
 // y = y;
  if (d>8){
  pushMatrix();
    
    rotate(theta/2);
  
    drawone(x1-d/2,y1,d/2);
     rotate(theta/2);
  drawone(x1-d/2,y1,d/4);
    popMatrix();
  drawone(x1,y1+d,d/4);
  drawone(x1,y1-d,d/2);
     
 //x= x*-1;
//if (dia>1)drawCircle(dia*=.75);
}  

}
