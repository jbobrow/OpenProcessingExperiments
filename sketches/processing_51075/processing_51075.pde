
size(500,500);
smooth();

int r = 180;
int t = 10;

strokeCap(PROJECT);
background(t,r,r); //background color with r and t variables
strokeWeight(t);
line(72,29,72,466); //left cheek
line(433,29,433,466); //right cheek

strokeWeight(4);
line(216,29,216,466); //left bridge line
line(289,29,289,466); //right bridge line
line(145,172, 145,489); //left middle bridge line
line(359,172,359,489); //right middle bridge line

fill(0);
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
fill(0);
rect(45,190,28,87); //left ear
rect(433,190,28,87); //right ear

//left eye
noFill();
arc(145,132, 145, 74, 0, PI); //left lower eye
ellipse(144,143, t*5, t*5); //left eyeball with t variable
fill(0);
ellipse(144,143,t*3,t*3); //left pupil with t variable
noFill();
strokeWeight(4);
arc(145,153,143,74,    radians(r), radians(r*2)); //top left eye line with r variable
strokeWeight(5);
arc(145,120,142,85,    radians(r), radians(r*2)); //left eyebrow with r variable

//right eye
strokeWeight(2);
arc(r*2,132, 143, 74, 0, PI); //right lower eye with r variable
ellipse(r*2,142, t*5, t*5); //right eyeball with t and r variable
fill(0);
ellipse(r*2,142, t*3,t*3); //right pupil with r variable
noFill();
strokeWeight(4);
arc(r*2,153,142,74,    radians(r), radians(r*2)); //top right eye line with r variable
strokeWeight(5);
arc(r*2,120,142,85,    radians(r), radians(r*2)); //right eyebrow with r variable

// art center eyes
strokeWeight(2);
arc(330,150,t*8,t*8,   radians(r/2), radians(r)); //right with t variable
arc(174,150,t*8,t*8,   radians(0), radians(r/2)); //left with t variable







