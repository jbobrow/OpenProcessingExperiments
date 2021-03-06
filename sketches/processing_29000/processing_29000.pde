
//global varibles
float r = random(255);
float g = random(255);

void setup() {
  size (450, 450);
  background (255, 255, 255);
  smooth();
  noFill();
  frameRate(2);
}

void draw() {

  //repeats "x" 10 times across
  for (int x=0; x< 10; x++) {
    //repeats "y" 10 times down for each time "x" is looped above
    for (int y=0; y<10; y++) {

      //"b" value defined here so it will constantly redraw
      float b = random(255);
      //"r" and "g" values are picked at random and remain constant until sketch is run again 
      stroke (r, g, b);
      strokeWeight (3);


      //odd numbered rows - hexagons
      beginShape();
      vertex((x*60)+16, (y*90)+24);
      vertex((x*60)+30, (y*90)+16);
      vertex((x*60)+44, (y*90)+24);
      vertex((x*60)+44, (y*90)+41);
      vertex((x*60)+30, (y*90)+49);
      vertex((x*60)+16, (y*90)+41);
      endShape(CLOSE);

      //line that forms top edge of cube on odd numbered rows
      strokeJoin(MITER);
      beginShape();
      vertex((x*60)+16, (y*90)+24);
      vertex((x*60)+30, (y*90)+32);
      vertex((x*60)+44, (y*90)+24);
      endShape();

      //lines that arches** over hexagons
      strokeJoin(MITER);
      beginShape();
      vertex((x*60)+0, (y*90)+60);
      vertex((x*60)+0, (y*90)+16);
      vertex((x*60)+30, (y*90)+0);
      vertex((x*60)+60, (y*90)+16);
      endShape();

      //even numbered rows - hexagons - offset(-30,-45)
      beginShape();
      vertex((x*60)+16-30, (y*90)+24-45);
      vertex((x*60)+30-30, (y*90)+16-45);
      vertex((x*60)+44-30, (y*90)+24-45);
      vertex((x*60)+44-30, (y*90)+41-45);
      vertex((x*60)+30-30, (y*90)+49-45);
      vertex((x*60)+16-30, (y*90)+41-45);
      endShape(CLOSE);

      //line that forms top edge of cube on even numbered rows  - offset(-30,-45)
      strokeJoin(MITER);
      beginShape();
      vertex((x*60)+16-30, (y*90)+24-45);
      vertex((x*60)+30-30, (y*90)+32-45);
      vertex((x*60)+44-30, (y*90)+24-45);
      endShape();

      //lines that extend up from arches** and front edge of cubes on odd numbered rows
      line((x*60)+30, (y*90)+31, (x*60)+30, (y*90)+92);

      //lines that forms front edge of cube on even numbered rows
      line((x*60), (y*90)+75, (x*60), (y*90)+92);
    }
  }
}//end draw


