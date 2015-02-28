
public boolean forward = true; 
public boolean up = false; 
public int px=0; 
public int py =0; 
public int ly=0; 
public int lx=0; 
void bounce1(boolean rnd, int by, int lo, int hi){ 
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

  //  if (get(px,py)==mix[0]){ 
  forward = false;  
  //  } 
  if (px<0)    forward = true; 
  if (py>height)up     = true; 
  if (py<0     )up     = false; 
}   


public void bounce2(int by, int lo, int hi) { 
  if (forward){ 
    px+=(int)random(lo,hi); 
  } 
  else 
  { 
    px-=(int)random(lo,hi);  
  } 

  if (up){ 
    py-=(int)random(cos(lo),hi);  
  } 
  else 
  { 
    py+=(int)random(lo,hi); 
  } 
  if (px>width){ 
    forward = false;  
  } 

  if (px<0){ 
    forward = true;  
  } 

  if (py<0){ 
    up = false;  
  } 

  if (py >height){ 
    up = true;  
  } 
  // if (!mousePressed){ 
  //  mouseX= px; 
  //  mouseY= py; 
  // } 

  //ellipse(mouseX,mouseY,10,10);  

} 





