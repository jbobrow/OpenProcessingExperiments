
size(800,400);
background(30,0,30);
stroke(0,255,100);
strokeWeight(40);
point(100,60);
point(200,100);
point(50,170);
point(200,250);
stroke(255,0,0);
strokeWeight(20);
point(170,80);
stroke(200);
strokeWeight(5);
line(100,60,200,200);
line(20,20,180,180);
triangle(100,60,200,100,50,170);
fill(255,0,0);
stroke(0,255,100);
triangle(2,18,80,80,300,300);
stroke(100);
strokeWeight(30);
triangle(3,20,12,82,250,250);
strokeWeight(20);

strokeWeight(40);
line(0,300,400,0);
stroke(0,0,25);
strokeWeight(6);
fill(25,0,0);
triangle(200,30,40,50,60,70);
noFill();
strokeWeight(3);
stroke(255,0,0);
triangle(100,20,200,400,1,3);
stroke(80);
strokeWeight(3);
fill(20,3,11);
rect(200,30,250,100);
fill(30);
ellipse(600,200,100,100);
ellipse(550,200,100,100);
ellipse(500,200,100,100);
ellipse(450,200,100,100);
ellipse(400,200,100,100);
ellipse(350,200,100,100);
fill(2550,0,0);
beginShape();
  vertex(80,50);
  vertex(10,50);
  vertex(20,90);
  vertex(50,0);
  vertex(100,40);
endShape(CLOSE);
fill(0,250,130);
beginShape();
  vertex(300,200);
  bezierVertex(20,30,80,75,180,30);
endShape();

beginShape();
  vertex(20,30);  
  vertex(80,75);
  vertex(180,30);
  vertex(180,30);
  vertex(29,150);
  vertex(0,0);
endShape(CLOSE);
ellipseMode(CORNERS);
ellipse(80,50,280,150);
rectMode(CORNERS);
noFill();
rect(80,50,280,150);



print("lLlalalala \"does this workk\"");

/*variable to be defined later
String line1;
line1= "grass";
*/
// variable defined 
String line1 = "the weight of manking";
String line2 = "    math";
println(line1);
line2= "grand";
println(line2);
  int seven= 7;
  int one= 1;
println(seven);
println(line2);

//math
int x= 7;
int y= 9;
float xx= 7;
float yy=9;

float sum= xx+y;

println(x/xx); //result is a float
println(x/y); // result is an int despite the correct calculation
println(xx*yy); //result is usually a float
println(sum+y);


