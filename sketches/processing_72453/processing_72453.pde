
float circleX = 0;

float circleY = 0;
float circleA = 800;




void setup() {

  size (800, 800);
  background(0);
  smooth();
  frameRate(60);
}


void draw() {
 // background(0);
  noStroke();

  //fill(255,255,255,150);
  //ellipse(400, 250, circleX%1000, circleX%1000);

  //rect
  stroke(#ffe57b);
  strokeWeight(.25);
  line(400, 400, circleY, 0);
  
    line(400, 400, circleA, 0);

line(400, 400, 0, circleY);

line(400, 400, 0, circleA);

line(400, 400, 800, circleA);

line(400, 400, 800, circleA);

line(400, 400, 800, circleY);



  stroke(255, 255, 255, 150);
  strokeWeight(.25);
  line(400, 400, random(800), random(800));


  //circle
  fill(#000000, 150);
  ellipse(400, 400, circleX%800, circleX%800);
  fill(#c4dcff, 150);
  ellipse(400, 400, circleX%750, circleX%750);

  fill(#e8f1ff, 150);
  ellipse(400, 400, circleX%700, circleX%700);
  fill(#011f4d, 150);
  ellipse(400, 400, circleX%650, circleX%650);
  fill(#2276f5, 150);
  ellipse(400, 400, circleX%600, circleX%600);

  fill(#03193b, 250);
  ellipse(400, 400, circleX%550, circleX%550);

  fill(#4085ed, 150);
  ellipse(400, 400, circleX%500, circleX%500);

  fill(#98bdf3, 250);
  ellipse(400, 400, circleX%450, circleX%450);

  fill(#2276f5, 250);
  ellipse(400, 400, circleX%400, circleX%400);

  fill(#e8f1ff, 250);
  ellipse(400, 400, circleX%350, circleX%350);

  fill(#03254b);
  ellipse(400, 400, circleX%300, circleX%300);

  fill(#c4dcff, 150);
  ellipse(400, 400, circleX%250, circleX%250);

  fill(#e8f1ff, 150);
  ellipse(400, 400, circleX%200, circleX%200);

  fill(#2276f5, 250);
  ellipse(400, 400, circleX%150, circleX%150);

  fill(#03254b);
  ellipse(400, 400, circleX%100, circleX%100);

  fill(#e8f1ff, 150);
  ellipse(400, 400, circleX%50, circleX%50);








  circleX = circleX + 3.5;
  circleY = circleY + 5;
  circleA = circleA - 5;
}


