
void setup(){
  size(400,400);
background(255,255,255);
  smooth();
  
  //purple triangle
  stroke(255,255,255);
  fill(61,24,43);
  triangle(360,33,361,133,197,126); 
  
  

  
   //equilateral triangle
  noStroke();
  fill(202,109,105,200);
  triangle(315,100,205,286,75,102);
  
   
  
  //yellow circle
  stroke(230,233,105,150);
  fill(230,233,105,150);
  arc(125,125,350,350,0,HALF_PI);
  arc(125,125,350,350,HALF_PI,PI);
  arc(125,125,350,350,PI,HALF_PI+PI);
  arc(125,125,350,350,HALF_PI+PI,TWO_PI);
  

  noStroke();
  fill(35,89,113,150);
  triangle(43,336,149,338,54,173);

 //green quad
  noStroke();
  fill(143,217,94,160);
  quad(7,76,145,-20,229,91,74,193);
  
   //purple slanted rectangle
  noStroke();
  strokeWeight(0);
  fill(61,24,43);
  quad(26,-10, 258,322,220,340,-26,-10);
  
  //light blue circle
  noStroke();
  fill(212,245,245,200);
  arc(100,334,250,250,0,HALF_PI);
  arc(100,334,250,250,HALF_PI,PI);
  arc(100,334,250,250,PI,HALF_PI+PI);
  arc(100,334,250,250,HALF_PI+PI,TWO_PI);
  
   //top blue rectangle
  noStroke();
  strokeWeight(0);
  fill(35,89, 113,150);
  quad(0,45, 150, 45,150,72,0,72);
  
   
  
   //bottom blue rectangle
  noStroke();
  strokeWeight(0);
  fill(35,89, 113,150);
  quad(140,203,400,203,400,222,140,222);
 
  
   //orange rectangle
  noStroke();
  fill(248,152,61);
  quad(115, 183, 400,183,400,210,115,210);
  
    //pink circle
  noStroke();
  fill(202,109,105,200);
  arc(360,127,50,50,0,HALF_PI);
  arc(360,127,50,50,HALF_PI,PI);
  arc(360,127,50,50,PI,HALF_PI+PI);
  arc(360,127,50,50,HALF_PI+PI,TWO_PI);
  
  //small blue circle
  noStroke();
  fill(35,89, 113,100);
  arc(323,296,30,30,0,HALF_PI);
  arc(323,296,30,30,HALF_PI,PI);
  arc(323,296,30,30,PI,HALF_PI+PI);
  arc(323,296,30,30,HALF_PI+PI,TWO_PI);
  
   //black line
  stroke(0,0,0);
  strokeWeight(6);
  line(339,0,359,359);
  
  //black line
  stroke(0,0,0);
  strokeWeight(6);
  line(90,69,400,69);
  
 
    //pink rectangle
  stroke(202,109,105,150);
  strokeWeight(0);
  fill(202,109,105,200);
  quad(-2,33, 170, 33, 170, 55, -2, 55);
  
    //orange circle
  noStroke();
  fill(258,152,61,1500);
  arc(208,97,80,80,0,HALF_PI);
  arc(208,97,80,80,HALF_PI,PI);
  arc(208,97,80,80,PI,HALF_PI+PI);
  arc(208,97,80,80,HALF_PI+PI,TWO_PI);
  
     //little light blue circle
  noStroke();
  fill(212,245,245,200);
  arc(229,121,50,50,0,HALF_PI);
  arc(229,121,50,50,HALF_PI,PI);
  arc(229,121,50,50,PI,HALF_PI+PI);
  arc(229,121,50,50,HALF_PI+PI,TWO_PI);
  
  
  
  
}

