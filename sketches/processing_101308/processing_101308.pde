
float centX,startX=0,startY=0,lastX,lastY;
void setup( )
{
  size(1000, 400);
  background(51);
  smooth();
  centX=width/2;
  
  stroke(255);
  noFill();
}

void draw(){
  document.onmousemove = function(e) {
        if(mouseX!=0){
          a = 10000/(abs(mouseX-centX));
          if(startX==0){
            startX = random(mouseX-a,mouseX+a);
            startY = random(mouseY-a,mouseY+a);
          }else{
            startX = endX;
            startY = endY;
          }
          endX = random(mouseX-a,mouseX+a);
          endY = random(mouseY-a,mouseY+a);
          cp1x = random(mouseX-a,mouseX+a);
          cp1y = random(mouseY-a,mouseY+a);
          cp2x = random(mouseX-a,mouseX+a);
          cp2y = random(mouseY-a,mouseY+a);
         bezier(startX, startY, cp1x, cp1y, cp2x, cp2y, endX, endY);
         lastX=endX;
         lastY=endY;
        }
      } 
  
}
