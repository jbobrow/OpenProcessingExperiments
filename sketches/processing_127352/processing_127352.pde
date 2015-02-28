
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
int previousx;
int previousy;
int fillvalR=155;
int fillvalG=255;
int fillvalB=200;
  
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
  if ((xpos.size()%7==0)&&(xpos.size()>1)){
    background(255);
  }
  else{
  background(0);
  }
  for (int i = 0; i < xpos.size() ; i++)
  { 
    fillvalR=155;
    fillvalG=255;
    fillvalB=200;    
    if ((xpos.size()>=5)&&(xpos.size()<=10)){
      fillvalR=255;
      fillvalG=255;
      fillvalB=255;
    }
    if ((xpos.size()>10)&&(xpos.size()<15)){
      fillvalR=0;
      fillvalG=0;
      fillvalB=255;
    }
    if (xpos.size()%2==0){
      rectMode(CENTER);
      fill(fillvalR,fillvalG,fillvalB);
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    else{
    fill(fillvalR,fillvalG,fillvalB);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size()>1){
    stroke (fillvalR,fillvalG,fillvalB);
    line(xpos.get(i),ypos.get(i),previousx,previousy);
    }
    previousx = xpos.get(i);
    previousy = ypos.get(i);
    
    
  }
  if (xpos.size()>15){
    xpos = new ArrayList<Integer>();
    ypos = new ArrayList<Integer>();
  }
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

