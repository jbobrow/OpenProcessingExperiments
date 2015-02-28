
size(1000,1000);
background(255, 255, 255);



stroke(255,255,255,0);
fill(247,218,0);
rect(.9375*width, .9375*height, .0625*width, .0625*height); //LITTLE YELLOW SQUARE

fill(75,161,208);
rect(0, .75*width, .25*width, .25*height); //SMALL BLUE SQUARE

fill(233,74,55);
rect(width/4, 0, .75*width, .75*height); // BIG RED SQUARE




stroke(0); // Gray on a scale of 0=black to 255=white
strokeWeight(height/32); // How many pixels thick do you want to make the line?
line( width/4, 0, width/4 ,height);

stroke(0); // Gray on a scale of 0=black to 255=white
strokeWeight(height/32); // How many pixels thick do you want to make the line?
line(  0, .75*height, width,.75*height);

stroke(0); // Gray on a scale of 0=black to 255=white
strokeWeight(height/32+height/64); // How many pixels thick do you want to make the line?
line(  0, .3125*height, width/4 -height/64,.3125*height);

stroke(0); // Gray on a scale of 0=black to 255=white
strokeWeight(height/32); // How many pixels thick do you want to make the line?
line(  .9375*width, .75*height, .9375*height,height);

stroke(0); // Gray on a scale of 0=black to 255=white
strokeWeight(height/32); // How many pixels thick do you want to make the line?
line(  .9375*width, .9375*height, width, .9375*height);
