
void setup() {
 println("running setup");
 size(500,500);
 frameRate(25);
 background(0,0,0,255);
}

void draw(){
  //if (mousePressed && (mouseButton == LEFT)){
  //fill(0,0,0,10);
  //rect(0,0,width,height);
  //}
  //if (random(100) < 10) background(random(255),random(255),random(255),random(255));
  
  float r = random(10,75);
  
  if (mousePressed && (mouseButton == LEFT)){
    fill(random(255), random(255), random(255));
    yinyang(mouseX, mouseY, r);
  }
  
  if (mousePressed && (mouseButton == RIGHT)){
    fill(0);
    rect(0,0,width,height);
  }
}

void yinyang(float x,float y, float d) {
  float w = mouseX/4; //weight pull of curve.
  ellipse(x, y, d, d);
  float x1=x;
  float y1=y;
  float x2=x;
  float y2=y+d/2;
  float cx1=x+w;
  float cy1=y1;
  float cx2 =x+w;
  float cy2=y2;
  
  stroke(255,102,0);
  //line(x1,y1,cx1,cy1);
  //line(x2,y2,cx2,cy2);
  stroke(mouseY);
  bezier(x1,y1,cx1,cy1,x2,y2,cx2,cy2);
  
  y2 = y-d/2;
  cx1=x-w;
  cx2=x-w;
  cy2=y2;
  stroke(mouseY);
  bezier(x1,y1,cx1,cy1,x2,y2,cx2,cy2);
  
}


