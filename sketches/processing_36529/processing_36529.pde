
size(420,600);
background(250);

//yellow rect
pushMatrix();
fill(250,150,0);
translate(10,250);
rotate(radians(-5));
rect(0,0,320,24);
popMatrix();

//bottom yellow rect
pushMatrix();
fill(200,150,0);
translate(140,380);
rotate(radians(20));
rect(0,0,24,240);
popMatrix();

//bottom red rect
pushMatrix();
fill(250,0,0);
translate(164,350);
rotate(radians(20));
rect(0,0,34,200);
popMatrix();

//bottom grey rect
pushMatrix();
fill(200);
translate(220,370);
rotate(radians(20));
rect(0,0,54,160);
popMatrix();

//red rect right
pushMatrix();
fill(250,0,0);
translate(380,480);
rotate(radians(60));
rect(0,0,24,140);
popMatrix();

//yello rect right
pushMatrix();
fill(250,150,0);
translate(400,500);
rotate(radians(60));
rect(0,0,14,120);
popMatrix();

//blue rect
pushMatrix();
fill(0,0,250);
translate(180,80);
rotate(radians(-10));
rect(0,0,10,450);
popMatrix();

//blue rect
pushMatrix();
fill(0,0,250);
translate(160,100);
rotate(radians(-10));
rect(0,0,60,10);
popMatrix();

//red circle
fill(250,0,0);
ellipse(80,90,140,140);

//black square
pushMatrix();
fill(0,0,0);
rectMode(CORNER);
translate(220,90);
rotate(radians(20));
rect(0,0,140,140);
popMatrix();






