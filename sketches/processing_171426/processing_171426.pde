

size(600, 300);
background(220);
smooth();

noStroke();
fill(120);
rect(0, 0, 300, 300);


//right//


int w=50; /*big one*/
int ww=35; /*small one*/
//int rt=;
for (float i=0; i<= width/2; i+=w) {
  stroke(255);
  strokeWeight(2);
  line(i, (height-w)/2, i+w, (height+w)/2);
  line(i, (height+w)/2, i+w, (height-w)/2);
  stroke(255);
  strokeWeight(1);
  line(i, (height-ww)/2, i+ww, (height+ww)/2);
  line(i, (height+ww)/2, i+ww, (height-ww)/2);
  noStroke();
  fill(206, 135, 135);
  ellipse(i, (height+w)/2, 5, 5);
  ellipse(i, (height-w)/2, 5, 5);
  fill(132, 163, 170);
  ellipse(i+(w/2), height/2, 10, 10);
  fill(170, 162, 132);
  ellipse(i, (height+ww)/2, 5, 5);
  ellipse(i, (height-ww)/2, 5, 5);
  fill(255);
  ellipse(i+ww, (height+ww)/2, 5, 5);
  ellipse(i+ww, (height-ww)/2, 5, 5);
}

//left//
noStroke();
fill(240);
rect(300, 0, 600, 300);


//waves//
for (int i=300; i<width; i+=1) {
  stroke(211, 73, 165, 30);
  line(i, 150, i, 150 + sin(radians(0.44*i)) * (height/4));
  stroke(234, 62, 177, 40);
  line(i, 150, i, 150 + -0.3*sin(radians(0.44*i)) * (height/4));
  line(i, 150, i, 150 + 0.6 *sin(radians(0.44*i)) * (height/4));
  line(i, 150, i, 150 + 0.8 *sin(radians(0.44*i)) * (height/4));
  line(i, 150, i, 150 + -0.25*sin(radians(0.41*i)) * (height/4));
  line(i, 150, i, 150 + 0.9*sin(radians(0.42*i)) * (height/4));
  line(i, 150, i, 150 + -0.2*sin(radians(0.43*i)) * (height/4));
  stroke(94, 164, 252, 110);
  line(i, 150, i, 150 + 0.44*sin(radians(0.98*i)) * (height/4));
  line(i, 150, i, 150 -0.10*sin(radians(0.98*i)) * (height/4));
  stroke(170, 199, 234, 140);
  line(i, 150, i, 150 + -0.15*sin(radians(i)) * (height/4));
  stroke(91, 131, 183, 80);
  line(i, 150, i, 150 + 0.56*sin(radians(0.97*i)) * (height/4));
}


