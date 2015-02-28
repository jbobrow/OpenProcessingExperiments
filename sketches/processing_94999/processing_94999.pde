
/* @pjs preload="f1.jpg, f2.jpg, images.jpg"; 
 */

void setup(){
  size(200,200);
  background(255);

  
}


void draw(){
  PImage img = loadImage ("f2.jpg");
  int ex=2;
  int ladox = (width-7*ex)/8;
  int x=0;
for(x=0;x<200;x+=25){
  for(int y=0; y<200; y+=25){
   fill(255);
   rect(x,y,ladox,ladox);
  }
}
for(int i=0; i<8;i++){
  fill(0);
  if(i%2 != 1){
   image (img,1*(ladox+ex), i*(ladox+ex), ladox, ladox);
   image (img,(2*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   image (img,(5*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   image (img,(6*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   }
   else{
   image (img,(0*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   image (img,(3*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   image (img,(4*(ladox+ex)), i*(ladox+ex), ladox, ladox);
    image (img,(7*(ladox+ex)), i*(ladox+ex), ladox, ladox);
   }
  noLoop();
}
}


