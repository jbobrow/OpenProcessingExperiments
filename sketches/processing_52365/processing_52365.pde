


void setup(){
  size(600,600);


   PImage img;
 pushMatrix();
 img = loadImage ("purple.jpg");
   
   for (int i=0; i <4; i++){
   translate(100,0);
   image (img,0,0);

   }
  
   
}

