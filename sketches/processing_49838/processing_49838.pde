



size(600, 600);
background(255);
smooth();


/*
PImage b;
b = loadImage("monster.jpg");
image(b, 162, 100);
*/
  
//antenna
fill(#8cc63e);
noStroke();
  rect(300, 100, 2, 50);
  ellipse(301, 100, 10, 10);

//body

fill(#8cc63e);
  stroke(#8cc63e);
  strokeWeight(9);
  rect(214, 240, 171, 180);


//head
fill(#8cc63e);
noStroke();
ellipse(width/2, height/2 - 65, 180, 180);


//mouth
fill(#056839);
noStroke();
ellipse(width/2, height/2 - 50, 130, 150);

  //tongue
  fill(#f69f95);
  noStroke();
  ellipse(width/2, height/2 + 75, 170, 130);

  //teeth top
  fill(255);
  noStroke();
  triangle(width/2 + 35, height/2 - 8, width/2 + 48, height/2 - 3, width/2 + 45, height/2 - 15);
  triangle(width/2 + 25, height/2 + 0, width/2 + 35, height/2 + 8, width/2 + 35, height/2 - 10);
  triangle(width/2 + 10, height/2 + 2, width/2 + 20, height/2 + 14, width/2 + 22, height/2 + 0);
  triangle(width/2 - 8, height/2 + 2, width/2 + 1, height/2 + 16, width/2 + 12, height/2 - 5);
  triangle(width/2 - 10, height/2 + 2, width/2 - 20, height/2 + 14, width/2 - 22, height/2 + 0);
  triangle(width/2 - 25, height/2 + 0, width/2 - 35, height/2 + 8, width/2 - 35, height/2 - 10);
  triangle(width/2 - 35, height/2 - 8, width/2 - 48, height/2 - 3, width/2 - 45, height/2 - 15);
  
  //teeth bottom
  fill(255);
  noStroke();
  triangle(width/2 + 5, height/2 + 30, width/2 + 10, height/2 + 10, width/2 + 25, height/2 + 30);
  triangle(width/2 + 28, height/2 + 26, width/2 + 28, height/2 + 8, width/2 + 37, height/2 + 20);
  triangle(width/2 + 43, height/2 + 20, width/2 + 42, height/2 + 0, width/2 + 50, height/2 + 5);
  triangle(width/2 - 25, height/2 + 30, width/2 - 10, height/2 + 10, width/2 - 5, height/2 + 30);
  triangle(width/2 - 28, height/2 + 26, width/2 - 28, height/2 + 8, width/2 - 37, height/2 + 20);
  triangle(width/2 - 43, height/2 + 20, width/2 - 42, height/2 + 0, width/2 - 50, height/2 + 5);

//mouth fill
fill(#8cc63e);
noStroke();
ellipse(width/2, height/2 - 70, 150, 150);

//masks
  fill(255);
  noStroke();
  ellipse(width/2, height/2 + 114, 225, 180);


  noFill();
  stroke(#8cc63e);
  strokeWeight(9);
  arc(300, 253, 141, 150, 0, PI);

  noFill();
  stroke(#8cc63e);
  strokeWeight(20);
  arc(300, 267, 141, 150, 0, PI);
  
  noFill();
  stroke(#8cc63e);
  strokeWeight(30);
  arc(300, 290, 141, 150, 0, PI);



//chin
  fill(#5daf41);
  noStroke();
  strokeWeight(3);
  arc(300, 330, 50, 20, 0, PI);
  
  noFill();
  stroke(#8cc63e);
  strokeWeight(5.5);
  arc(300, 321, 49.5, 22.5, 0, PI);

fill(#8cc63e);
  stroke(#8cc63e);
  strokeWeight(9);
  rect(214, 345, 171, 80);
  
//bottom
  fill(255);
  noStroke();
  triangle(width/2 - 100, height/2 + 140, width/2 - 75, height/2 + 115, width/2 - 60, height/2 + 140);
  triangle(width/2 - 75, height/2 + 140, width/2 - 60, height/2 + 115, width/2 - 45, height/2 + 140);
  triangle(width/2 - 60, height/2 + 140, width/2 - 45, height/2 + 115, width/2 - 30, height/2 + 140);
  triangle(width/2 - 45, height/2 + 140, width/2 - 30, height/2 + 115, width/2 - 15, height/2 + 140);
  triangle(width/2 - 30, height/2 + 140, width/2 - 15, height/2 + 115, width/2, height/2 + 140);
  triangle(width/2 - 15, height/2 + 140, width/2, height/2 + 115, width/2 + 15, height/2 + 140);
  triangle(width/2, height/2 + 140, width/2 + 15, height/2 + 115, width/2 + 30, height/2 + 140);
  triangle(width/2 + 45, height/2 + 140, width/2 + 30, height/2 + 115, width/2 + 15, height/2 + 140);
  triangle(width/2 + 60, height/2 + 140, width/2 + 45, height/2 + 115, width/2 + 30, height/2 + 140);
  triangle(width/2 + 75, height/2 + 140, width/2 + 60, height/2 + 115, width/2 + 45, height/2 + 140);
  triangle(width/2 + 100, height/2 + 140, width/2 + 75, height/2 + 115, width/2 + 60, height/2 + 140);



//spots
fill(#38b648);
noStroke();
ellipse(width/2 - 45, height/2 - 120, 25, 25);

fill(#38b648);
noStroke();
ellipse(width/2 - 30, height/2 - 138, 7, 5);

fill(#38b648);
noStroke();
ellipse(width/2 - 45, height/2 - 100, 5, 5);




//eyeball

//outermost eye
fill(#f19e96);
noStroke();
ellipse(width/2, height/2 - 65, 80, 80);

//sclera
fill(255);
noStroke();
ellipse(width/2, height/2 - 65, 73, 73);

//cornea
fill(#2b8ef3);
stroke(#2782dd);
strokeWeight(2);
ellipse(width/2, height/2 - 65, 40, 40);

/*
//pupil
  fill(255);
  noStroke();
  triangle(width/2 - 4, height/2 - 70, width/2, height/2 - 85, width/2 + 4, height/2 - 70);
  triangle(width/2 - 4, height/2 - 55, width/2, height/2 - 45, width/2 + 4, height/2 - 55);
  triangle(width/2 + 4, height/2 - 70, width/2 + 10, height/2 - 75, width/2 + 4, height/2 - 70);
*/

//iris
fill(0);
noStroke();
ellipse(width/2, height/2 - 65, 20, 20);

/*
PImage b;
b = loadImage("eye.png");
image(b, 166.5, 124.5);
*/

//sparkle
fill(255);
noStroke();
ellipse(width/2 - 12, height/2 - 80, 16, 16);
fill(255);
noStroke();
ellipse(width/2 - 10, height/2 - 68, 5, 5);

/*
//arm
fill(#8cc63e);
noStroke();
  rect(140, 280, 80, 5);
  ellipse(141, 282, 10, 10);
*/

//sign
PImage b;
b = loadImage("sign.png");
image(b, 44, 95);

//hand holding sign
noFill();
stroke(#5daf41);
  strokeWeight(4);
  arc(210, 305, 50, 50, PI / 6, 2.6 * PI / 6);



/*
//guide
stroke(0);
strokeWeight(1);
line(0, height/2, width, height/2);
line(width/2, 0, width/2, height);
*/

