
size(300, 400);
smooth();
background(255);

fill(0);
ellipse(120, 170, 20, 20);
ellipse(190, 170, 20, 20);


//Head
{
stroke(0);// stroke black
strokeWeight(2);
strokeJoin(BEVEL);
fill(200); // fill to gray
rect(130, 50, 50, 100);

//body
rect(120, 160, 70, 90);
rect(100, 260, 40, 20);
rect(170, 260, 40, 20);
}

// detail
fill(140, 237, 103);
ellipse( 140, 190, 30, 30);
fill(200, 237, 41);
ellipse(140, 190, 15, 15);



//eyes
stroke(0);// stroke black
strokeWeight(2);
fill(142, 237,103);
ellipse(130, 100, 25, 25);
ellipse(180, 110, 20, 20);
fill(0);
ellipse(130, 100, 5, 5);
ellipse(180, 110, 5, 5);

//antennae
strokeWeight(5);
line(140, 40, 155, 50);
line(140, 40, 160, 35);
line(160, 35, 160, 25);

//mouth
strokeWeight(1);
fill(255);
rect(155, 130, 5, 10);
rect(150, 130, 5, 10);

//neck
fill(0);
rect(150, 150, 10, 10);
rect(130, 250, 10, 10);
rect(170, 250, 10, 10);

//arms
strokeWeight(5);
line(100, 200, 110, 170);
line(200, 170, 210, 200);



