
/*
Konkuk University
SOS iDesign

Name: YUN Sojung <<------ Write your full name here!
ID: 201420093 <<--------- Write your ID here!

*/

void setup(){
size (600, 600);
background(255);
// noLoop();
smooth();
colorMode (RGB, 600);
}

void draw(){
println(mouseX + " : " + mouseY);

fill(486.45,307.85,105.75);
ellipse(117,165,178,185);
ellipse(480,171,178,185);
ellipse(288,320,450,360);
fill(600,600,600);
ellipse(285,408,137,100);
fill(0,0,0);
ellipse(280,392,35,35);

float mx1=constrain(mouseX,170,130);
float mx2=constrain(mouseX,396,440);
float my1=constrain(mouseY,373,350);
ellipse(mx1,my1,52,55);
ellipse(mx2,my1,51,55);

strokeWeight(15);
noFill();
bezier(472,218,494,183,524,160,565,165);
bezier(132,185,106,164,71,156,32,170);
bezier(289,411,299,421,308,428,318,436);
bezier(277,411,270,421,263,428,254,436);

  fill(random(253),random(493),mouseY);
  triangle(mouseX,mouseY-50,mouseX-50,mouseY+30,mouseX+50,mouseY+30 );
}

// here you add your code with all shapes and colors. 



