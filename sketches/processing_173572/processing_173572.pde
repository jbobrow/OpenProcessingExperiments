
//import processing.pdf.*;

size (700,500);
background ( 0);


//beginRecord(PDF,"DIBUJO FIJO 1.pdf");

for ( int x= 20; x<width ; x =x+7){ 
  

  fill(random(255),random(150),random(37));
 stroke(0);
 strokeWeight (5);
  rectMode(CENTER);
 rect( x+350,25,x+250,x-335);
  
fill( random(120),random(155),random(175), 2);
stroke (random(125),random(145),random(32));
strokeWeight(2); 
ellipse(width/52, height/52, x+32, x+125);

fill( random(120),random(155),random(175), 2);
stroke (random(15),random(125),random(150));
strokeWeight(5); 
ellipse(x-width/104, x-height/104, x-135, x-10);
  
fill(random(250), random(150), random(20),310);
strokeWeight(232); 
stroke( random(152), random(175), random (203));
point(  x+30,150);

noFill();
strokeWeight (2);
stroke ( random( 150),random (20),255);
rect ( 700,500,700,500);
 

 fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse ( x+350,350,x+250,x+750);


 fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse (x+ 250,x+550,550,x+350);

 fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse ( x+30,x+350,x+500,x+250);
 
  fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse ( x+50,150,x+10,x+30);
 
 fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse ( x+50,x+50,x+350,x+850);
 
   fill( random(55),random(200),random (150), 15);
noStroke();
strokeWeight (13);
 ellipse ( x+50,250,x+350,x+750);



}

//endRecord();

