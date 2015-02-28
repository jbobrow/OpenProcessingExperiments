
//B*E*A*B*Y***I*S***R*E*A*L* 
//Hello all, this is my first attempt at a demo. I am using my insight as a BEGINNER to try to give 
//a relatively simple to understand tutorial on DRAWING in processing. 
//OBJECTIVES: understand basic drawing functions + basic mouse input 
//this is more of a fun exercise to practice processing through trial and error, 
//but no replacement for the tutorials on Processing.org 
// 
//enjoy! 
//PS1: to ‘de-activate’ a line of code you can add a double slash or // to turn it into a comment 
//PS2: all COLORED text can be right-clicked»find in reference to access the PROCESSING reference 
// 
// 
//there were two parts to this exercise: 
//PART1 plugin mouse info (mouseX) INTO the variables 
//PART2 draw something using VARIABLES (a) 
void setup () { 
//the void setup is like the stretchers of a canvas, 
//they determine things that will ALWAYS be the same 
size(600, 600); smooth(); 
//optional function 
} 
void draw() { 
//void draw is like a player, it runs through all you code from top to bottom 
background(255); strokeWeight(1); stroke(0); noFill(); 
//PART 1 
//map is a really nice function which translates a set of data input like ‘mouseX’ into a different range of numbers 
float a = map(mouseX, 0, width, 0, 30); 
//before plugging in variables (a) it’s good to make (a) a SET value (I commented out the line of code for you) 
//float a = 40; 
//PART 2 //the rest of the code is just drawing 
//a lot of this was trial and error using basic geometry. 
//nose 
arc(300, 350, 58, 60-a*2, 0, PI); 
arc(355, 350, 50, 30-a, PI, TWO_PI); 
arc(360, 350, 40, 30-a, 0, PI); 
arc(245, 350, 50, 30-a, PI, TWO_PI); 
arc(240, 350, 40, 30-a, 0, PI); 
line(260, 350, 260+2*a+a/4, 170); 
line(340, 350, 340-2*a-a/4, 170); 

for (int e = 0; e<= 45; e = e+4) {
    stroke(2-a/100);
    strokeWeight(1.1);
    
    //eye brows
    line(260-e+2*a/5, 170, 260-e+((a/10)+2*a), 140-a/5);
    line(340+e-2*a/5, 170, 340+e-((a/10)+2*a), 140-a/5);
  }
 
 
 
  //eyes
 
  //left
 
 
  line(230, 220+a, 230, 240-a);
  line(370, 220+a, 370, 240-a);
 
 
  noFill();
  strokeWeight(1);
  //glasses
 //push matrix is a bit complicated, but essentially i lets you rotate, scale, change the canvas in many ways. //the push matrix always has a popmatix at the end as a way to 'bracket' the rotate or scaling effect so it //doesnt affect the REST of the code... i hope this made sense...
  pushMatrix();
  translate(0, 2*a);
  rectMode(CORNER);
  rect(200, 260, 65, 15);
  rectMode(CORNER);
  rect(335, 260, 65, 15);
  strokeCap(BEVEL);
  arc(300, 270, 70, 15, PI, TWO_PI);
  popMatrix();
 
 
  
 
//mustache
stroke(0,255-a*10);
strokeWeight(1);
  line(299, 400, 340-2*a, 400);
  arc(340, 385, 30, 30, 0+a/2, HALF_PI);
  arc(345, 385, 20, 20, PI+HALF_PI+a/2, TWO_PI);
  arc(345, 380, 7, 11, 0+a/2, (PI+HALF_PI));
  line(301, 400, 260+2*a, 400);
  arc(260, 385, 30, 30, HALF_PI+a/2, PI);
  arc(255, 385, 20, 20, PI+a/2, PI+HALF_PI);
  arc(255, 380, 7, 11, PI+HALF_PI+a/2, TWO_PI+PI);
 
 
//  noStroke();
//  rect(0, 0, width, height);
  strokeWeight(1+(3/a));
//stress
float r = random(.2+a/30);
//stroke(0,0+10*a);
//arc(300+r*100, 190, 7, 11, 0+a/2, (PI+a/2+HALF_PI));
  stroke(0, 220);
  strokeWeight(1);
  //mouth
 
  arc(width/2, 420, 40+a, 13+a/2, 4.24-r*(a/10), 5.03+r*(a/10));
  //line(280, 410-r, 320, 410+r);
  println(mouseX);
  //println() is a great troubleshooting tool, it shows you in 'real time' the value of the 
  //variable you try to 'print' in this case, mouseX
}
