
// Jordan Harrison
// jharriso
// ©2013 Carnegie Mellon University, Pittsburgh PA

size(400, 400);
//background(92, 118, 95);
background(80);

// Variable
float x = 200;
float y = 200;

float wd = 200;
float ht = 200;

// Body //Left out to provide max maneuverability
//fill(129, 7, 23);
//stroke(0);
//ellipse(x, y+ht*1.2, wd+x*.3, ht+y);

// Head
noStroke();
fill(240, 174, 174);
ellipse(x, y, wd, ht); // Face Circle
stroke(80);
arc(x, y, wd, ht, radians(5), radians(175)); // Bottom Half
arc(x, y, wd, ht, radians(185), radians(355)); //Top Half

// Ears
arc(x-wd*.5, y, wd*.1, ht*.1, radians(70), radians(290), OPEN);
arc(x+wd*.5, y, wd*.1, ht*.1, radians(-110), radians(110), OPEN);

// Mouth Area
arc(x, y + ht*.35, wd*.45, ht*.45, radians(10), radians(170)); 
stroke(200);
fill(150);
arc(x, y + ht*.35, wd*.45, ht*.45, radians(180), radians(360)); // Mustache
noFill();
arc(x, y + ht*.35, wd*.40, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.35, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.30, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.25, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.20, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.15, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.10, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.05, ht*.45, radians(180), radians(360)); // Mustache
arc(x, y + ht*.35, wd*.001, ht*.45, radians(180), radians(360)); // Mustache
noStroke();
fill(0);
arc(x, y + ht*.35, wd*.45, ht*.2, radians(180), radians(360)); // Mouth
fill(255);
//arc(x, y + ht*.35, wd*.45, ht*.2, radians(225), radians(315), OPEN); // Teeth
fill(240, 174, 174);
arc(x, y + ht*.36, wd*.45, ht*.08, radians(180), radians(360)); // Bottom Curve of Mouth
noFill();
stroke(80);
arc(x, y + ht*.5, wd*.2, ht*.2, radians(220), radians(320)); // Chin Curve

// Nose
fill(240, 174, 174);
stroke(80);
arc(x, y+ht*.12, wd*.15, ht*.1, radians(-5), radians(185), OPEN);

// Hair
noStroke();
fill(150);
arc(x, y, wd, ht, radians(240), radians(300), OPEN);
fill(240, 174, 174);
rect(x-wd*.25, y-ht*.43, wd/2, ht/2); // Top Half of Head to fix Javascript issue
fill(150);
triangle(x-wd*.25, y-ht*.43, x-wd*.1, y-ht*.43, x-wd*.2, y-ht*.34); // Shape
triangle(x-wd*.1, y-ht*.43, x+wd*.1, y-ht*.43, x, y-ht*.34);
triangle(x+wd*.1, y-ht*.43, x+wd*.25, y-ht*.43, x+wd*.2, y-ht*.34);
stroke(200); // White Streaks
noFill();
arc(x, y, wd*.9, ht, radians(238), radians(302));
arc(x, y, wd*.8, ht, radians(236), radians(304));
arc(x, y, wd*.7, ht, radians(232), radians(308));
arc(x, y, wd*.6, ht, radians(228), radians(312));
arc(x, y, wd*.5, ht, radians(234), radians(306));
arc(x, y, wd*.4, ht, radians(240), radians(300));
arc(x, y, wd*.3, ht, radians(238), radians(302));
arc(x, y, wd*.2, ht, radians(236), radians(304));
arc(x, y, wd*.1, ht, radians(232), radians(308));
arc(x, y, wd*.001, ht, radians(228), radians(312));

// Glasses
stroke(0);
strokeWeight(2);
line(x-wd*.5, y-ht*.055, x+wd*.5, y-ht*.055);
beginShape();
curveVertex(x-wd*.3, y-ht*.2);
curveVertex(x-wd*.3, y-ht*.055);
curveVertex(x-wd*.26, y+ht*.1);
curveVertex(x-wd*.08, y+ht*.1);
curveVertex(x-wd*.03, y-ht*.01);
curveVertex(x+wd*.03, y-ht*.01);
curveVertex(x+wd*.08, y+ht*.1);
curveVertex(x+wd*.26, y+ht*.1);
curveVertex(x+wd*.3, y-ht*.055);
curveVertex(x+wd*.3, y-ht*.2);
endShape();
line(x-wd*.037, y-ht*.008, x-wd*.03, y-ht*.055);
line(x+wd*.037, y-ht*.008, x+wd*.03, y-ht*.055);

// Eyes
noStroke();
fill(255);
ellipse(x-wd*.16, y+ht*.01, wd*.1, ht*.05);
ellipse(x+wd*.16, y+ht*.01, wd*.1, ht*.05);
fill(30, 172, 227);
stroke(13, 84, 111);
ellipse(x-wd*.16, y+ht*.01, wd*.05, ht*.05);
ellipse(x+wd*.16, y+ht*.01, wd*.05, ht*.05);
fill(0);
ellipse(x-wd*.16, y+ht*.01, wd*.01, ht*.01);
ellipse(x+wd*.16, y+ht*.01, wd*.01, ht*.01);

//Eyebrows
noFill();
stroke(140);
strokeWeight(5);
arc(x-wd*.16, y-ht*.1, wd*.2, ht*.12, radians(200), radians(340), OPEN);
arc(x+wd*.16, y-ht*.1, wd*.2, ht*.12, radians(200), radians(340), OPEN);

// Forehead
stroke(80);
strokeWeight(1);
arc(x-wd*.157, y-ht*.2, wd*.2, ht*.12, radians(200), radians(340), OPEN);
arc(x, y-ht*.25, wd*.15, ht*.1, radians(30), radians(150), OPEN);
arc(x+wd*.157, y-ht*.2, wd*.2, ht*.12, radians(200), radians(340), OPEN);

arc(x-wd*.157, y-ht*.24, wd*.2, ht*.12, radians(240), radians(340), OPEN);
arc(x, y-ht*.29, wd*.15, ht*.1, radians(30), radians(150), OPEN);
arc(x+wd*.157, y-ht*.24, wd*.2, ht*.12, radians(200), radians(300), OPEN);


