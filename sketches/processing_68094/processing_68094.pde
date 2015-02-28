
int w = 256;
int h= 256;
PImage a;
PImage b;
void setup(){
  
  a=createImage(w,h,ARGB);
  b=createImage(w,h,ARGB);
  size(768,256,JAVA2D);
  smooth();
  background(255);
  for(int x=0;x<255;x++){
   stroke(1,x);
  line(x,0,x,25); 
  stroke(1,255-x);
   line(x,h-25,x,h);

  
  }
  
    for (int x=0;x<255;x++){
   for (int y=0;y<25;y++){
    a.set(x,y,color(1,x));
   a.set(x,h-y,color(1,255-x)); 
    b.set(x,y,color(1,x));
   b.set(x,h-y,color(1,255-x)); 
   }
  } 
//  noSmooth();
  strokeWeight(1);

for (int x=0;x<128;x++){
  
noFill();
stroke(a.pixels[x]);
  ellipse(w/2,h/2,x,x);
 
}

PVector cenx  = new PVector(w/2,h/2);

for (int x=0;x<w;x++){
  
 for (int y=0;y<h;y++){
  float dis = dist(x,y,cenx.x,cenx.y);
  if (dis<64){
 // if(x<w/2) a.set(x,y,blendColor(a.get(x,h-2),a.get(int(dis),1),ADD)); 
  //if(x>=w/2)
  a.set(x,y,blendColor(a.get(x,1),a.get(int(dis),1),ADD)); 
  b.set(x,y,blendColor(b.get(x,h-2),b.get(int(dis),1),ADD)); 
   
  }
  if(int(dis)==64){
    
   noStroke();
  fill(int(dis),1);
   ellipse(w+x,y,2,2); 
   ellipse((w*2)+x,y,2,2); 
  }
 } 
}
image(a,w,0);
image(b,w*2,0);
smooth();
noFill();
stroke(1,200);
strokeWeight(3);
ellipse(w+cenx.x,cenx.y,128,128);
ellipse(w*2+cenx.x,cenx.y,128,128);
//for (int x=0;x<w;x++){
//  
// for (int y=0;y<h;y++){
//  float dis = dist(x,y,cenx.x,cenx.y);
// 
//  if(int(dis)==64){
//    
//   noStroke();
//  fill(1,int(dis));
//   ellipse(w+x,y,2,2); 
//  }
// } 
//}

}
