
int z = 0;
float thetaMercury, thetaVenus, thetaVenusMoon, thetaEarth, thetaEarthMoon, thetaMars, thetaMarsMoon1, thetaMarsMoon2, thetaJupiter, thetaSaturn, thetaUranus, thetaNeptune, thetaPluto =0;


void setup () {
size (2000,1300);
ellipseMode(CENTER);

}

void draw () {
noStroke();
smooth();
background(0);

planetDisplay(width/2, height/2, 50, 255, 255, 0);//sun
orbitDisplay(width/2, height/2, 80, 0.5);//mercury orbit
orbitDisplay(width/2, height/2, 160, 0.5);//venus orbit
orbitDisplay(width/2, height/2, 280, 0.5);//earth orbit
orbitDisplay(width/2, height/2, 400, 0.5);//mars orbit
orbitDisplay(width/2, height/2, 700, 0.5);//jupiter orbit
orbitDisplay(width/2, height/2, 950, 0.5);//saturn orbit
orbitDisplay(width/2, height/2, 1150, 0.5);//uranus orbit
orbitDisplay(width/2, height/2, 1300, 0.5);//neptune orbit
orbitDisplay(width/2, height/2, 1400, 0.5);//pluto orbit

pushMatrix();
translate(width/2,height/2);
rotate(thetaMercury);                 //rotate value
planetDisplay(10, -40, 10, 176,23,31);//mercury
popMatrix();

pushMatrix(); 
translate(width/2,height/2);
rotate(thetaVenus);
orbitDisplay(0,-80, 40, 0.5);
planetDisplay(0, -80, 20, 131, 139, 139);//venus

translate(0,-80);
rotate(thetaVenusMoon);
moonDisplay(7.5, -20, 5, 139, 136, 120);//venus moon
popMatrix();

pushMatrix();
translate(width/2,height/2);
rotate(thetaEarth);
orbitDisplay(0,-140, 60, 0.5);
planetDisplay (0, -140, 40, 0, 178, 238);//earth

translate(0,-140);
rotate(thetaEarthMoon);
moonDisplay(7.5, -30, 10, 139, 136, 120);//earth moon
popMatrix();

pushMatrix();
translate(width/2,height/2);
rotate(thetaMars);
orbitDisplay(0,-200, 40, 0.5);
orbitDisplay(0,-200, 60, 0.5);
planetDisplay (0, -200, 20, 139, 71, 93);//mars
translate(0,-200);
rotate(thetaMarsMoon1);//mars moon
moonDisplay(7.5, -20, 5, 139, 136, 120);

rotate(thetaMarsMoon2);
moonDisplay(7.5, -30, 5, 139, 136, 120);//mars moon

popMatrix();

pushMatrix();
translate(width/2,height/2);
rotate(thetaJupiter);
planetDisplay (0, -350, 100, 240, 230, 140);//jupiter

popMatrix();

pushMatrix();

translate(width/2,height/2);
rotate(thetaSaturn);
planetDisplay (0, -475, 60, 205, 183, 158);//saturn
translate(0,-475);
orbitDisplay(0,0, 80, 0.5);
orbitDisplay(0,0, 90, 2);
orbitDisplay(0,0, 100, 1);
orbitDisplay(0,0, 110, 3);

popMatrix();

pushMatrix();

translate(width/2,height/2);
rotate(thetaUranus);
planetDisplay (0, -575, 30, 100, 149, 237);//uranus

popMatrix();

pushMatrix();

translate(width/2,height/2);
rotate(thetaNeptune);
planetDisplay (0, -650, 20, 100, 149, 237);//neptune
translate(0,-650);
orbitDisplay(0,0, 30, 0.5);//neptune rings
orbitDisplay(0,0, 40, 0.5);


popMatrix();

pushMatrix();

translate(width/2,height/2);
rotate(thetaPluto);
planetDisplay (0, -700, 10, 110, 123, 139);//pluto


popMatrix();




//INCREMENTS FOR PLANETS AND MOONS
thetaMercury +=0.015;
thetaVenus +=0.008;
thetaVenusMoon +=0.08;
thetaEarth +=0.005;
thetaEarthMoon +=0.05;
thetaMars +=0.01;
thetaMarsMoon1 +=0.03;
thetaMarsMoon2 +=0.025;
thetaJupiter += 0.005;
thetaSaturn += 0.008;
thetaUranus += 0.002;
thetaNeptune +=0.004;
thetaPluto += 0.003;

println("What is the value of thetaMercury?" +thetaMercury);
}

void planetDisplay (float x, float y, float radius, float r, float g, float b){//planet display function
noStroke();
fill(r, g, b);
ellipse(x, y, radius, radius);
}

void moonDisplay (float x, float y, float radius, float r, float g, float b){//moon display
noStroke();
fill(r, g, b);
ellipse(x, y, radius, radius);
}

void orbitDisplay (float x, float y, float radius, float bold) {
noFill();
stroke(255);
strokeWeight(bold);
ellipse (x, y, radius, radius);
}

