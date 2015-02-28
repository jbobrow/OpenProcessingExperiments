
/* 
Jenny Hsu
Week 01

Creative Computing Section B
Benjamin Bacon
6 February
*/

size(600,600);
background (240, 220, 100);
strokeWeight(10);
stroke(255, 255, 255);
 
// Body
beginShape();
line(123, 100, 480, 100);
line(120, 170, 120, 450);
line(480, 170, 480, 450);
line(120, 450, 480, 450);
fill(50,50,50);
endShape();
noFill();
arc(120, 136, 45, 70, radians(91), radians(276));
arc(480, 136, 45, 70, radians(-85), radians(90));
//below is for semi-circle 180 deg vertical -> (
//arc(120, 130, 40, 60, HALF_PI, PI+HALF_PI);
 
// Smile
noFill();
arc(300, 345, 120, 30, 0, HALF_PI+HALF_PI);
 
// Eyes
// eyes - u
//arc(370, 200, 60, 30, radians(30), QUARTER_PI+HALF_PI);
arc(240, 225, 60, 20, radians(180), radians(360));
arc(370, 225, 60, 20, radians(180), radians(360));
 
// Legs
line(370, 450, 375, 520);
line(375, 520, 410, 540);
line(225, 450, 220, 520);
line(220, 520, 185, 540);
