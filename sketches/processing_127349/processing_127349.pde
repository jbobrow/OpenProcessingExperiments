
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int x;
int y;
int x2;
int y2;
int r;
int g;
int b;
int bg = 0;
int radius;
int c=125;
  
void setup()
{
  radius = 20;
  size(600,600);
  background(bg);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  r = 155;
  g = 255;
  b = 200;
}
  
void draw()
{
//  if (xpos.size()<5){
//    r = 155;
//    g = 255;
//    b = 200;
//  }
//  if ((xpos.size()>=5)&&(xpos.size()<=10)){
//    stroke(0);
//    r = 255;
//    g = 255;
//    b = 255;
//  }
//  if ((xpos.size()>=11)&&(xpos.size()<=15)){
//    r = 0;
//    g = 0;
//    b = 255;
//  }
    if (xpos.size()>15){
    xpos = new ArrayList<Integer>();
    ypos = new ArrayList<Integer>();
    r = 155;
    g = 255;
    b = 200;
  }


    
  background(bg);
  for (int i = 0; i < xpos.size() ; i++)
  {
    if (i<4){
    r = 155;
    g = 255;
    b = 200;
  }
    if ((i>=4)&&(i<=9)){
      r = 255;
      g = 255;   
      b = 255;
    }
    if ((i>=10)&&(i<=14)){
      r = 0;
      g = 0;
      b = 255;
    }
      
      
    fill(r,g,b);
    if (xpos.size()%2==0){
      rect(xpos.get(i)-radius,ypos.get(i)-radius,radius*2,radius*2);
    }
    else{
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    
  }
    if (xpos.size()>1){
    for (int i = 0; i<xpos.size()-1; i++){
      stroke(0,255,0);
      x = xpos.get(i);
      y = ypos.get(i);
      x2 = xpos.get(i+1);
      y2 = ypos.get(i+1);
      line(x,y,x2,y2);
    }
  }
  
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

