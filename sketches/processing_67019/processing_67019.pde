

size(200,200);
smooth();
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
background(0);
println("OllyOmbray!");

//Feet
rect(65,100,40,25);
rect(135,100,40,25);


//FatBody

ellipse(100,70,70,55);
fill(0);
ellipse(100,120,7,7);

//head and hat

fill(150);
ellipse(100,40,35,35);
stroke(255);
strokeWeight(2.5);
line(45,40,155,40);
fill(255,255,255,75);
//ellipse(100,40,35,35);  /* intention is for the second WHITE ellipse to be see through-to the grey underneath
//would ellipse(255,75); work, however? (white value, then straight to transparency?)*/
noStroke();
fill(0);

//mouth
rect(100,50,8,4);

println("It should draw the feet first, then body, then the head . . .");


//"OllyOmbray"


