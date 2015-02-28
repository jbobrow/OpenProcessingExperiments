

println("personatges");

size(700,500);
background(255);

noStroke();
fill(114,196,40);
rect(0.15*width,0.3*height,0.2*width,0.4*height);// cos del primer ninot
rect(0.65*width,0.3*height,0.2*width,0.4*height);// cos del segon ninot
ellipse(0.25*width,0.3*height,0.2*width,0.28*height);// cap del primer ninot
ellipse(0.75*width,0.3*height,0.2*width,0.28*height);//cap de segon ninot

noStroke();
fill(0);
rect(0.2*width,0.7*height,0.015*width,0.03*height);// pota 1 del primer ninot
rect(0.285*width,0.7*height,0.015*width,0.03*height);// pota 2 primer ninot
ellipse(0.17*width,0.22*height,0.045*width,0.063*height);// ull 1 primer
ellipse(0.29*width,0.19*height,0.09*width,0.126*height);// ull 2 primer

rect(0.7*width,0.7*height,0.015*width,0.03*height);//pota 1 segon
rect(0.785*width,0.7*height,0.015*width,0.03*height);//pota 2 segon
ellipse(0.79*width,0.34*height,0.045*width,0.063*height);// ull 2 segon

stroke(0);
strokeWeight(10);
line(0.198*width,0.38*height,0.3*width,0.38*height);//boca primer
line(0.69*width,0.32*height,0.725*width,0.367*height);// ull 1 segon ninot
line(0.69*width,0.367*height,0.725*width,0.32*height); //ull 1 segon ninot
line(0.67*width,0.63*height,0.83*width,0.63*height);//boca segon ninot




