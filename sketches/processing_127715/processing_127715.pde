
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int r;
int g;
int b;
int radius;
int c=125;
int tempx,tempy; 

void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}
 
void draw()
{
  if (xpos.size() > 15){
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}
  background(0);
  if (xpos.size() < 5){
  r = 155;
  g = 255;
  b = 200;
  }
  if ((xpos.size() >= 5)&&(xpos.size() <= 10)){
  r = 255;
  g = 255;
  b = 255;
  }
  if ((xpos.size() >= 11)&&(xpos.size() <= 15)){
  r = 0;
  g = 0;
  b = 255;
  }
  if (xpos.size() %7 == 0){
    background(255);
  }
   
  for (int i = 1; i < xpos.size() ; i++){
    
    fill(r,g,b);
    if (xpos.size() %2 == 0){
      rect(xpos.get(i)-radius,ypos.get(i)-radius,radius*2,radius*2);
    }
    
    else{
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
  if(xpos.size()>1){
  stroke(r,g,b);
  line(tempx,tempy,xpos.get(i),ypos.get(i));
  }
  tempx = xpos.get(i);
  tempy = ypos.get(i);
 
  

}
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}
