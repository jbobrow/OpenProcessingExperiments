
rectMode(CORNER);
size(500,500);
background(255);
fill(0);
translate(250,50);
//Viereck1
rect(100,100,20,20);
//Viereck 2
pushMatrix();
rotate(PI*0.1);
rect(130,130,60,60);
//Viereck 3
popMatrix();

pushMatrix();
rotate(PI*0.2);
rect(160,160,70,70);
popMatrix();

pushMatrix();
rotate(PI*0.3);
rect(190,190,80,80);
//Viereck 3
popMatrix();

pushMatrix();
rotate(PI*0.4);
rect(210,210,90,90);
//Viereck 3
popMatrix();

