
size(800,600);

background(188, 164, 255);

//ground
stroke(2, 13, 0);
fill(2, 13, 0);
arc(900, 900, 1800, 800, 0, TWO_PI);

//clouds
stroke(255, 20);
fill(255, 255, 255, 20);
arc(400, 80, 120, 80, 0, TWO_PI);
arc(480, 130, 120, 80, 0, TWO_PI);
arc(740, 30, 240, 150, 0, TWO_PI);
arc(700, 380, 45, 20, 0, TWO_PI);
arc(420, 480, 40, 30, 0, TWO_PI);
arc(-20, 20, 120, 80, 0, TWO_PI);

//windmill shadow
fill(50, 0, 0);
stroke(50, 0, 0);
triangle(125, 300, 260, 600, 0, 600);

//windmill tower
stroke(102, 0, 0);
fill(102, 0, 0);
quad(10, 300, 125, 300, 240, 600, -40, 600);
arc(70, 310, 120, 200, PI, TWO_PI, OPEN);


//windmill blades
stroke(255);
fill(255);
quad(100, 265, 700, 45, 600, 480, 90, 285 );
quad( 45, 245, 65, 240, 240, 0, 40, 0);
quad( 36, 300, 60, 300, 200, 600, -20, 600);
quad(23, 260, 20, 280, 0, 290, 0, 245);


