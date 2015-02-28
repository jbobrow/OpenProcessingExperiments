
//Palettes
//https://kuler.adobe.com/#create/fromacolor
color[] pbn={#482757,#620A8A,#2C053D,#7F668A};
void setup(){
size(300,300);
smooth();
background(pbn[0]);
ellipseMode(CENTER);
}
int w=150;
int h=100;
void draw(){
  fill(pbn[1]);
ellipse(width*1/4,height/2,w,h);
 
 fill(pbn[2]);
ellipse(width*2/4,height/2,w,h);
 
 fill(pbn[3]);
ellipse(width*3/4,height/2,w,h);
}
