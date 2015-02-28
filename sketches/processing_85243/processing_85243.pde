
int x1,x2,x3,y1,y2,y3;
int c;
boolean b=false;

void setup(){
  frameRate(15);
  size(600, 400);
  colorMode(HSB,100);
  background(100);
  noStroke();
}
 
void draw(){
  //background(100);
  if(b){
    fill(100,0,100,20);
    rect(0,0,width,height);
    fill(c,100,80);
    if(c!=100){
      c++;
    }else{
      c=0;
    }
    x1=x2;
    y1=y2;
    x2=x3;
    y2=y3;
    x3=mouseX;
    y3=mouseY;
    beginShape(TRIANGLE_STRIP); 
      vertex(x1,y1);
      vertex(x2,y2);
      vertex(x3,y3);
    endShape();
  }
  b=false;
}

void mouseMoved(){
  b=true;
}


