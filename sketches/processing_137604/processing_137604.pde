

void setup(){
size(400,400);
}

void draw(){
  background(255,255,255);

 int h = 195;
 while (h > 100) {
//   fill(0,0,0);
   ellipse(width/2, height/2, h, h);
      ellipse(width/2, height/2, h-10, h-10);

   ellipse(width/2, height/2, h-10, h-10);
   ellipse(width/2, height/2, h-10, h-10);
  
      


   h = h - 2;
   // fill(0,0,0);
   ellipse(width/2, height*h,h,h);
   ellipse(width/4,height,6,9);
   
 
   
}

}



