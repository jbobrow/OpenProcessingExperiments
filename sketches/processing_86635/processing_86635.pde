
float R = 255;
float G = 255;
float B = 0;
float incremento = +1;
float mincol = 0, maxcol = 255;

void setup(){
//random colors credit to rebirth on processing forums
size (800,800);






}
void draw(){
println("mouse x:");
println(mouseX);
println("mouse y:");
println(mouseY);



 background(R,G,B);
 R += incremento;
 if (R > maxcol)
 incremento = -.5;
 else if (R < mincol)
 incremento = random(2);
   B += incremento;
 if (B > maxcol)
 incremento = -1;
 else if (B < mincol)
 incremento = +5;
   G += incremento;
 if (G > maxcol)
 incremento = -1;
 else if (G < mincol)
 incremento = +10;
 frameRate(150);

 
//head
fill(255,179,144);
ellipse(400,400,300,300);
//left eye
fill(255,255,255);

ellipse(340,360,60,25);
noFill();
rect(310,345,60,30);
fill(175,7,237);
ellipse(340,360,15,15);


//right eye
fill(255,255,255);
ellipse(450,360,60,25);
noFill();
rect(420,345,60,30);
fill(175,7,237);
ellipse(450,360,15,15);

//hair
fill(131,49,36);
arc(400,340,270,190,-PI,0);

//nose
line(393,408,408,427);
line(393,435,408,427);

//beard
fill( random(255), random(255), random(255), random(255));
triangle(256,444,280,448,269,475);
fill( random(255), random(255), random(255), random(255));
triangle(270,475,294,473,289,501);
fill( random(255), random(255), random(255), random(255));
triangle(290,502,312,492,309,520);
fill( random(255), random(255), random(255), random(255));
triangle(310,521,330,509,328,530);
fill( random(255), random(255), random(255), random(255));
triangle(328,532,348,519,352,544);
fill( random(255), random(255), random(255), random(255));
triangle(353,543,370,524,376,549);
fill( random(255), random(255), random(255), random(255));
triangle(377,549,391,530,402,549);
fill( random(255), random(255), random(255), random(255));
triangle(403,549,415,529,428,548);
fill( random(255), random(255), random(255), random(255));
triangle(427,547,439,524,455,539);
fill( random(255), random(255), random(255), random(255));
triangle(455,539,463,518,479,528);
fill( random(255), random(255), random(255), random(255));
triangle(479,528,487,504,500,511);
fill( random(255), random(255), random(255), random(255));
triangle(500,511,500,486,516,494);
fill( random(255), random(255), random(255), random(255));
triangle(516,494,512,471,530,473);

triangle(530,473,524,449,542,448);

//glasses
line(370,359,421,359);

//mouth 

arc(400,487,70,30,0,PI);
}


