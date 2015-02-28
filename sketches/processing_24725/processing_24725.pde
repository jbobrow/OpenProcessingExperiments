

int space = 0;
int change = 10;
int third = 700;
int chuck = 100;


void setup(){
   size(400,800);
   background(32,163,242);
   smooth();
   
}



void draw()
{
 stroke(255,255,255);
 strokeWeight(15);
 line(space,0,space,height);
 space = space+40;
 
 stroke (0,0,0);
 strokeWeight (10);
 line(change,0,change,height);
 change = change+40;

 
 strokeWeight(20);
 line(0,third,400,chuck);
 third = third+100;
 chuck = chuck+100;

 
 noStroke();
 fill (49,7,167);
 triangle(0,0,400,0,0,600);

}



