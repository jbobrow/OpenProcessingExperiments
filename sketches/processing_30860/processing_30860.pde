
int w = 128;
int h = 128;
int all = w*h;
PVector [] v=new PVector [all];

void setup(){
 size(255,255);
smooth();
 for (int _x=0;_x<w;_x+=1){
  for (int _y=0;_y<h;_y+=1){
    float dis = dist(w/2,h/2,_x,_y);
    int pos = _x+w*_y;
//   if(_x%2==0 && _y%2==0)
//   {
  
     v[pos]=new PVector(color(0,255,0,33),color(w-_x,_y,h-_y,33),color(255,0,0,33));
//   }
//   else
//   {v[pos]=new PVector(-1,1,0);
//   }
    
  } 
   
 }
 a=createImage(w,h,ARGB);
  draw1();
  imageMode(3);
}

float z;
void mousePressed(){
 background(128); 
 setup();
}
void draw(){
  z+=5;
    
 // translate(mouseX-(a.width/2),mouseY-(a.height/2)); 
translate(mouseX,mouseY);
rotate(radians(z));
 //image(a,mouseX-(a.width/2),mouseY-(a.height/2)); 
 image(a,0,0);
}
PImage a;
void draw1(){
  for (int _x=0;_x<w;_x+=2){
  for (int _y=0;_y<h;_y+=2){
    int pos = _x+w*_y;
       float dis = dist(w/2,h/2,_x,_y);
//       if(dis<w/4){
//   a.set(_x,_y,(int)v[pos].z);
//       }
  a.set(_x-1,_y-1,(int)v[pos].y); 
  }
  }
  
}
