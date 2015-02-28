
 public boolean forward = true;  

public boolean up = false;  

public int px=0;  

public int py =0;  

public int ly=0;  

public int lx=0;  

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

        

//     if (get(px,py)==mix[0]){  
//
//       forward = false;   
//
//     }  

   if (px<0)    forward = true;  

   if (py>height)up     = true;  

   if (py<0     )up     = false;  

  }    

     



