
public void bounce(){

  
  boolean rnd = true;
  int by = 3;
  int lo = 1;
  int hi = 5;

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

  if (get(px,py)==mix[0]){
    forward = false; 
  }


  if (px<0)    forward = true;
  if (py>height)up     = true;
  if (py<0     )up     = false;
  kick();
}  


void kick (){
  boolean nh = false;
  color k = ulayer.get(px,py);

 // switch((int) k) {
// if ( k== int(mix[0])) forward = false; //omit 
  if ( k== int(mix[1])) { forward = false;
  mouseX= px;mouseY= py;
  upb(mix[1]);
 
 // draw1();
  }
   if ( k== int(mix[2])) {
      upb(mix[2]);
     forward = false;
    mouseX= px;mouseY= py; 
  
 
  // sketches[1].handleDraw();
  // arraycopy(q.pixels,A);
   }
  if ( k== int(mix[3])) { forward = false;
  mouseX= px;mouseY= py;
    upb(mix[3]);
 //    arraycopy(w.pixels,A);
 
//   sketches[1].handleDraw();
  }
   if ( k== int(mix[4])) { forward = false;
   mouseX= px;mouseY= py;
     upb(mix[4]);
     // arraycopy(e.pixels,A);
  
  // sketches[1].handleDraw();
   }
  if ( k== int(mix[5])) { forward = false;
  mouseX= px;mouseY= py;
    upb(mix[5]);
   //  arraycopy(r.pixels,A);
  
  // sketches[1].handleDraw();
  }
   if ( k== int(mix[6])) {
     forward = false;
    mouseX= px;mouseY= py; 
      upb(mix[6]);
   //    arraycopy(t.pixels,A);
  
 //  sketches[1].handleDraw();
   }
  if ( k== int(mix[7])) { 
    forward = false;
   mouseX= px;mouseY= py; 
     upb(mix[7]);
     // arraycopy(y.pixels,A);

  // sketches[1].handleDraw();
  }
  
    // sketches[1].handleDraw();
//  case mix[1]: 
//    forward = false;
//    break;
//  case mix[2]: 
//    forward = false;
//    break;
//  case mix[3]: 
//    forward = false;
//    break;
//  case mix[4]: 
//    forward = false;
//    break;
//  case mix[5]: 
//    forward = false;
//    break;
//  case mix[6]: 
//    forward = false;
   


    //  default:             // Default executes if the case labels
    //    println("None");   // don't match the switch parameter
    //    break;
//  }
  //    
  //    switch ulayer.get(px,py)
  //     if (ulaeyr.get(px,py)==mix[0])
  //    
  //    return nh;
}

void rip(){
  
   
  sketches[1].run();
   sketches[1].handleDraw(); 
}

