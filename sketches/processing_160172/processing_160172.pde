
//"Lets face it" - My goal in this assignment was to show that I could use the basic geometric shapes to create a face that looked vaguely human.
//I chose a face as this meant I had to use a number of the shapes and colours and be able to adjust relative sizes and positions.

// "Lets face it"
//
// A face made from geometric shapes (does not use any of the more advanced coding functions not yet covered in the course.)
//
// by David Leslie Williams

// setup
size(800,600);
// set background to white
background(#FFFFFF);

// draw rectangles to set 2 quarters of the screen to grey top left and black bottom right quarters
stroke(0);
fill(0);
rect(width/2,height/2,width,height);
// Object count = 1
fill(#5D5D5D);
rect(0,0,width/2,height/2);
// Object count = 2

// two ears ellipses part covered
stroke(#FFFFFF);
strokeWeight(2);
fill(#FCD4C4);
ellipse(width/2+200,height/3+50,100,150);
// Object count = 3
fill(#C9A292);
ellipse(width/2-200,height/3+50,100,150);
// Object count = 4


// head as an ellipse in a "flesh" colour!
stroke(#FFFFFF);
strokeWeight(2);
fill(#FCD4C4);
ellipse(width/2,height/2,400,500);
// Object count = 5

//triangle for nose
stroke(#814D38);
strokeWeight(3);
triangle(width/2, height/3, width/2-50, 2*height/3, width/2+50, 2*height/3);
// Object count = 6

//two ellipses for nostrils
stroke(0);
strokeWeight(1);
fill(0);
ellipse(width/2-25,2*height/3-10,15,20);
// Object count = 7
noStroke();
fill(#585250);
ellipse(width/2+25,2*height/3-10,15.5,20.5);
// Object count = 8

//two ellipses for eyes
stroke(#814D38);
strokeWeight(1);
fill(#FCF7F5);
ellipse(width/2-110,height/3+50,100,50);
// Object count = 9
stroke(#814D38);
strokeWeight(1);
fill(#DEC9C9);
ellipse(width/2+110,height/3+50,100,50);
// Object count = 10

//two ellipses (circles) for irises  and two more for the pupils
stroke(#814D38);
strokeWeight(1);
fill(#5BADC9);
ellipse(width/2-110,height/3+50,40,40);
// Object count = 11
fill(#597E62);
ellipse(width/2+110,height/3+50,40,40);
// Object count = 12
fill(0);
ellipse(width/2-110,height/3+50,20,20);
// Object count = 13 
fill(#6C6927);
ellipse(width/2+110,height/3+50,20,20);
// Object count = 14 

//arcs for eyebrows
stroke(#A29D9D);
strokeWeight(16);
noFill();
arc(width/2-100,height/3,150,80, 1.2*PI, 1.8*PI);
// Object count = 15 
stroke(0);
strokeWeight(20);
noFill();
arc(width/2+100,height/3,150,80, 1.2*PI, 1.8*PI);
// Object count = 16 

// rectangles as teeth
stroke(0);
strokeWeight(1);
fill(#FFFFFF);
//bottom row of teeth
rect(width/2-55,12.5*height/16,10,20);
rect(width/2-45,12.5*height/16,10,20);
rect(width/2-35,12.5*height/16,15,20);
rect(width/2-20,12.5*height/16,20,20);
rect(width/2,12.5*height/16,20,20);
rect(width/2+20,12.5*height/16,15,20);
rect(width/2+35,12.5*height/16,10,20);
rect(width/2+45,12.5*height/16,10,20);
//top row of teeth
rect(width/2-55,12.5*height/16-20,10,20);
rect(width/2-45,12.5*height/16-20,10,20);
rect(width/2-35,12.5*height/16-20,15,20);
rect(width/2-20,12.5*height/16-20,20,20);
rect(width/2,12.5*height/16-20,20,20);
rect(width/2+20,12.5*height/16-20,15,20);
rect(width/2+35,12.5*height/16-20,10,20);
rect(width/2+45,12.5*height/16-20,10,20);
// Object count = 19 (only 3 different size of teeth used - no variation in shape or colour)

// two different arcs for the top and bottom lips
stroke(#FF0000);
strokeWeight(20);
noFill();
arc(width/2,12.5*height/16+13,150,80, 1.1*PI, 1.9*PI);
// Object count = 20 
strokeWeight(25);
arc(width/2,12.5*height/16-10,150,80, 2.1*PI, 2.9*PI);
// Object count = 21 

// triangle to give a 'v' in the top lip
noStroke();
fill(#FCD4C4);
triangle(width/2, 11.7*height/16, width/2-20, 2*height/3+10, width/2+20, 2*height/3+10);
// Object count = 22 

// lines for frowning
stroke(#482C1D);
strokeWeight(1);
line(width/2-50,height/8,width/2+50,height/8);
strokeWeight(2);
line(width/2-70,height/8+20,width/2+70,height/8+20);
strokeWeight(3);
line(width/2-90,height/8+40,width/2+90,height/8+40);
// Object count = 25 

// triangle and circle to form a tear!
noStroke();
fill(#4A7AA2);
ellipse(width/2+70,height/2-10,20,25);
// Object count = 26 
triangle(width/2+70, height/2-35, width/2+60, height/2-10, width/2+80, height/2-10);
// Object count = 27 

// lines for hair!
stroke(#482C1D);
strokeWeight(1);
line(width/2,height/16+10,width/2-35,height/64);
line(width/2,height/16+10,width/2-30,height/64);
line(width/2,height/16+10,width/2-25,height/64);
line(width/2,height/16+10,width/2-20,height/64);
line(width/2,height/16+10,width/2-15,height/64);
line(width/2,height/16+10,width/2-10,height/64);
line(width/2,height/16+10,width/2-05,height/64);
line(width/2,height/16+10,width/2+05,height/64);
line(width/2,height/16+10,width/2+10,height/64);
line(width/2,height/16+10,width/2+15,height/64);
line(width/2,height/16+10,width/2+20,height/64);
line(width/2,height/16+10,width/2+25,height/64);
line(width/2,height/16+10,width/2+30,height/64);
line(width/2,height/16+10,width/2+35,height/64);

// THE END



