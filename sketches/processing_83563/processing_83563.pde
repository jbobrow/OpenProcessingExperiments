
void setup() {
size(200,150);

}

void draw() {
background (128 , 0 , 0);

ellipseMode(CENTER);

//hair
fill (0);
triangle (47,90, 40,135,90, 135); 
triangle (150,90, 110,135,160, 135);

//head
fill (255,218,185); 
ellipse (100,70,110 ,130);

//hair fringe
fill (0); 
line (100,5, 45,60);
line(100,5, 155,60);
bezier (110,5, 70,5,45,30, 45,60);
bezier (90,5, 134,5,150,30, 155,60);


//eyes
fill (255);
ellipse (75,60, 30, 20);
ellipse (125,60, 30, 20);

//nose
ellipse (95,90,1,1);
ellipse (105,90,1,1);
//pupils
fill (238, 0,0);
ellipse (75, 60,5,5);
ellipse (125,60,5,5);
//mouth
//fill (238, 0,0);
line (70, 110,130, 110);

//teeth
triangle (80,110,85,120,90,110);

triangle (110,110,115,120,120,110);

//blood 
ellipse (115,128, 3,6);
ellipse (85 ,128, 3,6);
ellipse (115,140, 3,6);
ellipse (85 ,140, 3,6);



}
