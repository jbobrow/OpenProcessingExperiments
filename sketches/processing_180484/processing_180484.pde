
//repeating, rotating, scaling and translating arcs

size(800, 800);            // 800x800 canvas
smooth();                  // Antialiasing
ellipseMode(CORNER);       // start arc at top left of box
//noStroke();
fill(#B799FE);             // Set fill color
int arcX = 0;              // Parameterize arc X location
int arcY = 0;              // Parameterize arc Y location
int arcH = 800;            // Parameterize arc height
int arcW = arcH;            // Parameterize arc width
float arcS = radians(90);  // Set arc start to 6 0'clock
float arcE = radians(360); // Set arc end to 3 0'clock

/* 
for a variable whose starting value is 1,
so long as the resulting value is less than 100,
add 3 to the current value for this iteration.
*/

for(int i = 1; i < 100; i = (i + 3)){
  
  scale(.9);  // reduce the generated arc to 90% of its size
  arc((arcX+i), (arcY+i), (arcH-i), (arcH-i), (arcS - i), arcE);
  /* 
     The starting x-value of each arc will be arcX plus the number of this iteration.
     The starting y-value of each arc will be arcY plus the number of this iteration.
     The height of each arc will be arcH minus the number of this iteration.
     The width of each arc will be arcH minus the number of this iteration.
     The start of this arc will be arcS minues the number of this iteration.
     The end of this arc will be arcE, or 0.
  */
}


