
size(2560,1440);
background(71, 77, 103);


stroke(216,179,170); //Right cheek
fill(216,179,170);
quad(width/2 + width/8,
height/2 - height/16, 
width/2 + 3*width/32, 
3*height/4, 
width/2, height/2 +height/4 -100,width/2, height/2 );

stroke(216,179,170); //Left cheek
fill(218,185,174);
quad(width/2 - width/8,
height/2 - height/16, 
width/2 - 3*width/32, 
3*height/4, 
width/2, 
height/2 +height/4 -100,
width/2,
height/2 );

strokeWeight(0); 
stroke(190,147,126); //Right eye socket
fill(216,179,170);
triangle(width/2 + width/8,
height/2 - height/16, 
width/2, 
7 * height/16, 
width/2, 
height/2 );

strokeWeight(0); 
stroke(218,178,150); //Left eye socket
fill(218,178,150);
triangle(width/2 - width/8,
height/2 - height/16, 
width/2, 
7 * height/16, 
width/2,
height/2 );

//stroke(207,171,157); // Outline of Left side of JAW
//strokeWeight(5); 
//line( width/2 - width/8, height/2 - height/16, width/2 - 3*width/32, 3*height/4);

stroke(194,146,124); // Forehead
fill(194,146,124);
strokeWeight(5); 
quad(
width/2 - width/8, 
height/2 - height/16, 
width/2 - 4*width/32 + 25, 
height/4,
width/2 + 4*width/32 - 25, 
height/4,
width/2 + width/8, 
height/2 - height/16 
);

ellipseMode(CENTER); //Hair on head
stroke(106,90,95);
strokeWeight(36); 
fill(76,63,65);
arc(width/2, height/4, 7*width/32 + 20, height/6, PIE, TWO_PI );
 

stroke(195,151,123); // Outline of Left side of JAW TOP
strokeWeight(5); 
line( 
width/2 - width/8, 
height/2 - height/16, 
width/2 - 4*width/32 + 25, 
height/4);

stroke(197,118,117); // Outline of Right side of JAW TOP
strokeWeight(55); 
line( 
width/2 + width/8, 
height/2 - height/16, 
width/2 + 4*width/32 - 25, 
height/4);

stroke(196,174,188); // Outline of Right side of JAW
strokeWeight(22); 
line( width/2 + width/8, height/2 - height/16, width/2 + 3*width/32, 3*height/4);

stroke(177,132,117); // Outline of bottom of JAW
strokeWeight(15); 
line( width/2 - 3*width/32, 3*height/4, width/2 + 3*width/32,3*height/4 );

stroke(204,192,194); // Neck
strokeWeight(44);
fill(213,182,161);
quad( width/2 - 3*width/32, 3*height/4 +50, 
width/2 + 3*width/32, 3*height/4 +50,
width/2 + 3*width/32,height,
width/2 - 3*width/32, height);

stroke(198,190,211); // Neck
strokeWeight(0);
fill(206,198,217); // Neck
quad( 
width/2 + 2*width/32, 3*height/4 +50, 
width/2 + 3*width/32, 3*height/4+ 50,
width/2 + 3*width/32,height,
width/2 + 2*width/32, height);

ellipseMode(CENTER); // Shadow of bottom of beard
stroke(64,50,50);
strokeWeight(3); 
fill(64,50,50);
arc(width/2, 3*height/4, 5*width/32, height/4, 0, PIE);

ellipseMode(CENTER); //Bottom of beard
stroke(97,99,109);
strokeWeight(36); 
fill(76,63,65);
arc(width/2, 3*height/4, 7*width/32, height/12, 0, PIE);

ellipseMode(CENTER); //Bottom of beard, right side.
stroke(52,50,62);
strokeWeight(36); 
fill(46,46,47);
arc(width/2, 3*height/4, 7*width/32, height/20, 0, PIE/2);

ellipseMode(CENTER); //Beard around mouth arc
stroke(97,99,109);
strokeWeight(36); 
fill(46,46,47);
arc(width/2, 3*height/4, 5*width/32, height/3, PI, TWO_PI);

ellipseMode(CENTER); //Mouth/Lips  BOTTOM
stroke(197,118,117);
strokeWeight(36); 
fill(32,30,40);
arc(width/2, 3*height/4 -130, 2*width/32, height/36, 0, PI);

ellipseMode(CENTER); //Mouth/Lips TOP
stroke(126,64,73);
strokeWeight(36); 
fill(32,30,40);
arc(width/2, 3*height/4 -130, 2*width/32, height/20, PI, TWO_PI);


strokeWeight(0); //top of zee nose
fill(227,195,172);
ellipse(width/2, height/2 - height/16, width/48, height/10);

strokeWeight(0); //width of bottom of zee nose
fill(219,194,199);
ellipse(width/2, height/2 + height/20, height/10, width/48);

strokeWeight(0); //tip of zee nose
fill(188,130,113);
ellipse(width/2, height/2, width/32, height/10);

stroke(188,130,113); //left nostril
strokeWeight(0); 
fill(46,46,47);
ellipse(width/2 - width/64, height/2 + height/20, width/64, height/64);

stroke(188,130,113); //right nostril
strokeWeight(0); 
fill(46,46,47);
ellipse(width/2 + width/64, height/2 + height/20, width/64, height/64);

stroke(66,45,46); //left Eye white
strokeWeight(5); 
fill(158,134,125);
ellipse(7*width/16, 7*height/16, width/24, height/24);

stroke(58,45,52); //right Eye white
strokeWeight(5); 
fill(113,104,112);
ellipse(9 * width/16, 7 * height/16, width/24, height/24);

stroke(55,46,55); //left Eye pupil
strokeWeight(5); 
fill(57,56,65);
ellipse(7*width/16, 7*height/16, 33, 33);

stroke(39,33,45); //right Eye pupil
strokeWeight(5); 
fill(59,59,68);
ellipse(9 * width/16, 7 * height/16, 33, 33);

ellipseMode(CENTER); //Hair on head Broad swath
stroke(106,90,95);
strokeWeight(36); 
fill(76,63,65);
arc(width/2, height/4, 7*width/32 + 40, height/6, PIE, TWO_PI );
 
ellipseMode(CENTER); //HAIR on head
stroke(134,115,117);
strokeWeight(5); 
//fill(134,115,117);
noFill();
arc(width/2, height/4, 7*width/32 + 60, height/6, PIE, TWO_PI );

ellipseMode(CENTER); //HAIR on head
stroke(139,118,118);
strokeWeight(5); 
//fill(134,115,117);
noFill();
arc(width/2, height/4 -5, 7*width/32 + 70, height/6 +10, PIE, TWO_PI );

ellipseMode(CENTER); //HAIR on head
stroke(135,110,118);
strokeWeight(5); 
//fill(134,115,117);
noFill();
arc(width/2, height/4 - 20, 7*width/32 , height/6 -40, PIE, TWO_PI );

ellipseMode(CENTER); //HAIR on head
stroke(132,122,124);
strokeWeight(5); 
//fill(134,115,117);
noFill();
arc(width/2, height/4 - 20, 6*width/32 , height/8, PIE, TWO_PI );

ellipseMode(CENTER); //HAIR on head
stroke(135,122,100);
strokeWeight(5); 
//fill(134,115,117);
noFill();
arc(width/2, height/4 - 20, 6*width/48 , height/10, PIE, TWO_PI );
