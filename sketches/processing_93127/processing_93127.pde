
// Emanuele S. Reis - Praça

void setup (){
size (200,200);
background (103,71,50);
}
void draw (){
 fill (53,121,77);
 noStroke ();
  rect (20,30,160,140);
for (int x=10; x<200; x=x+55)
  for (int y=180; y<200; y=y+55)
{ 
  fill (150); 
 rect (x, y, 20, 5);
  rect (x,y-170, 20,5);
  }
for ( int a=50; a<200; a=a+55){
     fill (38,72,15);
      ellipse (a, 10, 15, 15);
     ellipse (a, 180, 15,15);
    fill (60);
     rect (a,30,10,10);
     rect (a,60,10,10);
     rect(a,120,10,10);
     rect (a,150,10,10);
    } 
  fill (38,72,15);
    ellipse (50, 150,20,20);
     ellipse (60, 170,20,20);
     ellipse (150,160, 15, 15);
     ellipse (10,40, 50,50);
     ellipse (30,40, 30,30);
     ellipse (80,30, 30, 30);
     ellipse (150,60,50,50);
     ellipse (180, 80, 15,15);
     ellipse (80, 130, 30,30);
     ellipse (50, 100, 45,45);
     ellipse (130, 140, 30,30);
   }
