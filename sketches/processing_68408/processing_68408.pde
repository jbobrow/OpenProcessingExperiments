
int w = 255;
int h = 255;
void setup(){
  
 size(255,255,JAVA2D);
smooth(); 
noStroke();
background(255,0,0);
fill(0,255,0,128);
for (int x=25;x<w-25;x++){
  fill(0,255,0,64);
 ellipse(x,h/2,50,50); 
 ellipse(w/2,x,50,50);
 fill(0,255,0);
 ellipse(25,h/2,25,25); 
}

}
