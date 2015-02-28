
//Playgramming: 1/13/14, homework 1
//D.G.Kahn, Mondrian-Stella progression.




//ABOUT WORK:
//I was inspired by Tlingit art and Navajo patterns and adopted their pallet and patterns into a piece inspired by both Nadir Alfonso and Pieter Mondrian.
//The colours are strong and work together to give body to the shapes in a way that is an inversion of Mondrian's white-colour dynamic and more visually striking than the soft and velvetine tones of Alfonso.
//The idea was to create a piece that had both the stark structure of Mondrian and the grace of Alfonso.
//Hopefully it came close?

//ABOUT CODE:
//Some of the code may be unnecessary, though I tried to simplify things down. I prefer hexcolor to other methods, and I chose not to animate as it seemed out of place.
//Size was decidedly square, for balance, and deviations from form are deliberate.

//Begin;

void setup()
{
 size(660,660);
 background(#22222d);
}

void draw()
{
 
 //We begin with disciplined shapes...
 fill(#FFFFFF);
 ellipse(0,0,600,600);
 
 fill(#22222d);
 ellipse(0,0,599,599);
 
 fill(#FFFFFF);
 ellipse(0,0,455,455);
 
 fill(#22222d);
 ellipse(0,0,400,400);
 
 fill(#000000);
 ellipse(0,0,380,380);
 
 fill(#FFFFFF);
 ellipse(0,0,370,370);
 
 //add colour dynamics utilizing the form (Composition II in Red, Blue, and Yellow by Mondrian)...
 //colours from the Tlingit pallet, with minor variations in depth on reds...
 
 //we change the stroke weight to let the red bleed into the boarder, but only here...
 strokeWeight(0);
 fill(#E11112);
 rect(0,0,130,130);
 
 //stroke weight reverts, we get independent forms again...
 strokeWeight(1);
 fill(#FFFFFF);
 rect(0,0,120,120);
 
 fill(#E11112);
 rect(0,0,115,115);
 
 //we leave the stroke weight the same to give a nice white outlaying for forms...
 fill(#FFCC66);
 rect(0,0,50,50);
 
 fill(#22222d);
 ellipse(0,0,100,100);
 
 fill(#FFFFFF);
 ellipse(0,0,86,86);
 
 fill(#22222d);
 ellipse(0,0,80,80);
 
 fill(#FFFFFF);
 ellipse(0,0,75,75);
 
 fill(#000000);
 ellipse(0,0,15,15);
 
 //now the arc forms...
 //here I wanted to bring in some of the soothing light blue and white interplay, a departure from the bold white on navy...

 
 //lead rectangles...
 fill(#FFFFFF);
 rect(420,200,20,660);
 fill(#FFFFFF);
 rect(200,420,660,20);
 
 //ellipses in blue...
 ellipse(430,200,50,50);
 fill(#22222d);
 ellipse(430,200,55,55);
 fill(#99FFFF);
 ellipse(430,200,40,40);
 fill(#FFFFFF);
 ellipse(430,200,10,10);
 fill(#99FFFF);
 ellipse(200,430,50,50);
 fill(#22222d);
 ellipse(200,430,55,55);
 fill(#99FFFF);
 ellipse(200,430,40,40);
 fill(#FFFFFF);
 ellipse(200,430,10,10);
 

 fill(#000000);
 ellipse(555,555,40,40);
 fill(#E11112);
 ellipse(555,555,20,20);

 
 //and the lines...
 stroke(#FFFFFF);
 line(170,170,660,660);
 line(400,600,600,600);
 line(400,610,610,610);
 line(600,400,600,600);
 line(610,400,610,610);
 line(660,660,500,400);
 line(660,660,400,500);
 
 
 //and finally the triangles...
 //1
 fill(#FFFFFF);
 triangle(0,590,0,650,120,660);
 strokeWeight(0);
 fill(#22222d);
 triangle(0,595,0,655,110,660);
 fill(#FFFFFF);
 triangle(0,600,0,660,100,660);
 fill(#E11112);
 triangle(10,610,0,660,50,660);
 fill(#FFFFFF);
 triangle(10,625,50,660,40,655);

//2
fill(#FFFFFF);
 triangle(660,120,650,0,590,0);
 strokeWeight(0);
 fill(#22222d);
 triangle(660,110,655,0,595,0);
 fill(#FFFFFF);
 triangle(660,100,660,0,600,0);
 fill(#E11112);
 triangle(660,50,660,0,610,10);
 fill(#FFFFFF);
 triangle(655,40,660,50,625,10);
 
 //middle ellipse
 ellipse(400,400,40,40);
 fill(#E11112);
 ellipse(400,400,35,35);
 fill(#000000);
 ellipse(400,400,37,37);
 fill(#E11112);
 ellipse(400,400,20,20);
 fill(#22222d);
 ellipse(400,400,15,15);
 strokeWeight(1);
 point(400,400);
 
}


