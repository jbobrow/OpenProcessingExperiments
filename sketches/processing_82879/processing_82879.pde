
 size(400,600);
background(255);




//rectangle 1

fill(#51078E);// violet
stroke(#51078E);

strokeWeight(1);
rectMode(CENTER);
rect(90,90,140,140);
noStroke();
fill(#F282D2);
ellipse(90,90,110,110);

stroke(#51078E);// violet
strokeCap(SQUARE);
strokeWeight(5);
line(90,20,90,160);
strokeWeight(8);
line(20,90,100,90);

stroke(255);
strokeWeight(2);
line(20,90,100,90);
line(90,20,90,160);

noStroke();
fill(255);
triangle(90,40,120,90,60,90);
triangle(90,140,120,90,60,90);



//rect 2
noStroke();
fill(#F282D2);
ellipse(280,90,110,110);
noFill();
stroke(#51078E);
strokeWeight(1);
rectMode(CENTER);
rect(280,90,140,140);
noStroke();
fill(81,7,142,150);
triangle(280,90,210,20,210,160);
triangle(280,90,350,20,350,160);

//rectangle 3
noFill();
rectMode(CENTER);
rect(90,240,140,140);

fill(81,7,142,160);
triangle(90,170,20,310,160,310);
stroke(#F282D2);
strokeWeight(2);
line(90,180,90,310);
line(20,170,20,310);
fill(255); 
stroke(#F282D2); //rose
strokeWeight(2);
triangle(90,230,20,170,160,170);





//rect 4 

fill(#51078E);
stroke(#51078E);
rectMode(CENTER);
rect(280,240,140,140);

fill(#F282D2); //rose
stroke(255);
strokeWeight(6);
triangle(280,240,210,310,210,170);


fill(255);
stroke(255);
ellipse(280,240,110,110);
stroke(#F282D2); //rose
strokeWeight(2);
line(280,240,210,310);
line(280,240,210,170);



