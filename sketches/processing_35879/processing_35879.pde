
int w = 555; 
int h = 255; 
  
void setup(){ 
background(255); 
size(555,255,P2D); 
smooth(); 
int xm = int(w/2); 
int ym = int(h/2); 
for (int x = 0;x<w;x++){ 
for (int y=0;y<h;y++){ 
  int dx = px-xm; 
 bounce(true,3,1,5);  
 if(dx<0)dx=-dx; 
  
  int dy = py-ym; 
  if (dy<0)dy = -dy; 
 float dis = dx+dy; 
  stroke(1,dis); 
 point(x,y);  
        
} 
} 
} 
  
void draw(){ 
  
  
} 
  
  
  
public boolean forward = true; 
public boolean up = false; 
public int px=0; 
public int py =0; 
//public int ly=0; 
//public int lx=0; 
void bounce(boolean rnd, int by, int lo, int hi){ 
 if (forward){ 
  if (rnd)px+=random(lo,hi);  
   if (!rnd){ 
    px+=by;  
   } 
 }  
   
   
   if (!forward){ 
     if(rnd)px-=random(lo,hi);   
     if (!rnd){ 
      px-=by;  
     } 
     } 
     
   if (up){ 
    if (rnd)py-=random(lo,hi*2);  
     if (!rnd){ 
       py+=by; 
     } 
     } 
       
     if (!up){ 
      if(rnd)py+=random(lo,hi*2);  
     if (!rnd){ 
       py-=by; 
     }   
         
     } 
     
     
   if (px>width) 
     { 
         
       forward = false; 
         
     } 
       
       
   if (px<0)    forward = true; 
   if (py>height)up     = true; 
   if (py<0     )up     = false; 
  }                 
