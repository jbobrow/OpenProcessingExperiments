
int x = 0;
int y = 0;
int gradient = 0;
float bigness = 10;
int increment = 0;


void setup(){
  size(800,800);
  
}

void draw(){
  
int rotate = 0;
while(rotate<800)
  {
  noFill();
  stroke(0, 0, 0);
  bezier(800-rotate, 0+rotate, 500-rotate, 700-rotate, 100+rotate, 300-rotate, 0+rotate, 800-rotate);
  
  rotate = rotate + 10;
  
  }

while(rotate<400)
  {
  noFill();
  stroke(0, 0, 0);
  bezier(800+rotate, 0-rotate, 500+rotate, 700+rotate, 100-rotate, 300+rotate, 0-rotate, 800+rotate);
  
  rotate = rotate + 10;
  
  }
  
  line(800, 0, 0, 800);
  line(0, 0, 800, 800);
    





noStroke();

   while (x<height){
    
        while (y<width){
         
         fill(random(0,255),random(0,255));
         ellipse(y, x, bigness, bigness);
         fill(random(0,255),random(0,255),random(0,100));
         float rectSize = random(0,bigness/2);
         rect(random(0, 800), random(0,800), rectSize, rectSize);
         y = y + 10;
      }    
   y = 0;
   x = x + 10; 
   gradient = gradient + 3;
   bigness = bigness - 0.2;
   
   fill(150);
   triangle(random(0,800),random(400,600),random(0,800),random(400,600),random(0,800),random(400,600));
   fill(175);
   triangle(random(0,800),random(400,600),random(0,800),random(400,600),random(0,800),random(400,600));
}

}

  



