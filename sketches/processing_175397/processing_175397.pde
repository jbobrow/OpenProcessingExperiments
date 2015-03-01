
color strokeColor=color(200,10);
void setup() {
 size(1920,1080);
colorMode(HSB,360,100,100,100);
noFill();
background(0);
}

void draw() {
    if (key!='d' && mouseButton==RIGHT   ) {
    fill(#B575FF);
    strokeWeight(20);
  noStroke();
     ellipse(mouseX,mouseY,10,10);
  }

  if (key=='d' && mouseButton==RIGHT  ) {
       strokeWeight(20);
       
     fill(0); 
     stroke(0);
     point(mouseX, mouseY);}
  else if (mouseButton==LEFT ) {
    
  //if (mousePressed) {
  pushMatrix() ;
  translate(width/2,height/2);
  int circleResolution=(int)map(mouseX-100,0,height,2,10);
  int radius=mouseX-width/2;
  float angle=HALF_PI/circleResolution;
  
  strokeWeight(2);
  stroke(strokeColor);
   
  for (int i=0; i<=circleResolution; i++) {
   float x=0+cos(angle*i)*radius;
    float y=0+sin(angle*i)*radius;
    ellipse(x,y,mouseX,mouseY);
    triangle(360,360,mouseX,mouseY,2*x,y);
  }
  popMatrix();
  }
}
void keyReleased() {
  if (key==DELETE || key ==BACKSPACE) background (0);
  
  if (key=='s' || key=='S' ) saveFrame("screenshot.png."); 
  switch(key) {
  case '1':
     strokeColor=color(0,10);
     break;
  case '2':
     strokeColor=color(300,100,64,10);
      noFill();
      ellipse(mouseX,mouseX/3,mouseY/2,mouseY);
     break;
  case '3':
  strokeColor=color(52,100,71,10);
  break;
   case '4':
  strokeColor=color(200,10);
  break;
     case '5':
  strokeColor = color(192, 100, 74, 10);
  break;
 } 
}




