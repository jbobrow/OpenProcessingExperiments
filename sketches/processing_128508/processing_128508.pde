
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int r;
int g;
int b;
color fillit= color(155,255,200);
  
void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  rectMode(CENTER);
}

void draw()
{ 
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    if (xpos.size()>4&&xpos.size()<11) {
      fillit=color(255,255,255);
    }
    if (xpos.size()>10&&xpos.size()<16) {
      fillit=color(0,0,255);
    }
    if (xpos.size()>15) {
      background(0);
        xpos = new ArrayList<Integer>();
        ypos = new ArrayList<Integer>();
        xvelocity = new ArrayList<Integer>();
        yvelocity = new ArrayList<Integer>();
    }
    if (xpos.size()%7==0){
      background(255);
    }
    fill(fillit);
    if (xpos.size()%2!=0) {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size()%2==0) {
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
  
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    //check xposition. If too large (off screen), warp circle to left side
    if (xpos.get(i) > width) 
    
    {
      xpos.set(i,0);
    }
    if (ypos.get(i) > height){
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0){
      ypos.set(i,height);
    }
    if (xpos.size()==1){
      xvelocity.set(i,1);
      yvelocity.set(i,0);
    }
    if (xpos.size()==2){
      xvelocity.set(i,-1);
      yvelocity.set(i,1);
    }
    if (xpos.size()==3){
      xvelocity.set(i,1);
      yvelocity.set(i,2);
    }
    if (xpos.size()==4){
      xvelocity.set(i,-1);
      yvelocity.set(i,3);
    }
    if (xpos.size()==5){
      xvelocity.set(i,-1);
      yvelocity.set(i,0);
    }
    if (xpos.size()==6){
      xvelocity.set(i,1);
      yvelocity.set(i,-1);
    }
    if (xpos.size()==7){
      xvelocity.set(i,-1);
      yvelocity.set(i,-2);
    }
    if (xpos.size()==8){
      xvelocity.set(i,1);
      yvelocity.set(i,3);
    }
    if (xpos.size()>8){
      xvelocity.set(i,(int(random(-5,5))));
      yvelocity.set(i,(int(random(-5,5))));
    }
    if(keyPressed==true){
    if (key ==' '){
    xvelocity.set(i,i+1);
    yvelocity.set(i,i+1);
  }
  }  
}
}
  

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
      if (xpos.size()==1){
      xvelocity.add(1);
      yvelocity.add(0);
    }
    if (xpos.size()==2){
      xvelocity.add(-1);
      yvelocity.add(1);
    }
    if (xpos.size()==3){
      xvelocity.add(1);
      yvelocity.add(2);
    }
    if (xpos.size()==4){
      xvelocity.add(-1);
      yvelocity.add(3);
    }
    if (xpos.size()==5){
      xvelocity.add(-1);
      yvelocity.add(0);
    }
    if (xpos.size()==6){
      xvelocity.add(1);
      yvelocity.add(-1);
    }
    if (xpos.size()==7){
      xvelocity.add(-1);
      yvelocity.add(-2);
    }
    if (xpos.size()==8){
      xvelocity.add(1);
      yvelocity.add(3);
    }
    if (xpos.size()>8){
      xvelocity.add((int(random(-5,5))));
      yvelocity.add((int(random(-5,5))));
    }
  
}

