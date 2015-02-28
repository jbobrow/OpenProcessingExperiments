
//import processing.pdf.*;

size(1000,800);
//beginRecord(PDF, "aros_rojos.pdf");
background(0);

 for(int i=0; i<height; i+=10){

fill(203,21,21);
rect(0,i,width,2);
fill(203,21,210);
rect(500,i,width,2);
fill(203,210,21);
rect(800,i,width,2);
fill(20,210,21);
rect(900,i,width,2);
}

stroke(203,21,21);
strokeWeight(20);
fill(214,45,68,100);
ellipse(100,650,400,400);
stroke(203,21,21);
strokeWeight(20);
ellipse(100,650,200,200);

stroke(170,9,52);
strokeWeight(20);
fill(214,45,68,100);
ellipse(350,450,400,400);

stroke(170,9,52);
strokeWeight(20);
fill(214,45,68,100);
ellipse(350,450,100,100);

stroke(113,2,2);
strokeWeight(20);
ellipse(200,250,275,275);

stroke(113,2,2);
strokeWeight(20);
ellipse(200,250,175,175);

stroke(94,48,160);
strokeWeight(20);
ellipse(390,230,155,155);

stroke(94,48,160);
strokeWeight(20);
ellipse(390,230,70,70);

stroke(255,0,0);
strokeWeight(20);
ellipse(500,25,350,350);

stroke(255,0,0);
strokeWeight(50);
ellipse(500,25,150,150);

//endRecord();

//saveFrame();

