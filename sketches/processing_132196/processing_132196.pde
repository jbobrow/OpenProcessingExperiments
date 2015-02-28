
size(480, 480);
smooth();
background(98, 198, 242);

// red creature
strokeJoin(ROUND);
strokeWeight(5); //head
fill(250, 8, 40); //red
rect(100, 300, 100, 60);

ellipse(150, 340, 20, 20); //nose
point(147, 340);  //nostrils
point(153, 340);

stroke(0);
triangle(100, 300, 125, 270, 150, 300); //left ear, outer
triangle(110, 300, 125, 280, 140, 300); //left ear, inner

triangle(150, 300, 175, 250, 200, 300); //right ear, outer
triangle(160, 300, 175, 270, 190, 300); //right ear, inner

strokeWeight(3);
ellipseMode(CENTER); //face 
fill(2, 6, 111);
ellipse(140, 320, 7, 7); //right eye
ellipse(160, 320, 10, 3); //left eye

// tall creature
fill(8, 160, 32); //green
rect(360, 180, 50, 260);
arc(385, 440, 50, 40, 0, PI); //botton arc
arc(385, 180, 50, 70, PI, TWO_PI); //top arc

strokeWeight(3);
ellipse(375, 220, 10, 15); //left eye
ellipse(390, 220, 10, 15); //right eye
ellipse(374, 222, 4, 4); //inner left eye
ellipse(389, 222, 4, 4); //inner right eye 

point(375, 237); //freckles
point(367, 245);
point(365, 238);
point(397, 238);
point(404, 237);
point(399, 245);

fill(255); //mouth
ellipse(383, 250, 13, 17); 

strokeWeight(1); //left arm
fill(8, 160, 32);
beginShape();
vertex(365, 274);
vertex(317, 285);
vertex(313, 315);
vertex(317, 315);
vertex(321, 289);
vertex(365, 278);
endShape();

beginShape(); //right arm
vertex(405, 274);
vertex(463, 285);
vertex(469, 255);
vertex(465, 255);
vertex(459, 281);
vertex(405, 270);
endShape();

strokeWeight(2);
stroke(51, 84, 124);
for(int i = 40; i <= 440; i+=40){
  line(i+20, 20, i+22, 30);
  line(i, 60, i-2, 70);
  line(i+20, 100, i+22, 110);
  line(i, 140, i-2, 150);
  line(i+20, 180, i+22, 190);
}



