
PImage sun;
PImage earth;
PImage mercury;
PImage venus;
PImage neptune;
PImage saturn;
PImage uranus;
PImage jupiter;
PImage pluto;
PImage mars;




void setup(){
size(1220, 920);
background(255, 255, 255);
  sun = loadImage("Sun.png");
  earth = loadImage("Earth.png");
  mercury = loadImage("mercury.png");
  venus = loadImage("venus.png");
  neptune = loadImage("Neptune.png");
  saturn = loadImage("saturn.png");
  uranus = loadImage("uranus.png");
  jupiter = loadImage("jupiter.png");
  pluto = loadImage("pluto.png");
  mars = loadImage("mars.png");
  smooth();


}

void draw(){
  background(0, 0, 0);
translate(width/2, height/2);
 strokeWeight(1/2);
    strokeCap(ROUND);
fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 1200, 850);

fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 1100, 750);


fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 1000, 650);

fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 900, 550);

fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 800, 450);

fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 700, 350);


fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 560, 250);

fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 420, 200);


fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(0, 0, 250, 150);




pushMatrix();
//sun

image(sun, -50, -50, 100, 100);

//mercury

image(mercury, (sin(frameCount / 2.000) *127 )-4, (cos(frameCount / 2.000) * 75)-4, 8, 8);

//venus

image(venus, (sin(frameCount / 20.000) *210 )-5, (cos(frameCount / 20.000) * 100)-5, 10, 10);

//earth

image(earth, (sin(frameCount / 15.000) *280 )-11, (cos(frameCount / 15.000) * 124)-11, 22, 22);

//mars

image(mars, (sin(frameCount / 20.000) *350 )-10, (cos(frameCount / 20.000) * 170)-10, 20, 20);

//jupiter
 
image(jupiter, (sin(frameCount / 45.000) *400 )-25, (cos(frameCount / 45.000) * 230)-25, 50, 50);

//saturn
 
image(saturn, (sin(frameCount / 80.000) *450 )-15, (cos(frameCount / 80.000) * 280)-15, 30, 30);

//uranus
 
image(uranus, ((sin(frameCount / 70.000) *500 )-(27/2)), ((cos(frameCount / 70.000) * 330)-(27/2)), 27, 27);

//neptune
 
 
image(neptune, ((sin(frameCount / 55.000) *550 )-(25/2)), ((cos(frameCount / 55.000) * 380)-(25/2)), 25, 25);
//pluto
 
image(pluto, ((sin(frameCount / 200.000) *600 )-(5/2)), ((cos(frameCount / 200.000) * 424)-(5/2)), 5, 5);

popMatrix();
}

