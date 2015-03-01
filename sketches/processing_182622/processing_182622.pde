
size(400,400);
background(0,100,240);

noStroke();

rectMode(CENTER);
translate(200,200);


pushMatrix();

fill( 252,23,69,200);
rect(0,50,80,400);
rotate(radians(45));
rect(0,0,80,200);
rotate(radians(90));
rect(0,0,80,200);
rotate(radians(135));
rect(0,0,80,300);
popMatrix();
