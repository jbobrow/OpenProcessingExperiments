
/*
Suzanne Boretz
Exercise 2: Repetition and Variation
This program creates a pattern of squares and parallelograms
*/

size(400,400); //sets window size
background(10,10,10); //sets background color

int w = 30; //defines the variable w
int e = 0; //defines the variable e (only used for counting)

//below are all the variable color values
float Ra = 120; 
float Rb = 190;
float Rc = 210;
float Rd = 130;
float Ba = 0;
float Bb = 80;
float Ga = 40;
float Gb = 60;

noStroke(); //sets no stroke

for(int i = 0; i <= width; i = i + (3 * w)){ //outer for loop (rows)
 for(int j = 0; j <= height; j = j + w + (w/2)){ //inner for loop (column)
   e++; //e increases by 1 each time the for loop cycles
   println(e); //just to see that e is increasing
   
   //what color will the first pair of squares be?
   if(e%2 == 0){ //check if e is even or odd
     fill(Rc,Gb,Ba); //sets fill color if even
   }
   else{
     fill(Rb,Gb,Bb); //sets fill color if odd
   }
   rect(i + (w/2), j + (w/2), w, w); //draws a square
   
   //what color will the first pair of parallelograms be?
   if(e%2 == 0){ //check if e is even or odd
     fill(Ra,Ga,Ba); //sets fill color if even
   }
   else{
     fill(Rd,Gb,Bb); //sets fill color if odd
   }
   quad(i, j, i + (w/2), j + (w/2), i + (w/2), j + w + (w/2), i, j + w); //draws a parallelogram
   
   //what color will the second pair of parallelograms be? 
   if(e%2 == 0){ //check if e is even or odd
     fill(Ra,Ga,Ba); //sets fill color if even
   }
   else{
     fill(Rd,Gb,Bb); //sets fill color if odd
   }
   quad(i + w + (w/2), j + (w/2), i + (2 * w), j, i + (2 * w), j + w, i + w + (w/2), j + w + (w/2)); //draws a parallelogram
   
   //what color will the second pair of squares be?
   if (e%2 == 0){ //check if e is even or odd
     fill(Rd, Gb, Bb); //sets fill color if even
   }
   else {
     fill(Rc, Gb, Bb); //sets fill color if odd
   }
   rect(i + (2 * w), j, w, w); //draws another square
 }
}
