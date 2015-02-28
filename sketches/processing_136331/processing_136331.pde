
// Got Peace? by Sarah Kettell
//
// I decided it would be fun to play with patterns by doing 
// something retro/psychedelic styled. The peace sign is a combination
// of ellipses and lines. The text is a combination of arcs, ellipses,
// lines, and a point. The background is all triangles. There are a
// total of 55 unique objects.

// Main Canvas Properties
size(600, 540);
background(#FCF996);
smooth();


// Background star pattern
strokeWeight(1);

fill(#FFBD83);
stroke(#FFBD83);
triangle(300, -290, 840, 530, -240, 530);
triangle(-240, -15, 840, -15, 300, 815);

fill(#F5C6FF);
stroke(#F5C6FF);
triangle(300, -250, 800, 510, -200, 510);
triangle(-200, 5, 800, 5, 300, 775);

fill(#ADE4FC);
stroke(#ADE4FC);
triangle(300, -210, 760, 490, -160, 490);
triangle(-160, 25, 760, 25, 300, 735);

fill(#FCF996);
stroke(#FCF996);
triangle(300, -170, 720, 470, -120, 470);
triangle(-120, 45, 720, 45, 300, 695);

fill(#FFBD83);
stroke(#FFBD83);
triangle(300, -130, 680, 450, -80, 450);
triangle(-80, 65, 680, 65, 300, 655);

fill(#F5C6FF);
stroke(#F5C6FF);
triangle(300, -90, 640, 430, -40, 430);
triangle(-40, 85, 640, 85, 300, 615);

fill(#ADE4FC);
stroke(#ADE4FC);
triangle(300, -50, 600, 410, 0, 410);
triangle(0, 105, 600, 105, 300, 575);

fill(#FCF996);
stroke(#FCF996);
triangle(300, -10, 560, 390, 40, 390);
triangle(40, 125, 560, 125, 300, 525);

fill(#FFBD83);
stroke(#FFBD83);
triangle(300, 30, 520, 370, 80, 370);
triangle(80, 145, 520, 145, 300, 485);

fill(#F5C6FF);
stroke(#F5C6FF);
triangle(300, 70, 480, 350, 120, 350); 
triangle(120, 165, 480, 165, 300, 445);

fill(#ADE4FC);
stroke(#ADE4FC);
triangle(300, 110, 440, 330, 160, 330);
triangle(160, 185, 440, 185, 300, 405);

fill(#FCF996);
stroke(#FCF996);
triangle(300, 150, 400, 310, 200, 310);
triangle(200, 205, 400, 205, 300, 365);

fill(#FFBD83);
stroke(#FFBD83);
triangle(300, 190, 360, 290, 240, 290);
triangle(240, 225, 360, 225, 300, 325);



// The peace sign
noFill();

stroke(#C42678);
strokeWeight(60);
ellipse(300, 230, 350, 350);
line(300, 80, 300, 380);
line(170, 305, 300, 230);
line(300, 230, 430, 305);

stroke(#FF64B5);
strokeWeight(40);
ellipse(300, 230, 350, 350);
line(300, 80, 300, 380);
line(170, 305, 300, 230);
line(300, 230, 430, 305);

stroke(#E21D83);
strokeWeight(30);
ellipse(300, 230, 350, 350);
line(300, 70, 300, 390);
line(160, 310, 300, 230);
line(300, 230, 440, 310);


// The Text
stroke(#C42678);
strokeWeight(10);
noFill();

// G
arc(90, 475, 50, 50, radians(0), radians(300));
line(90, 475, 115, 475);

// O
ellipse(140, 475, 50, 50);

// T
line(140, 450, 215, 450);
line(190, 450, 190, 499);

// P
arc(255, 470, 55, 40, radians(-110), radians(110));
line(255, 455, 255, 509);

// E
arc(310, 475, 50, 50, radians(70), radians(360));
line(290, 475, 330, 475);

// A
ellipse(360, 475, 50, 50);
line(387, 450, 387, 499);

// C
arc(420, 475, 50, 50, radians(60), radians(300));

// E
arc(460, 475, 50, 50, radians(70), radians(360));
line(440, 475, 483, 475);

// ?
arc(518, 465, 50, 40, radians(190), radians(430));
line(522, 484, 522, 500);
point(522, 515);



