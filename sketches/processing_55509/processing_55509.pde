
/* Pierre Pothier-Bradley YSDN
   Inspited by Erika Sternbergs Project 2C-Attract 
   http://www.openprocessing.org/sketch/54931
*/ 

//Define rect sizing
int a = 25;
int b = 300;
int c = 100;
int d = 300;
int e = 400;
int f = 300;
 
//Setup sketch  
void setup(){
  size (700,700);
  background (#B1FB17, 50);
  noStroke();
  smooth();
}

//Background and draw 
void draw() {
  background (#B1FB17,50);
  fill (255);
  rect (a,b,c,d);
  rect (e,f,c,d);
 
  a += 2;
  e -= 2;
   
  if(a>600) {
    a =200;
  }
  
   if(e<200) {
    e = 500;
  }

}  

