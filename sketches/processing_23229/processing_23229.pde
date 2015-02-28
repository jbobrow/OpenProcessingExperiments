
//Creature

size(300, 300);
background(130, 200, 100);
smooth();


//variables
int centreX = width/2 + 50;
int centreY = height/2 - 17;
int headCentreX = centreX - 30;
int headCentreY = centreY - 30;


//bg
stroke(30, 120, 20, 100);
for (int i = 0; i < width; i += 2) {
  line(i, height, width, height-i);  
}

stroke(0, 150, 100, 180);
for (int i = width; i > 0; i--) {
  line(i, 0, i*4, height);
}



//legs
stroke(0);
line(centreX-5, centreY, centreX-5, centreY+144);
line(centreX+5, centreY, centreX+5, centreY+144);

//back wing
noStroke();
fill(26, 40, 183, 180);
quad(centreX+10 -40, centreY-10, 
     centreX+80 -40, centreY-20,
     centreX+75 -40, centreY-55,
     centreX+40 -40, centreY/2);

//tail
triangle(centreX+50, centreY+50,
         centreX+90, centreY+70,
         centreX+95, centreY+55);
triangle(centreX+40, centreY+40,
         centreX+60, centreY+70,
         centreX+75, centreY+40);
triangle(centreX+30, centreY+30,
         centreX+40, centreY+60,
         centreX+60, centreY+35);

//body
fill(30);
ellipse(centreX, centreY, 100, 100);

//head
fill(0, 200);
ellipse(headCentreX, headCentreY, 70, 70);

//eyes
stroke(90, 0, 0);
fill(180, 0, 0, 180);
ellipse(headCentreX-32, headCentreY, 10, 15); 
ellipse(headCentreX+32, headCentreY, 10, 15); 

//mouth
stroke(255);
noFill();
arc(headCentreX, headCentreY+50, 20, 50, PI/2, TWO_PI-PI/2);

//front wing
noStroke();
fill(26, 40, 183, 180);
quad(centreX+10, centreY-10, 
     centreX+80, centreY-20,
     centreX+75, centreY-55,
     centreX+40, centreY/2);

//feet
fill(0, 200);
triangle(centreX+5 -10, centreY+145, 
         centreX-15 -10, centreY+145, 
         centreX -10, centreY+135);
triangle(centreX+5, centreY+145, 
         centreX-15, centreY+145, 
         centreX, centreY+135);


