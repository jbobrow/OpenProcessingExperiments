
/*
 *
 */
 
 PImage img, img2;
 int r, g, b, x, a;
 int ran;
 int up, down, left, right, upleft, upright, downleft, downright, centre;
 int count = 1;
 color col;
 void setup()
 
 {
   size(400, 400);
   img = createImage(400, 400, ARGB);
   ran = 10;
   smooth();
   
   for(int i = 1; i < img.pixels.length; i++){
     
     img.pixels[i] = color(0, 0, 0, 255);
   }
       
       //img.pixels[int(random(img.pixels.length))] = color(0, 0, 0);
      // print(r + "-" + g + "-" + b);
    
}

 
 void draw()
 {
   background(0);
   img2 = createImage(400, 400, ARGB);


   img2.pixels[0] = (img.pixels[0] + img.pixels[1] + img.pixels[width] + img.pixels[width + 1]) / 4 + int(random(ran)) - ran/2;;
   
   for(int i = 1; i < img2.pixels.length; i++){
     up = i - width;
     down = i + width;
     left = i - 1;
     right = i + 1;
     upleft = i - img.width - 1;
     upright = i - img.width + 1;
     downleft = i + img.width - 1;
     downright = i + img.width + 1;
     centre = i;
     
     if(i < img2.width){
       if(i == img2.width - 1){ 
         //top right hand corner
         img2.pixels[i] = (img.pixels[centre] + img.pixels[left] + img.pixels[downleft] + img.pixels[down]) / 4 + int(random(ran)) - ran/2;    
       }else{ 
         // top row, excluding top right corner
         img2.pixels[i] = (img.pixels[left] + img.pixels[right] + img.pixels[down] + img.pixels[downleft] + img.pixels[downright] + img.pixels[centre]) / 6  + int(random(ran)) - ran/2;
       }
     }else{
       if(i % img.width == 0 && i < img.pixels.length - img.width){
         //left hand side excluding bottom left hand corner
         img2.pixels[i] = (img.pixels[centre] + img.pixels[up] + img.pixels[down] + img.pixels[upright] + img.pixels[downright] + img.pixels[right]) / 6 + int(random(ran)) - ran/2;
       }else if(i % img.width == 0 && i == img.pixels.length - img.width){
         //bottom left hand corner
         img2.pixels[i] = (img.pixels[centre] + img.pixels[up] + img.pixels[upleft] + img.pixels[right]) / 4 + int(random(ran)) - ran/2;
       }else if(i % img.width == img.width - 1 && i < img.pixels.length - 1){
         //right hand side excluding bottom right hand corner
         img2.pixels[i] = (img.pixels[centre] + img.pixels[up] + img.pixels[down] + img.pixels[left] + img.pixels[upleft] + img.pixels[downleft]) / 6  + int(random(ran)) - ran/2;
       }else if(i == img.pixels.length - 1){
         //bottom right hand corner
         img2.pixels[i] = (img.pixels[centre] + img.pixels[up] + img.pixels[left] + img.pixels[upleft]) / 4 + int(random(ran)) - ran/2;
       }else if(i > img.pixels.length - width && i < img.pixels.length - 1){
         //bottom row excluding both bottom corners
         img2.pixels[i] = (img.pixels[centre] + img.pixels[left] + img.pixels[right] + img.pixels[up] + img.pixels[upleft] + img.pixels[upright]) / 6  + int(random(ran)) - ran/2;
       }else if(i % img.width != 0 && i % img.width != img.width - 1 && i < img.pixels.length - width){
         img2.pixels[i] = (img.pixels[centre] + img.pixels[up] + img.pixels[down] + img.pixels[left] + img.pixels[right] + img.pixels[upleft] + img.pixels[upright] + img.pixels[downleft] + img.pixels[downright]) / 9 + int(random(ran)) - ran/2;
     }
   }
   }
     
   img = img2;
   if(count < 15){
  
     img2.pixels[int(random(img.pixels.length))] = color(0, 0, 0, 0);

   }
   count++;
   
   image(img2, 0, 0);
   
 }
 
 void mouseClicked(){
   count = 0;
   for(int i = 1; i < img.pixels.length; i++){
     img.pixels[i] = color(0, 0, 0, 255);
   }
 
 }
 

