
size( 650, 200);
background(55);

int x, y, z;
x = 3;
y = 5;
z = 10;

float mary, jane, jen;
mary = 34.245;
jane = 45.3;
jen = 2221.554326;

println( x + "," + y + "," + z);
println( x*2 + y-2);
println(width + "," + height);
println(width + z + " and " + height*y);

println( mary + "," + jane + "," + jen);
println( x*mary + "," + y*jane + "," + z*jen);
println( x*mary + y*jane + z*jen);
println(width-mary + " equals " + height*jen);

stroke(255);
strokeWeight(3);
line(width-width, height-height, width, height);
line(width, height-height, width-width, height);

strokeCap(ROUND);
strokeWeight(16);
stroke(255);
line(width*0.5, height-40, width*0.5, height-height+40);
stroke(225, 186, 0);
line (width-150, height*0.5, width-width+150, height*0.5);

noStroke();
fill(224, 34, 67);
ellipse(width-width+70, height*0.5, width*0.2, height*0.6);
ellipse(width-70, height*0.5, width*0.2, height*0.6);

noFill();
stroke(225, 186, 0);
strokeWeight(8);
ellipse(width-width+70, height*0.5, width*0.1, height*0.3);
ellipse(width-70, height*0.5, width*0.1, height*0.3);

fill(225, 186, 0);
strokeWeight(4);
ellipse(width-width+70, height*0.5, width*0.01, height*0.03);
ellipse(width-70, height*0.5, width*0.01, height*0.03);





