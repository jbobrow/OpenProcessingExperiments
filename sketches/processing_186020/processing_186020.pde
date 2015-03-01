
size(800,500);
background(89,100,200);
smooth();
noStroke();

/*
These four statements help set up the basics for the sketch.
The first two set up the size and color of the canvas while the
last two set the standards for the sketch itself.
*/

for (int i = 0; i <=width; i += 60){
  for (int z = 0; z <=width/1.5; z += 20){
    float q = map(i,z,80,100,30);
    fill(180, 150);
    triangle(i,z,125,25,225,125);
    ellipse(8,z,q,3);
    rect(5,i,q,4);
    ellipse(i,1,2,q);
  }
}
/*
This is a for loop within a for loop, which allow for the creation
of a repeating patern across the body of the canvas with just the
variables seen above. It also features the use of the map function,
which helps to not only add another variable, but also simplify the
math used in creating the sketch.
*/




