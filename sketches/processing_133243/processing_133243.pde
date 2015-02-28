
import processing.pdf.*;

void setup(){
  size(450, 200, PDF, "handles.pdf");
//size(450, 200);

  noFill();
}
void draw(){
  line(20, 20, 300, 20);
  line(10, 25, 10, 55);
  line(20, 60, 270, 60);
  smooth();
  arc(300, 90, 140, 140, radians(270), radians(360));//outter arc
  arc(300, 90, 140, 140, radians(0), radians(50));
 arc(330, 105, 80, 80, radians(65), radians(125)); //bottom arc
  arc(320, 128, 30, 30, radians(140), radians(330)); //ball arc 

  arc(300, 100, 100, 100, radians(230), radians(360));
  arc(300, 100, 101, 60, radians(0), radians(45));
  line(20, 20, 20, 25);
  line(20, 25, 10, 25);
  line(10, 56, 20, 56);
  line(20, 56, 20, 60);
   println("Finished.");
  exit();
}
