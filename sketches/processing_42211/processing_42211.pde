
int a = 40;
int b = 234;
int c = 0;
int x = 0;
int y = 0;

void setup() 
{
  size(300, 300);
  background(225);
  smooth();
}



void draw() 
{
  fill(225,90);
  rect(0,0,300,300);
  noStroke();
  fill(255);
 
  
  x = a + mouseX ;
  
  println(y);
  println(x);
  println(mouseX);


  if(mouseX > 150 && mouseX > 0){
    y = mouseX - 110; 
   }
 
   else{
    y = b - x;
     }

 fill(0,255,0,90);
 ellipse (20, 20, x, x);
 ellipse (20, 280, x, x);
 ellipse (280, 20, x, x);
 ellipse (280, 280, x, x);
 
 fill(255,0,0,90);
 ellipse (150,20, y, y);
 ellipse (150,280, y, y);

}


