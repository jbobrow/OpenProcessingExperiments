
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
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
boolean rainbow = false;
  
void setup()
{
  radius = 20;
  size(500,500);
  background(bg);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  r = 155;
  g = 255;
  b = 200;
}
  
void draw()
{   if (xpos.size()%7==0) bg = 255;
    else bg = 0;
    

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
    if (rainbow==false){
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
    }
    
    else{
      if ((b<255) && (r==255) && (g==0))
      {
        b+=1;  
      }
      if ((b==255) && (r>0) && (g==0)){
        r-=1;
      }
      if ((b==255) && (r==0) && (g<255)){
        g+=1;
      }
      
      if ((r==0) && (g==255) && (b>0)){
        b-=1;
      }
      
//      if ((g==255)&&(b=0)&&(r<255)){
//        r+=1;
//      }    
      if ((r==255) && (b==0) && (g>0)){
        g-=1;
      }
    }
      
      
      
    fill(r,g,b);
    stroke(r,g,b);
    if (xpos.size()%2==0){
      rect(xpos.get(i)-radius,ypos.get(i)-radius,radius*2,radius*2);
    }
    else{
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    //check xposition. If too large (off screen), warp circle to left side
    if (xpos.get(i) > width) xpos.set(i,0);
    if (xpos.get(i) <0) xpos.set(i,width);
    if (ypos.get(i) > height) ypos.set(i,0);
    if (ypos.get(i) < 0) ypos.set(i,height);
    
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
  for(int i = 0;i<xpos.size();i++){
    if (i+1 == 1){
      xvelocity.add(1);
      yvelocity.add(0);
    }
    if (i+1 == 2){
      xvelocity.add(-1);
      yvelocity.add(1);
    }
    if (i+1 == 3){
      xvelocity.add(1);
      yvelocity.add(2);
    }
    if (i+1 == 4){
      xvelocity.add(-1);
      yvelocity.add(3);
    }
    if (i+1 == 5){
      xvelocity.add(-1);
      yvelocity.add(0);
    }
    if (i+1==6){
      xvelocity.add(1);
      yvelocity.add(-1);
    }
    if (i+1==7){
      xvelocity.add(-1);
      yvelocity.add(-2);
    }
    if (i+1==8){
      xvelocity.add(1);
      yvelocity.add(-3);
    }
    
    if (i+1>8){
      xvelocity.add(int(random(-5,5)));
      yvelocity.add(int(random(-5,5)));
    }
}
}

void keyPressed(){
  if (key==' '){
    if (rainbow==true){
      rainbow=false;
      println("OFF");
    }
    else{
      rainbow=true;
      println("ON");
    }
    
  }
}
    
  

