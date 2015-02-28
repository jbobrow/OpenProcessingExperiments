
float x = random(width);
float x2 = random(width);
int y = 0;
int y2 = height;
float bigness = 0;
 
void setup(){
  size(800,400);
  background(random(255),random(255),random(255));
   
}
 
void draw(){
 
 
noStroke();
 
   ellipse(x,y, bigness,bigness); 
   
   ellipse(x2,y2, bigness, bigness);
   y2--;
   y++;
   bigness = bigness + 0.1;
   
   if(y>height || y2<0)
   {
     fill(random(255),random(255));
      y2 = height;
      x2 = x = random(width);
      x = random(width);
      y = 0;
      bigness = 0;
   }
   
   
  }

 



