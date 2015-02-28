
size(800, 800);
background(255);

int rect1 = round( random(200,300) );
int rect2 = round( random(150,199) );
int rect3 = round( random(100,149) );
int rect4 = round( random(50,99) );
int rect5 = round( random(1,49) );

int xPosition1 = round( random(0,800) );
int yPosition1 = round( random(0,800) );

int trans = round( random(0,255) );

int fillx = round( random(0,100) );
int filly = round( random(101,200) );
int fillz = round( random(201,255) );

  fill(fillx, filly, fillz, trans);
  rect(xPosition1, yPosition1, rect1, rect1);

  fill(filly, fillz, fillx, trans);
  rect(xPosition1-rect2, yPosition1-rect2, rect2, rect2);

  fill(fillz, fillx, filly, trans);
  rect(xPosition1+rect1, yPosition1-rect3, rect3, rect3);

  fill(filly, filly, fillx, trans);
  rect(xPosition1-rect4, yPosition1+rect1, rect4, rect4);

  fill(fillz, filly, fillz, trans);
  rect(xPosition1+rect1, yPosition1+rect1, rect5, rect5);
  



