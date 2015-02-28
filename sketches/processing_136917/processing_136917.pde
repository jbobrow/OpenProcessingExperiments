
//  Now birds are flying
//  In summer's earliest hour
//  Away to the west
//
//  Tranquility was my goal in this sketch, and something of a natural likeness
//  Use the java version of Processing 2 please: this sketch will not perform well in
//  Processing.js, as that seems to have trouble with the 'arc' function

size (800, 400);
background(#CE7272);
noStroke();

//  rays
stroke(0x3f76B0B4);
strokeWeight(6);
line(width,height*0.65, 0,height*0.65);
stroke(0x2f76B0B4);
strokeWeight(10);
line(width,height*0.6, 0,height*0.6);
stroke(0x1f76B0B4);
strokeWeight(14);
line(width,height*0.55, 0,height*0.55);
stroke(0x1076B0B4);
strokeWeight(18);
line(width,height*0.5, 0,height*0.5);
stroke(0x1076B0B4);
strokeWeight(18);
line(width,height*0.45, 0,height*0.45);

//  sun
noStroke();
fill(#FF663B);
ellipse(width*0.5,height*0.6, width*0.125,width*0.125);

//  land mass
fill(#764F4F);
rect(0, height*0.667, width, height*0.333);

//  various parts of the cloud sky
fill(#79616C);
quad(width*0.2, 0, width*0.4, height*0.18, width*0.667, height*0.22, width*0.667, 0);
fill(#AA7F93);
quad(-width, 0, width*0.22, 0, width*0.4, height*0.22, width*0.22, height*0.29);
fill(#9B7787);
quad(width*2, -height*0.25, width*0.667, 0, width*0.4, height*0.22, width*0.8, height*0.29);
fill(#C68CA7);
quad(-20, height*0.333, width*0.25, height*0.167, width*0.667, height*0.29, width*0.22, height*0.40);
fill(#E3A5C6);
quad(width+20, height*0.333, width*0.75, height*0.18, width*0.5, height*0.29, width*0.667, height*0.333);

//  shadows on land mass
fill(#6F4A4A);
triangle(width*0.08, height, width*0.4,height*0.7,  width*0.42,height);
fill(#6A4646);
triangle(width*0.92, height, width*0.6,height*0.7,  width*0.58,height);

//  sun shading to yellow
fill(#FF703B);
arc(width*0.5,height*0.6, width*0.125,width*0.125, PI, TWO_PI, OPEN);
fill(#FF7D3B);
arc(width*0.5,height*0.6, width*0.125,width*0.125, PI+QUARTER_PI/2, TWO_PI-QUARTER_PI/2, OPEN);
fill(#FF9D3B);
arc(width*0.5,height*0.6, width*0.125,width*0.125, PI+QUARTER_PI, TWO_PI-QUARTER_PI, OPEN);

//  birds
stroke(#552F21);
strokeWeight(2);
noFill();
float  birdPosX = width*0.2, birdPosY = height*0.5, birdSize = width*0.02;
arc(birdPosX-birdSize, birdPosY, 2*birdSize, 2*birdSize, PI+QUARTER_PI, TWO_PI);
arc(birdPosX+birdSize, birdPosY, 2*birdSize, 2*birdSize, PI, TWO_PI-QUARTER_PI);

birdPosX = width*0.15; birdPosY = height*0.45; birdSize = width*0.015;
arc(birdPosX-birdSize, birdPosY, 2*birdSize, 2*birdSize, PI+QUARTER_PI, TWO_PI);
arc(birdPosX+birdSize, birdPosY, 2*birdSize, 2*birdSize, PI, TWO_PI-QUARTER_PI);

birdPosX = width*0.10; birdPosY = height*0.42;birdSize = width*0.012;
arc(birdPosX-birdSize, birdPosY, 2*birdSize, 2*birdSize, PI+QUARTER_PI, TWO_PI);
arc(birdPosX+birdSize, birdPosY, 2*birdSize, 2*birdSize, PI, TWO_PI-QUARTER_PI);

//  end



