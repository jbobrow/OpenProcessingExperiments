
int x = 0;
int y = 0;
int gradient = 0;
float bigness = 10;

void setup(){
  size(800,800);
  
}

void draw(){


noStroke();

   while (x<height){
    
        while (y<width){
         fill(gradient);
         rect(y, x, bigness, bigness);
         y = y + 10;
      }
      
   y = 0;
   x = x + 10; 
   triangle(random(75,725), random(75,725),random(75,725),random(75,725), random(75,725), random(75,725));

   gradient = gradient + 3;
   bigness = bigness - 0.1;
  
  }
}

  



