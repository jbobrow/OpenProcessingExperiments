
void setup() {
  size(500, 500);
  background(250);
}

float count = 0;//variable that progresses lines and rectangles being drawn
float number = 425;//variable that establishes limit to which lines and rectangles are drawn to
float rectcount = 0;//variable that establishes amount of rectangles being drawn
float eStartX = random(400, 475);//variable that chooses the 'x' for circle at random between the listed coordinates 
float eStartY = random(400, 475);//variable that chooses the 'y' for circle at random between the listed coordinates
float circleW = random(25, 75);//variable for width of circle, random between listed parameters


float rect1;
float rectY;
float rect3;
float rect4;
float rect5;
float rect6;




void draw() {

  rect1 = floor(random(1, 100));
  rectY = floor(random(1, 400));
  rect3 = floor(random(101, 200));
  rect4 = floor(random(201, 300));
  rect5 = floor(random(301, 400));



  strokeWeight(1);
  if (count < number) {
    if (count %20 == 0) {//lines will be drawn at intervals of 25
      stroke(0);
      line(0, count, random(0, eStartX-(circleW/2)), count);
      line(count, 0, count, random(0, eStartY-(circleW/2)));
      //stroke(250);
      strokeWeight(2);
      line(100, 0, 100, height);
      line(200, 0, 200, height);
      line(300, 0, 300, height);
      line(400, 0, 400, height);

      if (rectcount < 100) {
        fill(250, 0, 0);
        rect(rect1, rectY, floor(random(10, 30)), floor(random(10, 150)));
      }
      if (rectcount > 100 && rectcount < 200) {
        fill(0, 250, 0);
        rect(rect3, rectY, floor(random(10, 28)), floor(random(10, 150)));
      }
      if (rectcount > 200 && rectcount < 300) {
        fill(0, 0, 250);
        rect(rect4, rectY, floor(random(10, 50)), floor(random(10, 150)));
      }
      if (rectcount > 300 && rectcount < 400) {
        fill(250, 0, 0);
        rect(rect5, rectY, floor(random(10, 70)), floor(random(10, 150)));
      }
    }
  }

  count++;
  rectcount++;
}


