
int i=0, j=0;
int blocksize =15;
void setup(){
  size(400,400);
  background(#223344);
  frameRate(9);
  noStroke();
}
 void draw(){
   do{
     fill(random (0,255),50,200);
     ellipse(i,j,blocksize,blocksize);
     i+=35;
     if(i>height){
       j=j+35;
       i=0;
     }
     if(j>=width){
       i=0;
       j=0;
     }
   } while(0!=0); /*bucle infinit*/
 }


