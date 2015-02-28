
// placement

color [] shf = {#000000, #fd3434, #ffbf00, #fff800, #da3000, #f07f00};


size(600, 600);
background(shf[0]);
smooth();
strokeWeight(0);


{rectMode(CORNERS);
fill(shf[int(random(1,5))], 150);
rect(20, 20, 580, 580); //two coordinates of two corners
fill(shf[2]);

fill(shf[int(random(1,5))], 150);
rectMode(CORNERS);
rect(80, 80, 520, 520); //two coordinates of two corners

fill(shf[int(random(1,5))]);
rectMode(CENTER);
rect(300, 300, 200, 200);

fill(shf[int(random(1,5))]);   //coordinates of center, heighth, width
ellipseMode(CENTER);



}
