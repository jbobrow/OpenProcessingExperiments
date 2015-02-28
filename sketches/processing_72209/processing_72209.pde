
//My program
//Hannah Lingle
// With help from Processing.org
//http://www.ehow.com/facts_4928026_symptoms-first-year-stress-college.html#ixzz272bzpKGX
//http://www.ehow.com/list_6544737_stress-statistics-college-students.html#ixzz272ba8JvX
float X;
float Y;
void setup(){
  size(800,400);
  smooth();
  float X=1;
  float Y=2;
  
}
 
void draw(){
background(106,239,255);
noStroke();
fill(255,196,33);
ellipse(X++,100,600,600);
fill(252);
textSize(50);
text("Coping with College Stress", 30,65);
textSize(18);
text("25%  of respondents reported that exercise helped reduce stress.", 38, 127);
text("20% Watching television or listening to music helped", 38, 144);
text("17% of students talked with friends and family to reduce stress.", 38, 160);
text("10% of college students reported that cleaning cars or apartments helped reduce stress.", 38, 177);
arc(mouseX,mouseY,70, 70, PI, PI+QUARTER_PI);
 
println("100: " + mouseX  + "100: " + mouseY);

noFill();
if(X>600){
  X=-1;
}
}
