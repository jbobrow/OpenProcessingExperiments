
//This palette is "Robots are COOL" by sampath_roots
//https://kuler.adobe.com/#themeID/2249879

color[] robots = {#1E3A40, #688C8C, #D9D1BA, #F2D194, #F2A057};
color [] palette = robots;

int s = 95;

size(600, 200);
smooth();
noStroke();
background(163);

fill(palette[0]);
rect(0, 0, s, s);

pushMatrix();
pushStyle();

translate(170, 45);
scale(1.5);
rotate(radians(45));
stroke(palette[2]);
strokeWeight(15);
fill(palette[3]);

rect(0, 0, s, s);

popMatrix();
rect(300, 45, s, s);

popStyle();
rect(width-s, height-s, s, s);
