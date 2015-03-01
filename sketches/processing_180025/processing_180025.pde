
/*
This program is meant to illustrate my self portrait.
*/

size(100,100); //create window size
background(255,225,160); //change background color

noFill(); //eyebrow stroke
stroke(142,116,63); //eyebrow color
strokeWeight(6); //eyebrow thickness
arc(76,50,124,50,PI,TWO_PI); //eyebrow curve

noStroke(); //glasses top
fill(81,59,14); //brown glasses frame
rect(0,30,100,30); //top glasses bar size

fill(255,225,160); //face color to add bottom curve to top bar of eye glasses
ellipse(70,68,250,50); //curve shape...need to look up how to make one shape with one side curved

noFill(); //glasses side
stroke(81,59,14); // glasses color
strokeWeight(13); // side thickness
ellipse(20,75,15,70); //glasses side curve

noStroke(); //glasses side curve
fill(255,225,160); //face color to add side curve to top bar of eye glasses
ellipse(20,70,15,50); //side curve shape
rect(19,44,100,100); //hide part of side thickness ellipse

noStroke();//start of eye structure
fill(255,255,255); //white of eye
ellipse(70,70,65,30); //ellipse of white of eye
fill(0,255,255); //blue eye color
ellipse(70,70,20,20); //blue ellipse
fill(0,0,0); //black
ellipse(70,70,10,10); //pupil

stroke(0,0,0); //eyeliner or eyelash ridge
strokeWeight(2); //thickness
noFill(); //outline
arc(70,70,65,30,PI,TWO_PI); //top of eye arc
strokeWeight(1); //eyelash thickness
arc(32,70,9,2,0,PI); //bottom eyelash
arc(33,68,11,2,0,PI); //top eyelash





