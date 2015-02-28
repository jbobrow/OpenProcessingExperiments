
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
  boolean signal=true;
  Handle[] others;
  String name;
  Integrator integrator=new Integrator(0,0.9,0.1);//add the bouncing effects when data changing
  int preY=0;

  
  
  Handle(int ix, int iy, int il, int is, Handle[] o,String n)
  {
    x = ix;
    y = iy;
    length = il;
    size = is;
    boxx = x - size/2;
    boxy = y -length- size;
    others = o;
    name=n;
    integrator.target(il);
  }
  
  void update() 
  {
    boxx = x-size/2;
    boxy = y - length;
    
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
      float distance;
         if(mouseY-preY>0)
          distance=map(mouseY-preY,0,400,0,20);
         else 
          distance=map(mouseY-preY,0,-400,0,-20);
         length = lock(int(length-distance), size/2, height/4);
         integrator.target(length);
    }
  }
  
  void over()
  {
    if(overRect(boxx, boxy-size*2, size, size*4)) {
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
      if(signal) {preY=mouseY;}
      signal=false;
    } else {
      press = false;
    }
  }
  
  void release()
  {
    locked = false;
    signal=true;
    
  }
  void recharge(){
    integrator.value=0;
    integrator.target(length);
  }
  
  void display(){
    integrator.update();
    float value=integrator.value;
    if(!backColor)
      {fill(0);
      stroke(0);}
     else 
      {fill(0,0,99);
       stroke(0,0,99);}
    line(x, y, x, y-value);
    
    textFont(marker,size);
    textAlign(CENTER);
    
    int number;
    if(!locked){
    if(abs(value-length)<4) 
    number=length;
    else number=int(value);
    }
    else number=length;
    
    text(number,boxx+size/2,y -value);
    if(over || press) {
     text(name,boxx+size/2,y -value- size);
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

