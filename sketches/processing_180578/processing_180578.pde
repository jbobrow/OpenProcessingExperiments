
/*
Chris Jung
Exercise 2: Repetition and Variation
This program draws a series of arcs, varying in size, rotation, and color
*/

size(400,400); //canvas size

background(51); //make background color black

colorMode(HSB);  // change color mode to hsb
float hue, sat, bright, alpha;
hue = random(100,200); // generate randomized color
stroke(hue, 255, 255, 255);
strokeWeight(1); // set stroke weight
noFill();

int a = 255;//set initial stroke opacity
float p = 200; //position the center of the spiral in the center 
int s = 10; //initialize s, size of the innermost arc
int j = 0; // control how many spirals are drawn
int i = 0; //initial i value set the starting point of the innermost arc

/*use this embedded for loop to draw a series of spirals, pick a random location 
on the screen for each spiral
for (j = 0; j<1; j+=1) { //draw 30 spirals, randomize location of each
  a = 255; //reset the opacity of the spiral
  hue = random(100,150); //generate new randomized color
  stroke(hue, 255,255,255);
  s +=5;
*/

  //for loop draws arc spiral
  for (i = 0; i<1800; i+=40) { //i determines how far around the unit circle the arc rotates each time through the loop
    arc(p,p,s,s,radians(i),radians(i)+radians(300)); //draw the next arc
    s += 10; //increase the size by 15
    stroke(hue,255,255,a); // set the stroke
    hue -= 3; // decrease the hue of each arc gradually
    a -= 3; // decrease the opacity of each arc gradually
    

}




