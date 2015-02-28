
int w = 256;
int h = 256;

void setup(){
 size(256,256,P2D); 
// background(255); 
for ( int x=0;x<w;x+=15){
  mouseX=x;
  mouseY=x;
  mouseReleased();
}
}

void mouseDragged(){
 pint(-1,mouseY); 
  lint(mouseX,-1); 
}

void mouseReleased(){
 pint(-1,mouseY); 
  lint(mouseX,-1); 
}

void keyReleased(){
 if(key==' ')background(255); 
}
void draw(){
  
  
}

 void pint(int x,int y){

   set(x,y,color(1));
   if(x+2<w)pint(x+1,y);
   
   
 }
 
 void lint(int x,int y){
   set(x,y,color(1));
   if(y+2<h)lint(x,y+1);
   
 }
