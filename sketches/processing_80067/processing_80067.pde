
PImage picasso;

void setup (){
   size (800,600);
   picasso = loadImage ("529617_10151057499229406_1494344298_n.jpg");
}

void draw (){
  background (0);
 
  
  for( int v=0 ; v<= height ; v+=100){
    for (int b=0;b<=width ; b+=100){
  tint (255,255,255,50);
      image (picasso,b,v);
    }
  }
  
   imageMode (CENTER);
  image (picasso,400,300);
}

