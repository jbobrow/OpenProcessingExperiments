
/* Code exercise done by Julia Grzeskowiak
York/Sheridan Joint Program in Design */

size (250, 250);
background (255);      // background set to white
smooth();
strokeWeight(8);       // set thicker stroke weight to a rounded strokecap
stroke(204, 102, 10, 80);  // storke colour set- R:204, G:102, B:10, opacity: 80.



int x = 10; // set integer x equal to 10

for (x=10 ; x<120 ; x+=20){     //for when x=10, and x is less than 120, and x adds increments of 20,
  
line (125, x,x+130, 125);       //x-coordinate1 = 125, y-coordinate1 = x variable, x-coordinate2= x variable(10)+130, y-coordinate2 = 125.
line (125, x+130, x, 125);      //x-coordinate1 = 125, y-coordinate1 = x variable(10) +130, x-coordinate2= x variable(10), y-coordinate2 = 125.
line (125, 120-x, x, 125);      //x-coordinate1 = 125, y-coordinate1 = 120- x variable(10), x-coordinate2= x variable(10), y-coordinate2 = 125.
line (125, 250-x, x+130, 125);  //x-coordinate1 = 125, y-coordinate1 = 250- x variable(10), x-coordinate2= x variable(10) + 130, y-coordinate2 = 125.


  }

