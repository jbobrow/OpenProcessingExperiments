
PImage img; 
int w;
int h;

void setup(){
  size(520,450);
  noLoop();
  
  w = 500;
  h = 430;
  img = createImage(w, h, RGB);
  
  
  img.loadPixels();
   for(int c=0;c<img.pixels.length;c++){
     int col = color(random(255));
     img.pixels[c] = col;
   } 
   img.updatePixels();
   //image(img, 100, 100);
   for(int i=0;i<50;i++){
     iterate();
   }
}

void draw(){
  background(0,0,0);
  iterate();
  image(img, 10, 10);
}

void iterate(){
  img.loadPixels();
   for(int c=0;c<img.pixels.length;c++){
     int[] naighbors = {0,0,0,0,0,0,0,0,0};
     naighbors[0] = img.pixels[c]; //center
     if((c-1) >= 0){
       naighbors[1] = img.pixels[c-1]; //left
     } 
     if((c+1) < img.pixels.length){
       naighbors[2] = img.pixels[c+1]; //right
     }
     
     if((c-500)>=0){
       naighbors[3] = img.pixels[c-500]; //top
     }
     if((c-500-1)>=0){
       naighbors[4] = img.pixels[c-500-1]; //topLeft
     }
     if((c-500+1)>=0){
       naighbors[5] = img.pixels[c-500+1]; //topRight
     }
     
     if((c+500)< img.pixels.length){
       naighbors[6] = img.pixels[c+500]; //bottom
     }
     if((c+500-1)< img.pixels.length){
       naighbors[7] = img.pixels[c+500-1]; //bottomLeft
     }
     if((c+500+1)< img.pixels.length){
       naighbors[8] = img.pixels[c+500+1]; //bottomRight
     }
     
     int ave = 0;
     for(int i=0;i<naighbors.length;i++){
       ave += naighbors[i];
     }
     ave = ave / naighbors.length;

     img.pixels[c] = ave;
   } 
   img.updatePixels();
   
}

void keyPressed(){
  if(key == 'i'){
    redraw();
  }
}

                
                                
