
size(500,500);
rectMode(CENTER);

pushMatrix();
translate(100,height/2);
rotate(radians(45));
scale(2.5);
line(0,0,100,0);
translate(100,0);
rect(0,0,100,100);
ellipse(0,0,50,50);
popMatrix();

rect(width/2, height/2, 100,100);
