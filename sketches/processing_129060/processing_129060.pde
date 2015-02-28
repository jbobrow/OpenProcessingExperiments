
size(500,500);
background(131,139,139);
noFill();
strokeWeight(10);
stroke(240,255,255);
rotate(PI/9);
translate(229,10);
scale(.25);

//top triangles top section
{
triangle(150,50,250,50,200,100);
triangle(250,50,350,50,300,100);
triangle(350,50,450,50,400,100);
triangle(450,50,550,50,500,100);
}

//bottom triangles top section
{
triangle(100,100,50,150,150,150); 
triangle(200,100,150,150,250,150);
triangle(300,100,250,150,350,150);
triangle(400,100,350,150,450,150);
triangle(500,100,450,150,550,150);
triangle(600,100,550,150,650,150);
}

//middle squares top section
{

line(150,50,100,100);
line(550,50,600,100);
}

//bottom triangles
{

line(50,150,300,400);
line(650,150,400,400);
line(300,400,150,150);
line(320,400,150,150);
line(400,400,550,150);
line(250,150,320,400);
line(250,150,340,400);
line(350,150,340,400);
line(350,150,360,400);
line(450,150,360,400);
line(450,150,380,400);
line(550,150,380,400);

}
//last triangle
{
line(350,450,400,400);
line(350,450,300,400);
}

//ring section
{
stroke(238,173,14);
strokeWeight(35);
ellipseMode(CORNER);
translate(-400,60);
ellipse(400,400,800,800);

}
