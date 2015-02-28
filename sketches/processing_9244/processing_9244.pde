
 // All Examples Written by Casey Reas and Ben Fry  
 // unless otherwise stated.  
 Handle[] handles;  
 int num; 

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
boolean once = true; 
   
 void setup()  
 {  
   size(200, 200);  
   num = height/15;  
   handles = new Handle[num];  
   int hsize = 10;  
   for(int i=0; i<num; i++) {  
     handles[i] = new Handle(width/2, 10+i*15, 50-hsize/2, 10, handles);  
   } 
  colorMode(HSB);
  //details for minim, line out with oscillator, speed set to portamento and added
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(10);
  out.addSignal(sine); 
 }  
   
 void draw()  
 {  
   background(153);  
     
   for(int i=0; i<num; i++) {  
    handles[i].update();  
     handles[i].display();  
   }  
     
   fill(0);  
   rect(0, 0, width/2, height);  
 }  
   
 void mouseReleased()   
 {  
   for(int i=0; i<num; i++) {  
     handles[i].release(); 
    {
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
} 
   }  
 }  
   
 class Handle  
 {  
   int x, y;  
   int boxx, boxy;  
   int length;  
   int size;  
   boolean over;  
   boolean press;  
   boolean locked = false;  
   boolean otherslocked = false;  
   Handle[] others;  
     
   Handle(int ix, int iy, int il, int is, Handle[] o)  
   {  
     x = ix;  
     y = iy;  
     length = il;  
     size = is;  
     boxx = x+length - size/2;  
     boxy = y - size/2;  
     others = o;  
   }  
     
   void update()   
   {  
     boxx = x+length;  
     boxy = y - size/2;  
       
     for(int i=0; i<others.length; i++) {  
       if(others[i].locked == true) {  
         otherslocked = true;  
         break;  
       } else {  
         otherslocked = false;  
       }    
     }  
       
     if(otherslocked == false) {  
       over();  
       press();  
     }  
       
     if(press) {  
       length = lock(mouseX-width/2-size/2, 0, width/2-size-1);  
     }  
   }  
     
   void over()  
   {  
     if(overRect(boxx, boxy, size, size)) {  
       over = true;  
     } else {  
       over = false;  
     }  
   }  
     
   void press()  
   {  
     if(over && mousePressed || locked) {  
       press = true;  
       locked = true;  
     } else {  
       press = false;  
     }  
   }  
     
   void release()  
   {  
     locked = false;  
   }  
     
   void display()   
   {  
     line(x, y, x+length, y);  
     fill(255);  
     stroke(0);  
     rect(boxx, boxy, size, size);  
     if(over || press) {  
       line(boxx, boxy, boxx+size, boxy+size);  
       line(boxx, boxy+size, boxx+size, boxy);  
     }  
   
   }  
 }  
   
 boolean overRect(int x, int y, int width, int height)   
 {  
   if (mouseX >= x && mouseX <= x+width &&   
       mouseY >= y && mouseY <= y+height) {  
     return true;  
   } else {  
     return false;  
   }  
 }  
   
 int lock(int val, int minv, int maxv)   
 {   
  return  min(max(val, minv), maxv);   
}
void stop () {
  out.close();
  minim.stop();
  
  super.stop();
}

