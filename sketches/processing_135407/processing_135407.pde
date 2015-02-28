
int x;
int y;

void setup(){
  
  size (400, 400);
  x = width;
  y = height;
}
 void draw (){
  fill(random(255),100,150);
  textSize(x);
  text("A",x*0,y); 
  x=x+height/100;
   if(x>width*3){
     x=0;
   }
 }


