
size(500,500);
smooth();
stroke(#EEE9E9);
strokeCap(PROJECT);
background(#37FDFC);
strokeWeight(10);
line(72,29,72,466); //left cheek
line(433,29,433,466); //right cheek

strokeWeight(4);
line(216,29,216,466); //left bridge line
line(289,29,289,466); //right bridge line
line(145,172, 145,489); //left middle bridge line
line(359,172,359,489); //right middle bridge line

fill(#EEE9E9);
rect(216,406,72,62.5); // mouth


strokeWeight(2);
line(189,370,189,465); //left lip line
line(315,370,315,465); //right lip line
line(189,394,314,394); //top lip line
line(199,286, 206,286); // left nostril top
line(199,286,199,304); // left nostrol left
line(199,304,304,304); // nose line
line(304,304,304,286); // right nostril 
line(298,286, 304,286); // right nostril tip
fill(#EEE9E9);
rect(45,190,28,87); //left ear
rect(433,190,28,87); //right ear

//left eye
noFill();
arc(145,132, 145, 74, 0, PI); //left lower eye
ellipse(144,143, 50, 50); //left eyeball
fill(#EEE9E9);
ellipse(144,143,30,30); //left pupil
noFill();
strokeWeight(4);
arc(145,153,143,74,    radians(180), radians(360)); //top left eye line
strokeWeight(5);
arc(145,120,142,85,    radians(180), radians(360)); //left eyebrow

//right eye
strokeWeight(2);
arc(360,132, 143, 74, 0, PI); //right lower eye
ellipse(360,142, 50, 50); //right eyeball
fill(#EEE9E9);
ellipse(360,142, 30,30); //right pupil
noFill();
strokeWeight(4);
arc(360,153,142,74,    radians(180), radians(360)); //top right eye line
strokeWeight(5);
arc(360,120,142,85,    radians(180), radians(360)); //right eyebrow

// art center eyes
strokeWeight(2);
arc(330,150,80,80,   radians(90), radians(180)); //right
arc(174,150,80,80,   radians(0), radians(90)); //left







