
size(720, 720);
smooth();
strokeWeight(1);
background(204);

//neck
strokeWeight(3);
line(160, 200, 160, 270);

// Head
strokeWeight(1);
fill(255);
ellipse(160, 200, 100, 100);
//blue eye
fill(62, 194, 219);
ellipse(180, 200, 60, 60);
//black eye
fill(0);
ellipse(180, 200, 20, 20);
//orange eye
fill(242, 114, 15);
ellipse(180, 200, 10, 10);
//two white eye
fill(245, 168, 235);
ellipse(130, 210, 5, 5);
ellipse(130, 220, 5, 5);

//antennae
strokeWeight(3);
line(80, 200, 110, 200);
line(210, 200, 240, 200);

//body
fill(242, 114, 15);
strokeWeight(1);
rect(80, 270, 160, 180);
//bottom
fill(62, 194, 219);
arc(160, 450, 160, 160, 0, radians(180));
//white belt
fill(255);
rect(80, 400, 160, 20);








