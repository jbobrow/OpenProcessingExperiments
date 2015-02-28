
// DANIEL MASTRETTA - CODE ASSIGNMENT 2
// BOOTCAMP : PARSONS THE NEW SCHOOL FOR DESIGN
// DRAW A CHARACTER THAT KEEPS ITS PROPORTIONS IF THE SIZE OF THE PROGRAM IS CHANGED
//
//   888    888        d8888 888            .d8888b.   .d8888b.   .d8888b.   .d8888b.  
//   888    888       d88888 888           d88P  Y88b d88P  Y88b d88P  Y88b d88P  Y88b 
//   888    888      d88P888 888           888    888 888    888 888    888 888    888 
//   8888888888     d88P 888 888           Y88b. d888 888    888 888    888 888    888 
//   888    888    d88P  888 888            "Y888P888 888    888 888    888 888    888 
//   888    888   d88P   888 888                  888 888    888 888    888 888    888 
//   888    888  d8888888888 888           Y88b  d88P Y88b  d88P Y88b  d88P Y88b  d88P 
//   888    888 d88P     888 88888888       "Y8888P"   "Y8888P"   "Y8888P"   "Y8888P"  
//                                                                                  
                                                                             
                                                                                  

size(600, 1200);

//helpers

println("width is");
println(width);
println("height is");
println(height);

float relationWH = (float)height/width;
println("relation is");
println(relationWH);

color sky = color(0);
color floor = color(#FF8827);


background(sky);
noStroke();
fill(255,255,255);
rect (0, height*.95, width, height);
rect (0, 0, width, height*.025);
rect (0, 0, width*.10, height);
rect (width*.90, 0, width, height);

stroke(0, 0, 0);
strokeWeight(relationWH*5);
strokeCap(SQUARE);
ellipseMode(CENTER);

fill(#D8D8D8);
ellipse(width/2, height/2, height*.35, height*.35);

fill(255,255,255);
ellipse(width/2, height/2, height*.3, height*.3);


fill(#000000);
noStroke();
ellipse(width/2, height/2, height*.28, height*.28);

fill(#F00000);
noStroke();
ellipse(width/2, height/2, height*.2, height*.2);

fill(#FF0000);
noStroke();
ellipse(width/2, height/2, height*.17, height*.17);

fill(#FF6F00);
noStroke();
ellipse(width/2, height/2, height*.016, height*.016);

fill(#FFCD00);
noStroke();
ellipse(width/2, height/2, height*.01, height*.01);
