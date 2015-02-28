
class Face {
 //What are the properties
 float x;
 float y;
 
 //What are is functions?
 // IMPORTANT - constructor function
 // called once in the beginning
 Face () {
   x = random(0,200);
   y = random(100,200);
   
   println("Hey I am a new face");
   display ();
 }
 
void display () {

///left hand
line(x-60,y-50,x-25,y-25);

///right hand
line(x+60,y-30,x-20,y-25);

///body
fill(255);
ellipseMode(CENTER);
ellipse(x,y+50,100,100);

///body
fill(255);
ellipseMode(CENTER);
ellipse(x,y-10,70,70);

///head
fill(255);
ellipseMode(CENTER);
ellipse(x,y-50,50,50);

///hat
fill(0);
stroke(0);
rect(x-30,y-70,60,5);

///top hat
fill(0);
stroke(0);
rect(x-25,y-95,50,30);

///left eye
fill(0);
ellipseMode(CORNER);
ellipse(x-20,y-60,10,10);

///right eye
fill(0);
ellipseMode(CORNER);
ellipse(x,y-60,10,10);

///nose;
fill(245,163,10);
triangle(x-5,y-40,x-30,y-35,x-12,y-47);  
   
 }
     
}



