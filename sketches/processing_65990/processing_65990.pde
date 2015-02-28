
int d = 100;
int p1 = d; //100
int p2 = p1+d; //200
int p3 = p2+d; //300
int p4 = 03+d; //400

size(500,500);
background(0); //blank

// Draw a gray box
stroke(204, 102, 0);
line(p3,p3,p2,p3); //300,300,200,300
line(p2,p3,p2,p2); //100,100,200,200
line(p2,p2,p3,p2);
line(p3,p2,p3,p3);

smooth();
strokeWeight(10);
strokeCap(ROUND);
line(width/2-100,30,width/2+100,30);
strokeCap(SQUARE);
line(width/2-50,60,width/2+50,60);
strokeCap(SQUARE);
line(width/2-100,90,width/2+100,90);

stroke(255);
strokeWeight(1);
point(p1,p1);
point(p1,p3);
point(p2,p4);
strokeWeight(10);
point(p3,p1);
point(p4,p2);
point(p4,p4);


