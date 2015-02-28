
// WEEK 7 - November 9th. 2010.
//Abstraction: Modularity in code - easier to maintain and read
 

//void setup()
//{
//  // Pass integer to function below
//   rollDice(1,100);
//   println("Finished"); 
//}
//
//
//// Specify the variable to expect
//void rollDice(int num1,int num2)
//{
//   int dice1 = int(random(num1,num2));
//    println ("Rolled " + dice1);
//   
//}

color red = color(255,0,0);
color green = color(0,255,0);
color blue = color(0,0,255);

void setup() {
 size (900,900);
  smooth();
 
}

void draw() {

  background(50);
 //Declare the parameters
   drawIt(100,100,230); 
   drawIt(400,100,30); 
   drawIt(700,100,70); 
   
    drawIt(100,400,red); 
   drawIt(400,400,10); 
   drawIt(700,400,250); 
   
    drawIt(100,700,20); 
   drawIt(400,700,180); 
   drawIt(700,700,150); 
 
}

void drawIt(int x, int y, int s) {   
   stroke(s);
   strokeWeight(5);
   strokeCap(ROUND);
   line(x-30,y,   x+30,y+30);
   line(x,y+30,   x+20,y-30);
   
}








