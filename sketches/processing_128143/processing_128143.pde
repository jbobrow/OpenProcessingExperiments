
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int previousx;
int previousy;
int fillvalR=155;
int fillvalG=255;
int fillvalB=200;
int mode = 0;
  
void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
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
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
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
    if (xpos.get(i) > width+radius)
    {
      if (mode == 0){
      xpos.set(i,0+radius);
    }
    if (mode == 1){
        xvelocity.set(i,xvelocity.get(i)*(-1));
      }
    }
    if (xpos.get(i) < 0-radius)
    {
      if (mode==0){
      xpos.set(i,width+radius);
      }
      if (mode == 1){
        xvelocity.set(i,xvelocity.get(i)*(-1));
      }
    }
    if (ypos.get(i) < 0-radius)
    {
      if (mode==0){
      ypos.set(i,height+radius);
      }
      if (mode == 1){
        yvelocity.set(i,yvelocity.get(i)*(-1));
      }
    }
    if (ypos.get(i) > height+radius)
    {
      if (mode == 0){
      ypos.set(i,0-radius);
      }
      if (mode == 1){
        yvelocity.set(i,yvelocity.get(i)*(-1));
      }
    }
  }
   
  if (xpos.size()>15){
    xpos = new ArrayList<Integer>();
    ypos = new ArrayList<Integer>();
    xvelocity = new ArrayList<Integer>();
    yvelocity = new ArrayList<Integer>();
  }
  
 
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  if ((xpos.size()%2==0)&&(xpos.size()<=8)){
    xvelocity.add(-1);
  }
  else{
    xvelocity.add(1);
  }
  if (ypos.size()<=4){
    yvelocity.add(ypos.size()-1);
  }
  if (ypos.size()<=8){
    yvelocity.add((ypos.size()-5)*-1);
  }
  else{
    xvelocity.add(int(random(-5,5)));
    yvelocity.add(int(random(-5,5)));
  }
  
}
void keyPressed(){
  if (key==' '){
    if (mode == 0){
      mode = 1;
    }
    else if (mode == 1){
      mode = 0;
    }
    println(mode);
  }
}
