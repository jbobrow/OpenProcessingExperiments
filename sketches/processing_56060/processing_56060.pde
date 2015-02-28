
float zoogX;
float zoogY;

void setup() {
size(200,400);
zoogX = width/2;//zoog starts always in the middle
zoogY = height + 100;//zoog starts below the screen
smooth();
}

void draw() {
  background(255);/*draw a whie background*/
  //set mode CENTER
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //body
stroke(0);/*black stroke*/
fill(0);/*black fill*/
rect(zoogX,zoogY,90,150);
//rect(100,280,90,150);
  
  //head
stroke(0);
fill(0);
ellipse(zoogX,zoogY-130,180,150);
//ellipse(100,150,180,150);

  //face
stroke(255);
fill(250,220,220);
rect(zoogX,zoogY-130,80,50);
//rect(100,150,80,50);

  //lace
stroke(0);
fill(162,20,20);
ellipse(zoogX,zoogY-200,25,40);/*middle*/
//ellipse(100,80,25,40);/*middle*/
ellipse(zoogX-25,zoogY-200,40,40);/*left*/
//ellipse(75,80,40,40);/*left*/
ellipse(zoogX+25,zoogY-200,40,40);/*right*/
//ellipse(125,80,40,40);/*right*/

//nose
fill(234,50,50);
ellipse(zoogX,zoogY-130,3,3);
//ellipse(100,150,3,3);

//eyes
noStroke();
fill(0);
ellipse(zoogX-10,zoogY-140,10,5);/*left*/
//ellipse(90,140,10,5);/*left*/
ellipse(zoogX+10,zoogY-140,10,5);/*right*/
//ellipse(110,140,10,5);/*right*/

//cheek
stroke(255);
fill(240,152,152);/*color cheek*/
ellipse(zoogX-20,zoogY-120,17,13);/*left cheek*/
//ellipse(80,160,17,13);/*left cheek*/
ellipse(zoogX+20,zoogY-120,17,13);/*right cheek*/
//ellipse(120,160,17,13);/*right cheek*/

//mouth
stroke(206,35,67);
fill(255);
triangle(zoogX-10,zoogY-120,zoogX+10,zoogY-120,zoogX,zoogY-115);
//triangle(90,160,110,160,100,165);

//neck
noStroke();
fill(255);
triangle(zoogX,zoogY-60,zoogX-20,zoogY-100,zoogX,zoogY-80);
//triangle(100,220,80,180,100,200);

fill(150);
triangle(zoogX,zoogY-60,zoogX+20,zoogY-100,zoogX,zoogY-80);
//triangle(100,220,120,180,100,200);

//flower
stroke(255);
fill(247,247,22);
ellipse(zoogX-10,zoogY+20,20,20);
//ellipse(90,300,20,20);

//petals

fill(147,31,13);
ellipse(zoogX-20,zoogY+10,20,20);
//ellipse(80,290,20,20);
ellipse(zoogX,zoogY+10,20,20);
//ellipse(100,290,20,20);
ellipse(zoogX-20,zoogY+30,20,20);
//ellipse(80,310,20,20);
ellipse(zoogX,zoogY+30,20,20);
//ellipse(100,310,20,20);

//obi
stroke(255);
fill(62,193,20);
rect(zoogX,zoogY-25,90,10);
//rect(100,255,90,10);
ellipse(zoogX+40,zoogY-25,30,20);
//ellipse(140,255,30,20);

 //Zoog moves up extra feature
  zoogY = zoogY-1;
  
  //shakes to the right and the left
  zoogX = zoogX + random (-5,5);

}

