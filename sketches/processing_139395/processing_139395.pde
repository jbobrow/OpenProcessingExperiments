
//Pedro Veneziano, March 12th, Creative Computing B, Benjamin Bacon

size(700,700);
smooth();
background(150,214,255);

int position1 = 200;
int width1 = 40;
int position2 = 200;
int width2 = 40;
int position3 = 500;
int width3 = 40;
int position4 = 500;
int width4 = 40;

stroke(40);
strokeWeight(5);
fill(40);
while(position2 <= 500) {
  ellipse(position2,500,width2,width2);
  position2 = position2 + 50;
  width2 = width2 - 4;
}

fill(255);
while(position1 <= 500) {
  ellipse(200,position1,width1,width1);
  position1 = position1 + 50;
  width1 = width1 - 4;
}

fill(40);
while(position3 >= 200) {
  ellipse(position3,200,width3,width3);
  position3 = position3 - 50;
  width3 = width3 - 4;
}

fill(255);
while(position4 >= 200) {
  ellipse(500,position4,width4,width4);
  position4 = position4 - 50;
  width4 = width4 - 4;
}

fill(40);
ellipse(500,500,16,16);


