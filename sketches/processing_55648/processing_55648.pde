

size(450,550);
background(250);
smooth(); //smooths lines

int bodyWidth = 100;
int place = 150;

//changeable variables
int numberOfRings = 3;
int bodyHeight = 120;

//main body
fill(0); rect(170, place, bodyWidth, bodyHeight); 

//head
stroke(0); strokeWeight(4); noFill(); ellipse(190, (place - 35), 60, 60);
ellipse(180, place, 80, 80);

noStroke();
fill(40);ellipse(220, place, 80, 80);
fill(200); ellipse(220, place, 60, 60);
fill(0);ellipse(220, place, 15, 15);

//antenni
stroke(200); strokeWeight(2);
line(181, (place - 2), 100, (place - 40));  //bottom
line(181, (place - 2), 80, (place - 140));  //middle
line(179, (place - 2), 140, (place - 100)); //top

//small band on body
noStroke();
fill(150); rect(170, (place + (bodyHeight - 10)), bodyWidth, 5); 

//lower body
place = place + bodyHeight;
fill(150); noStroke(); arc(220, place, bodyWidth, 60, 0, PI);
place = place + 37;

//creates chain base
stroke(0); strokeWeight(3); fill(250);

for (int i = 0; i < numberOfRings; i++) {     //creates circles
    ellipse(220, place, 15, 15);
    place = place + 15;
}

// Create base
fill(0); arc(220, place, 110, 110, 0, PI); //fills arc grey - creates arc
fill(150); noStroke(); rect(155, (place - 6), 130, 10); //fills light grey - no boarder - creates rectangle
















