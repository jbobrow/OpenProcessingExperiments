
size(800,600);
background(0,0,0);
fill(255,173,241);

//ma esquerra
pushMatrix();
rotate(-0.3);
ellipse(210,300,90,150);
popMatrix();


//ma dreta
pushMatrix();
rotate(0.2);
ellipse(800-230,210,150,90);
popMatrix();

//peu esquerra
fill(206,0,3);
pushMatrix();
rotate(-0.6);
ellipse(20,520,130,80);
popMatrix();

//cos
fill(255,173,241);
strokeWeight(3);
stroke(255,0,200,30);
ellipse(400,300,280,280);

//boca
noStroke();
fill(219,0,33);
ellipse(400,315,30,30);

//peu dret
fill(206,0,3);
pushMatrix();
rotate(-0.8);
ellipse(800-760,650,130,80);
popMatrix();

//ull negre
fill(0,0,0);
ellipse(370,250,30,80);
ellipse(800-370,250,30,80);
//ullblau
fill(0,107,252);
ellipse(370,250,25,75);
ellipse(800-370,250,25,75);
//ull negre petit
fill(0,0,0);
ellipse(370,240,27,60);
ellipse(800-370,240,27,60);
//ull blau petit
//ull blanc
fill(255);
stroke(0,104,252);
strokeWeight(2);
ellipse(370,230,20,30);
ellipse(800-370,230,20,30);

//galtes
fill(277,2,160,80);
noStroke();
rotate(0.1);
ellipse(345,260,40,25);
pushMatrix();
rotate(-0.2);
ellipse(800-345,340,40,25);
popMatrix();


