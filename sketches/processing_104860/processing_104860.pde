
// Robot Magic by Niki Selken
//Bootcamp 2013

size(400, 400);
background(255,255,255);
colorMode(HSB,255); 

int x = 100;            // X-coordinate
int y = 420;           // Y-coordinate
int bodyHeight = 300;  // Body Height
int neckHeight = 80;
int head = 70;
int an = y - bodyHeight - neckHeight;  // Antena
 color c = color(random(0,255),255,255,75); //this defines the color and transparence for c
fill(c);
 color c2 = color(0,200,200); //this defines the color and transparence for c
fill(c);

color c3 = color(random(0,255),255,255,75); //this defines the color and transparence for c
fill(c);

//All variables should live above this line.



// Neck

beginShape();
strokeWeight(5);
stroke(1); 
vertex(x+40, y-335);
vertex(x+35, y-250);
endShape();

// Head
noStroke();
fill(c);
ellipse(x+50,y-370,head+25,head);

// Eyes
fill(c2);
rect(x+10,y-380,head/4,head/4);
rect(x+40,y-380,head/4,head/4);
fill(1);
ellipse(x+15,y-375,head/7,head/7);
ellipse(x+45,y-375,head/7,head/7);

// Antennae
beginShape();
strokeWeight(3);
stroke(1); 
vertex(x+20, y-395);
vertex(x+10, y-425);
endShape();

beginShape();
strokeWeight(3);
stroke(1); 
vertex(x+70, y-395);
vertex(x+90, y-425);
endShape();

// Body
noStroke();
fill(c3);
rect(x-50,y-250,bodyHeight/3,bodyHeight/2);
rect(x-50,y-210,bodyHeight/3,neckHeight/2);

fill(c3);
ellipse(x,y-150,head+30,head+25);

fill(c3);
fill(1);
ellipse(x-50,y-100,head/4,head/4);
ellipse(x+50,y-100,head/4,head/4);












