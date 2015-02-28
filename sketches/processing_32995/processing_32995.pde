
int rect_x=20;
int rect_y=20;
int V=1;
int rect_w=100;

/*  
PFont my_font;
my_font = loadFont("font filename.vlw"); */



void setup() {
  size(720,479);
  frameRate(350);
noStroke(); 

}

void draw() {
  PImage who_is_that;
who_is_that = loadImage("me.jpg");
image(who_is_that,0,0);

/*  
  PImage my_image;
my_image = loadImage("vicious_thunder.jpg");
image(my_image,0,0);
*/

  if ((10<mouseY) && (mouseY<70))
     {background(0,0,255);}
   if ((100<mouseY) && (mouseY<140))
     {background(255,0,0);}
   if ((240<mouseX) && (mouseX<400))
     {background(98,25,186);}   
  fill(255);
  rect(rect_x,mouseY-50,rect_w,100);
  fill(255,0,0);
  rect(mouseX-50,rect_y,25,100);
  rect_x=rect_x+V;
  rect_y=rect_y+V;
  
  
  if ((rect_x +rect_w > mouseX) || (rect_x==0))
     { V= V* -1; }
     
  
/*   fill(68,12,126);
  rect(rect_x,20,100,100);
  rect(rect_x-300,20,100,100);
  rect(rect_x,140,100,100);
  rect(rect_x-300,140,100,100);           //horizontal
  
  fill(24,98,0);
  rect(75,rect_y,50,50);
  rect(75,rect_y-300,50,50);             //vertical
  rect(225,rect_y,50,50);
  rect(225,rect_y-300,50,50);
 
  fill(56,236,255);
  rect(rect_x,rect_y,125,125);           //diagonal
  rect(rect_x-300,rect_y-300,125,125);     
  rect_x=rect_x+V;     //rect_x +=1
  rect_y=rect_y+2;
  if (rect_x>300) 
     {V= V*-1;}
  if (rect_y>300)
     {rect_y=0;}  
 // rect(rect_x,20,100,100);     
*/    
}  

