
 int a = 175;
 int b = 150;
 int c = 125;
 int d = 100;
 int e = 75;
 int f = 25;
import processing.pdf.*;
 void setup(){
  
  size(550, 400, PDF, "glasses.pdf");
  noFill();
  
 }
 
 void draw(){
  line(50, 50, 480, 50);
  arc(50, 70, 40, 40, radians(180), radians(270));
  line(30, 70, 40, 70);
  line(40, 70, 40, 100);
  line(30, 100, 40, 100);
  arc(140, 100, 220 , 220, radians(0), radians(180));
  

  arc(390, 100, 220, 220, radians(0), radians(180));
  arc(480, 70, 40, 40, radians(270), radians(360));
  line(490, 70, 500, 70);
  line(490, 70, 490, 100);
  line(490, 100, 500, 100);
  arc(265, 100, 30, 30, radians(180), radians(360));
  
rect(55, 80 - 15 - 5, a , 13, 5);
  rect(55, 80, b, 15, 5);
  rect(55, 105, c, 15, 5);
  rect(65, 130, d, 15, 5);
  rect(75, 155, e, 15, 5);
  rect(98, 180, f, 15, 5); 

     rect(55 + 245, 80 - 15 - 5, a, 13, 5);
  rect(55 + 245, 80, b, 15, 5);
  rect(55 + 245, 105, c, 15, 5);
  rect(65 + 245, 130, d, 15, 5);
  rect(75 + 245, 155, e, 15, 5);
  rect(100 + 247, 180, f, 15, 5); 
println("Finished.");
exit();

 }
