
public int layers = 16;
public boolean showtrails = true;
public boolean firstpass = true;
PImage a,b;
void setup(){
  size(255,255,JAVA2D);
  smooth();
  a = loadImage("cme.png");
  b= loadImage("cap.png");
  image(b,0,0);
}
void mousePressed(){
 if (mouseButton==37)showtrails=!showtrails; 
}
void draw(){
 if (key=='1')image(a,0,0);
  if (key=='2')image(b,0,0);
  if (key=='3'){
    firstpass = true;
    demo();
   
  }
   firstpass = false;
}

public int x;

void demo(){
  if (firstpass){
    
    if (!showtrails) background(-1);
  }
  x++;
  if (x>width*layers)
  {
   x=0; 
   background(-1);
  }
color c =b.pixels[x];
mouseX=gr(c);
if(!online)println(mouseX);
mouseY= gg(c);
if(!online)println(mouseY);
fill(c);
ellipse(mouseX,mouseY,10,10);
    //for (int x=0;x<height;x++){
      
    //}
  
}

//
//
//
color gr(color col){
color   retval  =0;

  retval = col >> 16 & 0xff;
 return retval ;
}
//
//
color gg(color col){
color   retval  =0;

  retval = col >> 8 & 0xff;
 return retval; 
}
//
color gb(color col){
color   retval  =0;

  retval = col  & 0xff;
 return retval ;
}

