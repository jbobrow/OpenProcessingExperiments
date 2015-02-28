
// Creative Coding 1
  // Assignment 1: Create a Static Sketch of a Character or Craft.

// Before starting to write, I sketched out what my character should look like using shapes I knew I could re-create in Processing. I decided to design a gentleman character as I could harness all the shapes we have been taught including more advanced ones (i.e. triangle(); quad(); arc(); etc.) Once I had a good impression of what my character will be I decided to set it up against a designed background as opposed to just a colour. However the background will be transparate slightly as I want the focus to be on the character, not the background.
size(240,480); // Created a project of 240px by 480px to give me good room to design my character while not over-complicating co-ordinates as I can work with many multiples (6,8,10 etc.)
background(175); 

// Neck
noStroke();
fill (250,225,200);
rectMode(CENTER);
rect(120,170,12,24);

// Oval Head
smooth();
fill(250,225,200);
ellipseMode(CENTER);
ellipse(120,120,60,90);

// Facial Features - His Right Eye
stroke(0);
strokeWeight(1);
smooth();
fill(255);
ellipse(105,115,10,7.5); // His Right Eye
fill(0,0,255,100);
ellipse(105,115,5,5); // His Right Iris
strokeWeight(2.5);
point(105,115); // His Right Pupil 

// Facial Features - His Left Eye
stroke(0);
strokeWeight(1);
smooth();
fill(255);
ellipse(135,115,10,7.5); // His Left Eye
fill(0,0,255,100);
ellipse(135,115,5,5); // His Left Iris
strokeWeight(2.5);
point(135,115); // His Left Pupil

// Facial Features - Nose & Mouth
strokeWeight(0);
line(110,132.5,120,115); // Upper-part of Nose
line(110,132.5,120,132.5); // Lower-part of Nose
noFill();
stroke(200,190,170);
strokeWeight(2);
arc(120,145,20,15,0,radians(180)); // Mouth

// Top Hat
stroke(0);
strokeWeight(5);
line(62,110,170,80); // Flat Hat Edge
fill(0);
quad(93,100,93,40,142,27,142,87); // Main Hat Shape
fill(255);
noStroke();
quad(93,100,93,90,142,77,142,87); // White Cloth layer over Hat

// Triangular Body
fill(0);
strokeWeight(3);
smooth();
triangle(120,340,60,180,180,180);

// Clothing Accessories - Bowtie, Flower & Buttons
noStroke();
fill(255);
triangle(120,180,100,170,100,190); // His left side of Bowtie
triangle(120,180,140,170,140,190); // His right side of Bowtie
stroke(255,100,0,50);
fill(255,0,0,100);
ellipse(140,210,20,5); // Lower-Red Flower party for his left chest pocket
ellipse(140,210,10,10); // Middle-Red Flower for his left chest pocket
ellipse(140,210,5,20); // Upper-Red Flower for his left chest pocket
stroke(255);
fill(255);
ellipse(120,300,2,2);
ellipse(120,280,4,4);
ellipse(120,260,5,5);

// His Left Arm & Hand
fill(0);
stroke(0);
smooth();
quad(178.5,182.5,190,340,180,350,160,190); // His Left Shoulder & Arm
fill(250,225,200);
noStroke();
ellipse(185,340,40,40); // His Left Hand

// His Right Arm w/ Cane & Hand
strokeWeight(1);
fill(0);
smooth();
quad(59,180,80,190,65,280,50,270); // His Right Shoulder
quad(65,280,50,270,25,300,35,310); // His Right Arm
fill(100,50,10);
stroke(100,50,10);
strokeWeight(5);
line(25,300,25,460); // Brown Cane
fill(250,225,200);
noStroke();
ellipse(25,310,40,40); // His Right Hand

// His Left Leg, Foot & Shoe
stroke(0);
strokeWeight(2);
line(120,340,160,460); // His Left Leg
fill(0);
arc(175,460,35,15,radians(180),radians(360)); // His Left Shoe
strokeWeight(5);
line(160,460,190,460); // His Left Foot

// His Right Leg, Foot & Shoe
strokeWeight(2);
line(120,340,80,460); // His Right Leg
fill(0);
arc(62.5,460,35,15,radians(180),radians(360)); // His Right Shoe
strokeWeight(5);
line(80,460,47.5,460); // His Right Foot

// Copyright Brandon McCann [Creative Technologies]
  // Completed 15/10/2012

