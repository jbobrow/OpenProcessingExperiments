
background(#AD6E6E);
size(500,500);

//Rectangles to create the walls on the outside of the jail
noStroke();
strokeWeight(0);
fill(#69716A);
rect (0,0,500,150);
rect (0,0,150,500);
rect (325,150,500,500);
rect (0,325,500,500);

//
stroke(0);
strokeWeight(5);

fill(#D89972);

//for loop for the heads
for(int i = 175; i<= 325; i= i+60){
  ellipse(i, 300, 50, 50);
}


//for loop for the eyes
for(int i = 167; i<= 325; i= i+60){
 ellipse(i, 296, 15, 15);
}

for(int i = 185; i<= 325; i= i+60){
 ellipse(i, 296, 15, 15);
}
//For loops to create the bars of the cell

for(int i = 150; i <= 325; i= i+30) {
  line(150, i, 325, i);
}

for(int z = 150; z <= 325; z= z+30) {
  line(z, 150, z, 325);
}

//lines to finish the bars
line(150,325,325,325);
line(325,325,325,150);




