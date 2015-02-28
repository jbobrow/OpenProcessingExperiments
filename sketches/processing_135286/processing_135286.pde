
//Control 1 - Decisions
//Exercise #2
/*2. Create a composition with a series of lines and ellipses. 
Use an if structure to select which lines of code to run and 
which to skip.*/


int y = 300;
int x = 0;
void setup () {
  size (400,400);
}

void draw (){
  ellipse(200,200, 100,200);
  
  line(200,300, 200, y);
  y--;
  
  if (y< 100) {
    x=x+1;
    fill(x);
    ellipse(200,200,100,200);
    
  }
 
 if (y< 0 ){
  y = 300;
 }
 
  if (x > 255) {
   x = 0;
 }
 println(y,x);
 

} 


