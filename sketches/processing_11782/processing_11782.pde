
/* Max Benassi Sept 1, 2010 
  Georgio Meorandi Painting recreation */
  //http://www.minusspace.com/logimages2008/metropolitan-morandi.jpg
size(500, 500);
background(16, 174, 188);
smooth();

//split background
fill( 37, 98, 175);
rect (0, 290, 500, 200);

// first and last rectangles pink
fill(237, 48, 92);
noStroke();
rect(70, 300, 125, 155);
rect(310, 320, 100, 150);

//filler in between last rectangles
fill(40, 12, 152);
rect(300, 320, 10, 150);

//second yellow rectangle
fill(237, 240, 87);
noStroke();
rect(200, 320, 100, 150);

//quads
fill(175);
quad(230, 240, 270, 240, 300, 320, 200, 320);

fill ( 40, 12, 152);
quad (329, 250, 356, 250, 385, 320, 300, 320);

//bottle neck 1
fill(255);
rect( 230, 170, 40, 70);

//bottle neck 2
fill( 68, 152, 12);
rect (329, 155, 27, 95);

//bottle top 1
fill (255);
ellipse (250, 167, 42, 15);

//bottle top 2
fill( 88, 209, 8);
ellipse ( 343, 150, 67, 10);

//1st bottle back rectangle
fill (95, 95, 8);
quad (270, 180, 275, 180, 300, 320, 270, 240);
quad (225, 180, 230, 180, 230, 240, 200, 320);

//shading on first box
fill (100);
rect ( 70, 290, 125, 10);

