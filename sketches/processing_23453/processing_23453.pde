

 size(400,300);
 background(250); 
 smooth();
  
 int x = 150;
 int y = 150;

 //Head
 fill(206, 5, 252, 200);
 stroke(145, 23, 132);
 strokeWeight(1);
 ellipse(x, y-70, 50, 55);

 //Body
 stroke(145, 23, 132);
 fill(206, 5, 252, 110);
 arc(x+15, y-30, 35, 35, TWO_PI-PI/2, TWO_PI);
 arc(x-15, y-30, 35, 35, PI, TWO_PI-PI/2);
 line(x+32, y-30, x+32, y+10);
 line(x-32, y-30, x-32, y+10);
 arc(x+15, y+10, 35, 35, 0, PI/2);
 arc(x-15, y+10, 35, 35, PI/2, PI);
 line(x-15, y+27, x+15, y+27);
 //Body fill
 stroke(255, 0);
 rect(x-32, y-30, 64, 40.5);
 rect(x-15, y+10.5, 31, 20);
 rect(x-15, y-46, 30.5, 16);
 

 //Arms
 stroke(0);
 ellipse(x+35.8, y-30, 10, 10);
 ellipse(x-35.8, y-30, 10, 10);
 strokeWeight(1.5);
 line(x+36, y-27, x+40, y+10);
 line(x-36, y-27, x-40, y+10);
 strokeWeight(6);
 point(x+40, y+10);
 point(x-40, y+10);
 
 //Legs
 strokeWeight(8);
 strokeCap(ROUND);
 line(x-16, y+29, x+16, y+29);
 strokeWeight(6);
 line(x-11, y+45, x+11, y+45);
 strokeWeight(4);
 line(x-6, y+60, x+6, y+60);

 //Eyes
 stroke(0);
 strokeWeight(1);
 fill(255);
 ellipse(x+10, y-75, 12, 22);
 ellipse(x-10, y-75, 12, 22);
 
 //Pupils
 strokeWeight(9);
 point(x+9, y-68);
 point(x-9, y-68);
 
 //mouth
 strokeWeight(1.5);
 strokeCap(ROUND);
 noFill();
 arc(x+5, y-58, 15, 15, 0, PI/2);
 
 //Antennas
 line(x-17, y-90, x-40, y-120);
 line(x+17, y-90, x+40, y-120);
 strokeWeight(6);
 point(x-40, y-120);
 point(x+40, y-120);
 
  //Buttons
 strokeJoin(BEVEL);
 strokeWeight(2);
 stroke(17, 185, 206, 127);
 fill(17, 185, 206);
 ellipse(x-20, y-30, 6, 12);
 ellipse(x-10, y-30, 6, 12);
 ellipse(x-0, y-30, 6, 12);
 stroke(206, 17, 86);
 fill(206, 17, 86, 127);
 rect(x+12, y-35, 10, 10);



