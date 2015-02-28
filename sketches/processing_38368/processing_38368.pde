
// Project ONE | Drawing Machine | Mikale Kwiatkowski | S20.11

// Instructions:
// Divide the work surface into 16 areas of equal length and width.
// Each area should be touching a minumum of one other area along at least one of its sides.
// Draw equidistantly 25 horizontal or vertical lines within each of the sixteen areas.
// All line within a square must be oriented the same direction.
// Line thickness may vary.


void setup () {
  size (500, 500);
}


void draw() {
}  


int p = 5; //this is for the push (negative space) between the areas


void mousePressed() {
  background(255);
  for (int a = 0; a < width/4; a+=5) { // addresses areas and spacing of lines within each of the 16 areas

    stroke(random(1,255));

    strokeWeight(random(1, 5)); 
    line(a, 0, a, height/4); //Area 1

    strokeWeight(random(1, 5)); 
    line(width/4, a, width/2, a); //Area 2

    strokeWeight(random(1, 5)); 
    line(a+(width/2)+p, 0, a+(width/2)+p, height/4); //Area 3

    strokeWeight(random(1, 5)); 
    line(((width/4)*3)+p, a, width, a); //Area 4

    strokeWeight(random(1, 5)); 
    line(0, (a+(height/4))+p, width/4-p, (a+(height/4))+p); //Area 5

    strokeWeight(random(1, 5)); 
    line(a+(width/4), height/4, a+(width/4), height/2); //Area 6

    strokeWeight(random(1, 5)); 
    line((width/2), a+((height/4)+p), (width/4)*3, a+((height/4)+p)); //Area 7

    strokeWeight(random(1, 5)); 
    line(a+((width/4)*3)+p, (height/4), a+((width/4)*3)+p, (height/2)); //Area 8

    strokeWeight(random(1, 5)); 
    line(a, (height/2)+p, a, (height/4)*3); //Area 9

    strokeWeight(random(1, 5)); 
    line(width/4, a+((height/2)+p), width/2, a+((height/2)+p)); //Area 10

    strokeWeight(random(1, 5)); 
    line(a+(width/2)+p, (height/2)+p, a+(width/2)+p, ((height/4)*3)); //Area 11

    strokeWeight(random(1, 5)); 
    line(((width/4)*3)+p, a+((height/2)+p), width, a+((height/2)+p)); //Area 12

    strokeWeight(random(1, 5)); 
    line(0, a+(((height/4)*3)+p), (width/4)-p, a+(((height/4)*3)+p)); //Area 13

    strokeWeight(random(1, 5)); 
    line(a+(width/4), ((height/4)*3)+p, a+(width/4), height); //Area 14

    strokeWeight(random(1, 5)); 
    line(width/2, a+(((height/4)*3)+p), (width/4)*3, a+(((height/4)*3)+p)); //Area 15

    strokeWeight(random(1, 5)); 
    line(a+((width/4)*3)+p, ((height/4)*3)+p, a+((width/4)*3)+p, height); //Area 16
  }
}

//Notes to Self:
//want to have either horizontal or vertical series of lines
//want a 16 area grid; 4 across; 4 down
//want each assigned line series within a area to randomly assign color
//want each assigned line series within a area to randomly assign stroke weight
//want each mousePressed to produce a new sketch
//would like to figure out how to make each area randomly assign either horizontal or vertical lines


