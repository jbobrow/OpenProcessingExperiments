
 size(400,600);
background(255);




//rectangle 1
noStroke();
fill(#F282D2);
ellipse(90,90,110,110);
//transparence R V B+ 0= transparent 225= opacacité
fill(81,7,142,170);
stroke(#51078E);

strokeWeight(1);
rectMode(CENTER);
rect(90,90,140,140);
noStroke();
fill(#F282D2);
triangle(90,40,120,90,60,90);
triangle(90,140,120,90,60,90);

//rect 2
noStroke();
strokeWeight(1);
fill(#F282D2);
ellipse(280,90,110,110);
noFill();
stroke(#51078E);
rectMode(CENTER);
rect(280,90,140,140);
fill(#51078E);// violet
triangle(280,90,210,20,210,160);

//rectangle 3
noFill();
rectMode(CENTER);
rect(90,240,140,140);
fill(#F282D2); //rose
noStroke();
triangle(90,230,20,170,160,170);
fill(81,7,142,160);
triangle(90,170,20,310,160,310);

//rect 4 

fill(#51078E);
stroke(#51078E);
rectMode(CENTER);
rect(280,240,140,140);
fill(255);
ellipse(280,240,110,110);
fill(#F282D2); //rose
stroke(255);
strokeWeight(3);
triangle(280,240,210,310,210,170);







