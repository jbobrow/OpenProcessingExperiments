
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
 int num1 = 150;
 int num2 = 325;
for(int i = num1; i <= num2; i= i+30) {
  line(num1, i, num2, i);
}
 
for(int z = num1; z <= num2; z= z+30) {
  line(z, num1, z, num2);
}

// mapping for the ellipse above the cell
float value1 = 47;
float m = map(value1, 0, 100, 0, width);
fill (0, 80, 214, 120);
stroke(0);
ellipse(m, 100, 100, 75);




// mapping for the rectangle above the cell
float value2 = 41;
float v = map(value2, 0, 100, 0, width);
fill (0, 219,168,168);
noStroke();
rect(v, 75, 60, 50);
//lines to finish the bars

stroke(0);
strokeWeight(5);
fill(#D89972);
line(150,325,325,325);
line(325,325,325,150);
//

//Text for the number in the cell
fill(0);
textSize(20);
stroke(255);
text("#102",210,105);




