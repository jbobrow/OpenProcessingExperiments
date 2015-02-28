
//Joseph Kotay. Practice Computational Methods. Professor Nick Senske. Assigment. Homwework 1.1
//Jet Fighter

size(300,300);
PImage sky;   //As an alternate for the background command, I loaded an image that I found online with the PImage command.
sky= loadImage("nightsky.jpg");
image (sky,0,0);
smooth();
colorMode(RGB);

 
// The code for the nose of my jet aircraft draws a triangle:
noStroke(); 
fill(247,31,20);  //This gives the tip of the body a red color value.
beginShape();  //The code for the nose of my jet uses the beginShape command beacuse this is the best way
               //draw an upside down triangle.
vertex(142,235);
vertex(150,290);
vertex(158,235);
endShape(CLOSE);

//These lines of code are for the dotted pattern on the nose of the jet:

stroke(255);
strokeWeight(5);
point(150,255);
point(150,270);

//This next section draws the left and right wings as a connected form that will be
//overlapped by the body of the plane.  By doing this, I am able to create wings
//using fewer lines of code.  Since the body is coded after this, it will be placed
//over the wings, making them appear as if they were coded separately.

stroke(255);
strokeWeight(0);
fill(150);
beginShape();
vertex(105,185);
vertex(150,210);
vertex(195,185);
endShape(CLOSE);

rectMode(CORNER);
rect(105,120,90,65);

quad(125,45,105,120,195,120,175,45);

//The following lines of code are for the front right wing fender:

quad(195,120,195,180,255,145,255,120);

//This arc code creates the red pattern on the edge of the right wing:

fill(247,31,20);
stroke(255);
strokeWeight(3);
arc(255,120,40,40,PI/2,PI);

//These lines are for the front right wing fender flap:

noFill();
strokeWeight(0);
beginShape();
vertex(205,120);
vertex(205,130);
vertex(245,130);
vertex(245,120);
endShape();

//These lines draw the rear right fender and fender flap:

fill(100);
quad(175,45,175,80,210,70,210,45);
line(185,45,185,55);
line(185,55,210,55);

//The following lines of code are for the front left wing fender:

stroke(255);
fill(150);

quad(45,120,45,145,105,180,105,120);

//This arc code creates the red pattern on the edge of the left wing:

fill(247,31,20);
stroke(255);
strokeWeight(3);
arc(45,120,40,40,0,PI/2);

//These lines are for the front left wing fender flap:

noFill();
strokeWeight(0);
beginShape();
vertex(55,120);
vertex(55,130);
vertex(95,130);
vertex(95,120);
endShape();

//These lines draw the rear left fender and fender flap:

fill(100);
quad(90,45,90,70,125,80,125,45);
line(100,45,100,55);
line(100,55,125,55);

//The code for the cockpit and body of my jet:
noStroke();
fill(130);   //  This value gives the shape a medium gray fill.

quad(137,190,142,235,158,235,163,190);
quad(140,40,137,190,163,190,160,40);

fill(100);
quad(145,10,140,40,160,40,155,10);

// The cockpit cover is represented by an ellipse:
stroke(255);
fill(155,224,230);
ellipse(150,220,10,45);




