
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
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
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
}
 
void draw()
{
  if (xpos.size() >= 15){
  //xpos = new ArrayList<Integer>();
  //ypos = new ArrayList<Integer>();
}
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (ypos.get(i) > height)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i)<0){
      ypos.set(i,height);
    }
    fill(155,255,200);
    //ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    //check xposition. If too large (off screen), warp circle to left side
    
  }

  for (int i = 1; i < xpos.size() ; i++){
  if (xpos.size() <= 5){
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
  stroke(0,255,0);
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
  xvelocity.add(1);
  yvelocity.add(1);
if (xpos.size()<=4){
  
if (xpos.size()%2==0){
   xvelocity.add(-1);
}
else{
  xvelocity.add(1);
}
}
if ((xpos.size()>=5)&&(xpos.size()<=8)){
  
if (xpos.size()%2==0){
   xvelocity.add(1);
}
else{
  xvelocity.add(-1);
}
}
if (ypos.size()<=8){
  
if (ypos.size()==1){
  yvelocity.add(0);
}
if (ypos.size()==2){
  yvelocity.add(1);
}
if (ypos.size()==3){
  yvelocity.add(2);
}
if (ypos.size()==4){
  yvelocity.add(3);
}
if (ypos.size()==5){
  yvelocity.add(0);
}
if (ypos.size()==6){
  yvelocity.add(-1);
}
if (ypos.size()==7){
  yvelocity.add(-2);
}
if (ypos.size()==8){
  yvelocity.add(-3);
}
}
else
{
  xvelocity.add(int(random(-5,5)));
  yvelocity.add(int(random(-5,5)));
}

  
  
}

