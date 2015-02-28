
int x;

int y;

int j;

int k;

int o;

int p;

int u;

int a;

int z;

void setup() {  //setup function called initially, only once
  size(500, 500);
 
}

void draw() {  //draw function loops 
   background(0,0,255);
   
   x = mouseX - 50
   
   y = mouseY - 50
   
   j = mouseX + 50
   
   k = mouseY - 50
   
   o = mouseY + 35
   
   p = y + 15
   
   t = x - 17
   
   q = j - 17
   
   w = k + 15
   
   z = t + 30
   
   l = q + 30
   
    strokeWeight(4);
    fill(255,233,0);
    ellipse(mouseX, mouseY, 250, 250);
    
    fill(255,255,255);
    arc(x,y, 80, 80, 0, PI);
    
    fill(255,255,255);
    arc(j,k,80, 80, 0, PI);
    
    fill(255,0,0);
    arc(mouseX,o,180,150,0,PI);
    
    fill(0,0,0);
    ellipse(t,p,25,25);
    
    fill(0,0,0);
    ellipse(q,w,25,25);
    
    if (mousePressed)
    {
        background(255,0,0);
        
            strokeWeight(4);
    fill(255,233,0);
    ellipse(mouseX, mouseY, 250, 250);
    
    fill(255,255,255);
    arc(x,y, 80, 80, 0, PI);
    
    fill(255,255,255);
    arc(j,k,80, 80, 0, PI);
    
    fill(255,0,0);
    arc(mouseX,o,180,150,0,PI);
    
    fill(0,0,0);
    ellipse(z,p,25,25);
    
    fill(0,0,0);
    ellipse(l,w,25,25);
    }
 
  
}
