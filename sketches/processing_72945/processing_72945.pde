
int hours;
int minutes;
int seconds;


//setup
void setup ()
{
size (325,600);
background (200);
colorMode (HSB);
}



//Draw
 void draw() {

   int s = second ();
   int m = minute ();
   int h = hour ();
   
    // fix for 24 hour clock
    if(hours > 12) {
     hours -= 12; 


  }



/////////////////////////BOTTOM PART///////////////////////////////

//hour
   noStroke();
   fill (140);
   rect (10,560,305,30);
   //moving rect
   fill (120);
   rect (15,565,h*5,20);
   noFill();
   

//minute
   noStroke();
   fill (150);
   rect (10,530,305,30);    
   //moving rect
   fill (120);
   rect (15,535,m*5,20);
   noFill();
  
    
//seconds  
   noStroke();
   fill (160);
   rect (10,500,305 ,30);  
    //moving rect
   fill (120);
   rect (15,505,s*5,20);
   noFill();
   
////////////////////////BOTTOM PART END/////////////////////////////

//----------------------------------------------------------------//
 
////////////////////////ROUND COLOCK////////////////////////////////
 
fill (120); 
strokeWeight(6);
stroke(180);
ellipse (width/2,225,230,230);
noFill();
noStroke();

//cenert sketch

translate (width/2,225);
 
// hour

strokeWeight(5);
stroke(140);
pushMatrix();
rotate(radians (30*h));
line(0,0,0,-60);
popMatrix();


//minute

strokeWeight(5);
stroke (160);
pushMatrix();
rotate(radians (6*m));
line(0,0,0,-90);
popMatrix();



//seconds
 
 
strokeWeight (5);
stroke(180);
pushMatrix();
rotate(radians (6*s));
line(0,0,0,-115);
popMatrix();
  

////////////////////////ROUND CLOCK END/////////////////////////////
 }
