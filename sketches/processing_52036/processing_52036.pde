

float radius;
int x = 100;
int y = 100;
int w = 300;
int h = 300;

void setup()
{
  size(500,500);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
}

void draw()
{
  background(10);
  radius = 25;
  

  if ((mouseX>x)&&(mouseX<x+w)&&
  (mouseY>y)&&(mouseY<y+h)){
    fill(0);
  }else{
    fill(255);
  }
  rect(x,y,w,h);



   for(int i=25;i<width;i+=75){
    for(int j=25;j<height;j+=75){
    ellipse(i,j,radius,radius);
    float d = dist(mouseX,mouseY,i,j+75);
  if(d < radius ){
  fill(255);
  }else{
     fill(5);
  }
    }
  }

}

