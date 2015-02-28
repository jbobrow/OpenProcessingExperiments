
float x;
float y;
float easing=0.06;
int a=400;
int b=300;
int c=75;
int d=100;
void setup(){
  background(29,29,29);
  smooth();
  size(700,700);
}
void draw()
{
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  background(29,29,29);
  fill(29,29,29);
  float targetX =pmouseX;
  float targetY=pmouseY;
  y+=(targetY-y)*easing;
  x+=(targetX-x)*easing;
  
  if ((mouseX>a-80)&&(mouseX<a+c)&&
  (mouseY>b-100)&&(mouseY<b+d)){
    fill(254,0,0);
  }
  else{
    fill(145,173,184); 
  }
  rect(a,b,c,d);
//rect turn orange if near blue rect
  if (mousePressed)
  {
     float x1=map(x,200,width,300,400);
      fill(65,205,179);
  rect(x1,y*2,80,100);
    fill(162,0,0);
    rect(mouseX,y,80,100);//red ellipse
     fill(255,204,0);//yellow rectangle
    float x2=map(x,0,width,0,100);
  rect(x2,0,10,700);
  }
  else
  {
     float x1=map(x,200,width,300,400);
  fill(65,205,179);
  rect(x1,y*2,80,100);
  fill(1,51,0);//green rectangle
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  rect(pmouseX,y,80,100);
    fill(255,204,0);
      float x2=map(x,0,width,0,100);
  rect(x2,0,10,700);//yellow rectangle
  textSize(100);
  fill(229,115,0);//orange text  
  textSize(150);
  textAlign(CENTER);
  text ("Hello",mouseY,200,250);
  }
}


