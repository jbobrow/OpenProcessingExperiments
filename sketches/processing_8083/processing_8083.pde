
public boolean forward = true;
public boolean up = false;
public int px=0;
public int py =0;
public int ly=0;
public int lx=0;
void bounce(boolean rnd, float by, int lo, int hi){
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
   
   
   if (px>width){
     forward = false;
   if (switchhit) stroke(random(0,400),random(0,400),random(0,400),33); 
   }
   if (px<0) {
     if (switchhit)  stroke(random(0,400),random(0,400),random(0,400),33);
    forward = true;
   }
   if (py>height){
     up     = true;
     if (switchhit)  stroke(random(0,400),random(0,400),random(0,400),33); 
   }
   if (py<0     ) {
     up     = false;
     if (switchhit)  stroke(random(0,400),random(0,400),random(0,400),33); 
   }
  }  
  
 
  
  


