
int lastTimeCheck=0;
int timeIntervalFlag = 3000; // 3 seconds because we are working with millis
float x0=250;
float y0=25;
float x1=25;
float y1=425;
float x2=475;
float y2=425;
int test=0;
int test1=0;
float x=0;
float y=0;
PFont f;                          
  

void setup(){
  f = createFont("Arial",16,true);
  lastTimeCheck = millis();
size(500,500);
background(204);
fill(0);
triangle(x0, y0, x1, y1, x2, y2);

}

void draw(){
  textFont(f,18);
  fill(0);
  text("Click anywhere\n in the triangle.", 325,25);
  noStroke();
  fill(242,200,15);
  int vertex=0;
  if(mousePressed){
    x=mouseX;
    y=mouseY;
    test=1;
  }
  if((y>((y1-y0)/(x1-x0))*(x-x0)+y0)&&(y<425)&&(y>((y2-y0)/(x2-x0))*(x-x0)+y0)){
    if(test==0){
    ellipse(x,y,1,1);
    test=1;
    }
    vertex=floor(random(3));
    if(vertex==0){
     ellipse((x+x0)/2,(y+y0)/2,1,1);
      x=(x+x0)/2;
      y=(y+y0)/2;
    }
    if(vertex==1){
      ellipse((x1+x)/2,(y1+y)/2,1,1);
      x=(x1+x)/2;
      y=(y1+y)/2;
    }
    if(vertex==2){
      ellipse((x+x2)/2,(y2+y)/2,1,1);
      x=(x+x2)/2;
      y=(y2+y)/2;
    }
  }
  else if(test==1){
    fill(255,0,0);
    text("That wasn't in the triangle. Try again", 75,470);
  
  }
}




