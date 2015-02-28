
float xW = 300;
float direction = 5; 
 
void setup(){
  size(600,600);
  background(16,63,69);
}
 
void draw(){
  noStroke();
  fill(16,63,69,10); 
  rect(0,0,width,height);
   
  fill(255);  
  ellipse (width/2, height/2, xW, xW);

  
   
 
    xW = xW + direction;
   
  
  if ((xW > 580)||(xW < 1)){
    direction = direction * -1;
  } 
}

