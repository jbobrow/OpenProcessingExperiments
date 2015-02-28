
  int numberOfObj = 800;
int needleLength = 300;
int x1, y1, x2, y2, c1, c2;
int curvatureAmount;
color pineColor,hueAnchor,satAnchor,brightAnchor;
 
 
void setup(){
   
size(800,600);
colorMode(HSB,200,300,100,700);
 
drawNeedles();
 
}
 
 
void draw() {
}
 
 
 
void drawNeedles() {
 
noFill();
strokeCap(ROUND);
strokeWeight(1);
 
  int upOrDown=0;
  hueAnchor=floor(map(mouseY,0,height,130,30));
  satAnchor=floor(map(mouseY,0,height,80,40));
    background(hueAnchor,satAnchor-20,15);
  
  for (int i=0;i<numberOfObj;i++) {
    pineColor=color(hueAnchor+random(-30,30),satAnchor+random(-10,10),15+(i*50/numberOfObj));
    stroke(pineColor);
    x1=floor(random(0,width));
    y1=floor(random(0,height));
  x2=x1+floor(random(-needleLength,needleLength));
    curvatureAmount=floor(map(mouseX,0,width,0,x2-x1));
    curvatureAmount+=random(curvatureAmount/-5,curvatureAmount/5);
     
  if (upOrDown%2==0) {
  y2=y1+floor(sqrt(sq(needleLength)-sq(x2-x1)));
  }
   
  else {
      y2=y1-floor(sqrt(sq(needleLength)-sq(x2-x1)));
  }
   
upOrDown++;
 
  bezier(x1+2,y1+2,x1+curvatureAmount,y1+2,x2+2,y2+2,x2+2,y2+2);
  stroke(hue(pineColor),saturation(pineColor),brightness(pineColor)+10);
  strokeWeight(2);
  bezier(x1,y1,x1+curvatureAmount,y1,x2,y2,x2,y2);
   
  }
   
}
 
 
 
void frame() {
  noStroke();
  fill(100);
  rect(0,0,width,needleLength/2);
  rect(width-needleLength/2,0,width,height);
  rect(0,0,needleLength/2,height);
  rect(0,height-needleLength/2,width,height);
}
 
 
void mouseReleased() {
 
    drawNeedles();
 
}
 
//void keyReleased() {
//  background(360);
//}

