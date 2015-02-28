
void setup() {
  
  size(700, 500);
  background(255);
  
noFill();
stroke(167,116,25);
strokeWeight(8);
smooth();
beginShape();
bezier(152,254,159,285,182,351,201,378);
bezier(201,378,239,386,337,364,401,300);
bezier(401,300,391,258,367,218,359,208);
bezier(359,208,357,116,319,107,280,120);
bezier(280,120,280,157,283,204,282,214);
line(282,214,232,232);
line(232,232,189,144);
bezier(189,140,127,155,129,221,152,254);

fill(215,174,103);
ellipse(270,272,40,40);
endShape();

noFill();
bezier(380,245,427,257,426,277,401,300);

stroke(0);
strokeWeight(4);
ellipse(400,170,20,20);
ellipse(450,120,20,20);

rect(500,60,150,100);

noFill();
stroke(0);
arc(530,110,50,50,0,PI/2);
arc(620,110,50,50,PI/2,PI);

//I had a fall just now. Two men laugh at me. I fell 5 times today and that's so embarrassing.

int five = 5;
float two = 2;

String fall = "I had a fall just now";
String laugh = "men laugh at me";
String and = "and that's so embarrassing";

println(fall + ".");
println();
println(two  +  laugh + ".");
println();
println("I fell " + five + " times today");
println();
println(and);


}

