
// Pickle Fred and Floating Pig Head in the Rain 
// Rain using for loop
// Eye winking using "mousePressed" function
int i = 40;
int y = 20;

void setup(){
size(480, 480);
smooth();
background(98, 198, 242);
}

void draw() {
 
// floating pig
strokeJoin(ROUND);
strokeWeight(5); //head
stroke(0);
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
ellipse(140, 320, 7, 7); //left eye
ellipse(160, 320, 10, 3); //right eye



// pickle head fred 
//body structure
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
ellipse(383, 250, 4, 4); 


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

/*strokeWeight(1);
fill(0);
strokeJoin(ROUND);
rect(270, 280, 10, 35);
fill(46, 44, 240);
triangle(250, 315, 300, 315, 275, 460);
line(275, 460, 260, 315);
line(275, 460, 275, 315);
line(275, 460, 290, 315);*/

beginShape(); //right arm
vertex(405, 274);
vertex(463, 285);
vertex(469, 255);
vertex(465, 255);
vertex(459, 281);
vertex(405, 270);
endShape();


//rain
strokeWeight(2); //rain
stroke(51, 84, 124);
for(int i = 40; i <= 440; i+=40){
  for(int y = 20; y <= 200; y +=40){
    line(i, y, i+2, y-10);
    line(i +10, y+10, i+11, y+19);
    
    }//for int i bracket 
   } // for int y bracket 
  } // void draw bracket 



