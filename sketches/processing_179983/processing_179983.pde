
/*
Joanna Ngai
DESIGN 479
Exercise 1: Self-portrait
Creates a Self Portrait
*/

size(100, 100); //Setup canvas size

background(147, 230, 209); //Creates background color

fill(255, 255, 255); //Fills ellipse with white
noStroke(); //Makes no stroke for ellipse
ellipse(50, 50, 80, 80); //Creates ellipse

rect(10, 50, 80, 40); //Creates rectangle
fill(147, 230, 209); //Fills rectangle with green
rect(20, 83, 1, 13); //Creates 2nd thin rectangle from left side
rect(14, 80, 1, 13); //Creates 1st thin rectangle from left side
rect(84, 80, 1, 13); //Creates 4th thin rectangle from left side
rect(78, 83, 1, 13); //Creates 3rd thin rectangle from left side

fill(247 ,203, 190); //Fills ellipse with pink
stroke(255,255,255); //Makes white stroke for ellipse 
ellipse(50, 50, 70, 70); //Creates ellipse

fill(255, 0, 0); //Fills triangle with red
stroke(255, 0, 0); //Makes red stroke for triangle
triangle(44, 40, 47, 48, 41, 48); //Creates triangle
ellipse(44, 51, 8, 8); //Creates ellipse intersecting with triangle

line(25,40, 25, 45); //Creates line on the left
line(70,40, 70, 45); //Creates line on the right

fill(255, 255, 255); //Fills arc with white
stroke(255, 255, 255); //Makes white stroke for arc
arc(45, 65, 10, 10, 0, PI); //Creates arc

noStroke(); //Makes no stroke for ellipses
fill(255, 255, 255, 80); //Fills ellipses with slightly transparent red
ellipse(25, 50, 10, 10); //Creates ellipse on left
ellipse(70, 50, 10, 10); //Creates ellipse on right
  


