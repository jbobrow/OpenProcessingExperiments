
 int counter = 0;
 
 void setup()
 {
   size(400, 400);
   background (255);
   
   strokeWeight(10);
   stroke(255,0,0);
   line(0,0,400,400);
   
   strokeWeight(1);
   stroke(0,0,255);
   line(20,100,0,200);
   
   noStroke();
   fill(0,255,0);
   rect(50,50,40,40);
   
   ellipse(200,200,100,100);
   
   fill(#880F98);
   triangle(50,50,0,75,100,50);
   
   strokeWeight(10);
   stroke(#DB5C21);
   point(50,300);
   
   strokeWeight(1);
   quad(38,31,86,20,69,63,30,76);
   
   strokeWeight(1);
   arc(300,300,100,100,0,PI/2);
 }



