
int w=500,t=0,c=w/2;
void setup(){
  size(w,w);
background(2,211,108);noStroke();
}
void draw(){
for(float r=c;r>0;r-=.3){float a=r*(t+mouseX*17)*.001;
ellipse(c+cos(a)*r,c+sin(a)*r,2,2);}
filter(13);
filter(20);t++;} 


   
void mousePressed () { 
  setup(); 
} 
 


