
float x = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float y = 0;
float y2 = 0;
float y3 = 0;
float y4 = 0;
float dy = 0;
float d2 = 0;
float d3 = 0;
float d4 = 0;
float kx = 0;
float k2 = 0;
float k3 = 0;
float k4 = 0;
//int spacing = 5;

void setup () {
  size(800,800);
  background(200,190,160,190);
  smooth();
  frameRate(30);
}
void draw () {
  //vert lines
  line(2*width/4,0,2*width/4, height);
  line(width/4,0,width/4, height);
  line(3*width/4,0,3*width/4, height);
  
  //horz lines
  line(0,width/4,height,width/4);
  line(0,2*width/4,height,2*width/4);
  line(0,3*width/4,height,3*width/4);
  
  //hor drawn patterns
  stroke(0);
  if(y < 200) {
  line(0,y,width/4,y);
  y = y + 9;
  } else {
  stroke(0);
  if(y2 < 200) {
  line(400,y2,3*width/4,y2);
  y2 = y2 + 30;
  } else {
  stroke(0);
  if(y3 < 200) {
  line(400,y3+600,3*width/4,y3+600);
  y3 = y3 + 15;
  } else {
  stroke(0);
  if(y4 < 200) {
  line(200,y4+400,2*width/4,y4+400);
  y4 = y4 + 4;
  } else {
 //vert drawn pattern
 stroke(0);
  if(x < 200) {
  line(x,200,x,2*height/4);
  x = x + 11;
  } else {
  stroke(0);
  if(x2 < 200) {
  line(x2,400,x2,3*height/4);
  x2 = x2 + 5;
  } else {
  stroke(0);
  if(x3 < 200) {
  line(x3+400,400,x3+400,3*height/4);
  x3 = x3 + 19;
  } else {
  stroke(0);
  if(x4 < 200) {
  line(x4+600,0,x4+600,200);
  x4 = x4 + 9;
  } else {
  stroke(0);
  if(kx < 205 && dy < 400)  { 
  line(200,dy,kx+200,0);
  kx+=15;
  dy+=15;
  } else {
  stroke(0);
  if((kx < 400) && (dy < 600))  { 
  line(400,dy,kx+200,200);
  kx+=25;
  dy+=25;
  } else {
  stroke(0);
  if((kx < 800) && (dy < 800))  { 
  line(600,dy+200,kx+200,600);
  kx+=25;
  dy+=25;
  } else {
  stroke(0);
  if(x < 800 && y < 400)  { 
  line(200,y+400,x,600);
  x+=15;
  y+=15;
  } else {
  if(y < 600) { 
  line(x,0,0,y);
  x+=5;
  y-=5;
  }  

    
  
  //indv drawings
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
}

