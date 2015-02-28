
void setup()
{
   size(400,400);
   background(255, 255, 255);
   
   //Filled Quads
   fill(0,255,0);
   noStroke();
   quad(0,100, 0,130, 150,130, 150,100);   
   fill(255,5,255);
   noStroke();
   quad(300,130, 300,260, 400,260, 400,130);
   
   //Filled Rectangle
   fill(255,150,0);
   noStroke();
   rect(270, 100, 30, 30);
   fill(0,255,0);  
   rect(215, 240, 55, 20);
   
   //Filled Triangle
   fill(255,150,0);
   noStroke();
   triangle(0, 260, 150,400, 150,260);
   
   //Vertical Lines
   strokeWeight(5);
   stroke(0, 0, 0);
   line(30,0, 30, 400);
   line(150,0, 150, 400);
   line(215,0, 215, 400);
   line(270,0, 270, 400);
   line(300,0, 300, 400);
     
   //Horizontal Lines
   strokeWeight(5);
   line(0, 100, 400, 100);
   line(0, 130, 400, 130); 
   line(0, 170, 400, 170); 
   line(0, 240, 400, 240); 
   line(0, 260, 400, 260);
   line(0, 350, 400, 350);
   
   //Framing Triangles
   fill(255,255,255);
   strokeWeight(1);
   triangle(0,0, 0,200, 200,0); 
   triangle(0,200, 0,400, 200,400); 
   triangle(400,200, 200,400, 400,400); 
   triangle(200,0, 400,200, 400,0);
  
}


