


void setup ()

{
  size (700, 500);
  background (255);
  
//rectangle group
  noStroke ();
  fill(245,196,0);
  rect (25, 75, 390, 260);//big one
  fill(167,217,227);
  rect (50, 50, 50, 50); //first top left
   fill(255);
  rect (50, 120, 50, 50);//white square
  fill(0); 
  rect (50, 200, 50, 100);





//first ellipse on the left (burnt orange)  
  noFill(); 
  strokeWeight (9); 
  stroke(203,75,0); 
  ellipse (75, 340, 50, 50 );
  
 
 
 
 
//All triangles
  noStroke ();
  fill (159,222,234); //blue 
  triangle (520, 200, 535, 75, 440, 200); 
  
//both yellow triangles
  fill (245,196,0); 
  triangle (450, 75, 525, 75, 430, 200);
  triangle (550, 75, 625, 75, 530, 200);
  
  
  
  
//2nd ellipse on the far right  
  fill(255);
  stroke(203,75,0);
  strokeWeight(20);
  ellipse ( 640, 165, 80, 80); 
  

//Quads
 stroke(255);
 fill(0);
  quad (500, 425,568,360,630,425,568,450);
  
  stroke(203, 75, 0);
  strokeWeight(10);
  noFill();
  quad(450, 400, 568, 350, 680, 400, 568,450);
  fill(255);
  stroke(159,222,234);
  quad(150, 210, 225,90, 300,210,  225,325);
  noStroke();
  fill(9,90,129);
  quad (170,210, 225,110, 280,210, 225,305);
  fill(203,75,0);
  quad (190,210, 225,130, 260,210, 225,295);
  
//line
strokeWeight(5);
stroke (255,102,0);
line(350,20,350,200);
line(500,20,500, 250);
stroke(0);
strokeWeight(6);
line(375,50,375,325);
line(550,50,550, 330);

//points
strokeWeight(15);
stroke(245,196,0);
point(200,450);
stroke(203,75,0);
point(350,400);
stroke(9,90,129);
point(500, 450);
strokeWeight(25);
point(639, 165);



 
  
}


