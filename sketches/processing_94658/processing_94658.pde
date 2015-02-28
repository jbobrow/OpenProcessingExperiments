
//asa
void setup (){
  size (200, 200);
 background(81,226,252); 
}


 void draw (){
int x=-100;
int y=100;
stroke(255);
ellipse(100,100,10,10);
while (x<=100) {    
 line (-x+100, -(x*x/100)+100,100,100);
 x=(x+5);
 }


 }
