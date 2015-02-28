
ArrayList<Integer> xpos; 
ArrayList<Integer> ypos; 
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int c=125; 
int len; 
int radius; 

void setup() 
{ 
  radius = 20; 
  size(1000,1000); 
  background(0); 
  xpos = new ArrayList<Integer>(); 
  ypos = new ArrayList<Integer>(); 
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  fill(155,255,200); 
  len = 0; 
} 

void draw() 
{ 
  stroke(0,0,0); 
  strokeWeight(1); 
  int len = xpos.size(); 
  if (len % 7 == 0) 
  { 
    background(255,255,255); 
  } 
  if (len % 7 != 0) 
  {
    background(0,0,0); 
  } 
  if (len % 2 != 0) 
  { 
    for (int i = 0; i < xpos.size() ; i++) 
    { 
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));
      //check xposition. If too large (off screen), warp circle to left side
       if (xpos.get(i) > width)
       {
         xpos.set(i,0);
       }
       if (xpos.get(i) < 0)
       {
         xpos.set(i,width);
       }
       if (ypos.get(i) > height)
       {
         ypos.set(i,0);
       }
       if (ypos.get(i) < 0)
       {
         ypos.set(i,height);
       }
    }
  }
  if (len % 2 == 0) 
  { 
    for (int i = 0; i < xpos.size() ; i++) 
    { 
      rectMode(CENTER); 
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));
      //check xposition. If too large (off screen), warp circle to left side
       if (xpos.get(i) > width)
       {
         xpos.set(i,0);
       }
       if (xpos.get(i) < 0)
       {
         xpos.set(i,width);
       }
       if (ypos.get(i) > height)
       {
         ypos.set(i,0);
       }
       if (ypos.get(i) < 0)
       {
         ypos.set(i,height);
       }
     }
   }
  if (len > 5 && len < 10) 
  { 
    fill(255,255,255); 
  } 
  if (len > 10 && len < 15) 
  { 
    fill(0,0,255); 
  } 
  if (len > 15) 
  { 
    xpos.clear(); 
    ypos.clear(); 
    fill(155,255,200); 
  } 
  if (len > 1 && len < 16) 
  { 
    strokeWeight(5); 
    stroke(255,0,0); 
    int linex = xpos.get(len - 1); 
    int liney = ypos.get(len - 1); 
    int linex2 = xpos.get(len - 2); 
    int liney2 = ypos.get(len - 2); 
    line(linex,liney,linex2,liney2); 
  } 
} 

void mouseClicked() 
{ 
  xpos.add(mouseX); 
  ypos.add(mouseY); 
  xvelocity.add(0,1);
  yvelocity.add(0,-1);
  
  xvelocity.add(1,-1);
  yvelocity.add(1,1);
  
  xvelocity.add(2,1);
  yvelocity.add(2,2);
  
  xvelocity.add(3,-1);
  yvelocity.add(3,3);
  
  xvelocity.add(4,-1);
  yvelocity.add(4,0);
  
  xvelocity.add(5,1);
  yvelocity.add(5,-1);
  
  xvelocity.add(6,-1);
  yvelocity.add(6,-2);
  
  xvelocity.add(7,1);
  yvelocity.add(7,-3);
  
  for (int p = 8; p < 15 ; p++)
  {
    xvelocity.add(p,int(random(-5,5)));
    yvelocity.add(p,int(random(-5,5)));
  }
} 

void keyPressed() 
{ 
  if (key == 'a' && radius > 4) 
  { 
    radius = radius - 2; 
  } 
  if (key == 'd' && radius < 100) 
  { 
    radius = radius + 2; 
  } 
} 
