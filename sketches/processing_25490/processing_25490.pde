
//bacground change colour based on x y 100 -> done
//make buttons change opacity/size
//make anntennas move based on where you are mouse x and y
// ^^ need to use map fuctions and extra variables
//if mouse pressed make the head pink, else make it purple

void setup() {
 size(500,400);
 smooth();
}

void draw () {  
 background(mouseX, mouseY, 100);
  
 int x = mouseX;
 int y = mouseY-10;

 stroke(0);
 strokeWeight(1);

 //Body
 fill(206, 5, 252);
 arc(x+15, y-30, 35, 35, TWO_PI-PI/2, TWO_PI);
 arc(x-15, y-30, 35, 35, PI, TWO_PI-PI/2);
 line(x+32, y-30, x+32, y+10);
 line(x-32, y-30, x-32, y+10);
 arc(x+15, y+10, 35, 35, 0, PI/2);
 arc(x-15, y+10, 35, 35, PI/2, PI);
 line(x-15, y+27, x+15, y+27);
 
 //Body fill
 stroke(255, 0);
 rect(x-31, y-30, 63, 40.5);
 rect(x-15, y+10.5, 31, 20);
 rect(x-15, y-46, 30.5, 16);
 
 //Head
 fill(206, 5, 252);
 stroke(0);
 ellipse(x, y-71, 50, 55);

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
 //strokeWeight(6);
 float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
 weight = map(weight, 0, 20, 5, 20);
 strokeWeight(weight);
 point(x-40, y-120);
 point(x+40, y-120);
 
  //Buttons
 strokeJoin(BEVEL);
 strokeWeight(2);
 //float opacity = map(mouseX, 0, 400, 0, 255);
 
 if (!mousePressed) {
   stroke(mouseX, 100, mouseY);
   fill(17, 185, 206);
 }
 ellipse(x-20, y-30, 6, 12);
 ellipse(x-10, y-30, 6, 12);
 ellipse(x-0, y-30, 6, 12);
 stroke(206, 17, 86);
 fill(206, 17, 86, 127);
 rect(x+12, y-35, 10, 10);

}

