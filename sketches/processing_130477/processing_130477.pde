
/*
JasonM
Paper Airplane Thing
1/27/2014

*/

//Using two variables for the tip of the paper airplane, I can draw a complex shape (four triangles) and easily move the airplane across the screen. tipx and tipy change each time the program draws to the screen.
int tipX = 100;
int tipY = 90;

void setup () {
background(235, 235, 235);
size (500,500);


}

void draw () {
    
   background(255);
   
beginShape(TRIANGLES);
fill(180);
vertex(tipX-85, tipY-7);
vertex(tipX, tipY);
vertex(tipX-85, tipY-25);
fill(255);
vertex(tipX-60, tipY-31);
vertex(tipX, tipY);
vertex(tipX-85, tipY-25);
fill(180);
vertex(tipX-95, tipY-22);
vertex(tipX, tipY);
vertex(tipX-89, tipY+7);
fill(255);
vertex(tipX-95, tipY-22);
vertex(tipX, tipY);
vertex(tipX-120, tipY-10);
endShape();

tipX = tipX + 1;
tipY = tipY + 1;

if (tipX > 500) {
tipX = 100;
tipY = 90;
}

};





