
void setup()
{
  size(850,1000);
  background(224,213,213);
}

void draw()
{
  //eyeball
  stroke(234,230,230);
fill(234,230,230);
ellipse(width*1/2,height*1/3,400,450);
  ellipseMode(CENTER);
  
  stroke(0);
fill(0);
ellipse(width*1/2,height*1/3,200,250);
  ellipseMode(CENTER);
  
  //blood
  //innermost blood drip
  stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(20);
  fill(144,6,10);
  line(width*.52,height*.34, 425,750);
  
   stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(10);
  fill(144,6,10);
  line(width*.52,height*.34, 425,800);
  
  stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(7);
  fill(144,6,10);
  line(width*.52,height*.34, 425,850);
  
    stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(3);
  fill(144,6,10);
  line(width*.52,height*.34, 425,900);
  
  //middle blood drip
    stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(12);
  fill(144,6,10);
  line(width*.55,height*.36, 450,920);
  
      stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(20);
  fill(144,6,10);
  line(width*.55,height*.36, 450,850);
  
        stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(25);
  fill(144,6,10);
  line(width*.55,height*.36, 450,800);
  
          stroke(144,6,10);
  strokeCap(ROUND);
  strokeWeight(35);
  fill(144,6,10);
  line(width*.55,height*.36, 450,700);
  
  //outermost blood drip
 stroke(144,6,10);
  fill(144,6,10);
  strokeWeight(15);
  strokeCap(ROUND);
  line(width*.6,height*.35,500,1000);
  
  stroke(144,6,10);
  fill(144,6,10);
  strokeWeight(25);
  strokeCap(ROUND);
  line(width*.6,height*.35,500,950);
  
   stroke(144,6,10);
  fill(144,6,10);
  strokeWeight(45);
  strokeCap(ROUND);
  line(width*.6,height*.375,500,800);
  
  
  //blade
  stroke(52);
  fill(52);
  strokeCap(SQUARE);
  strokeWeight(40);
  line (width*1/2, height*1/3,1000,425);
  
  stroke(111);
  fill(111);
  strokeCap(SQUARE);
  strokeWeight(20);
  line (width*1/2, height*1/3,1000,425);
  
   stroke(255);
  fill(255);
  strokeCap(SQUARE);
  strokeWeight(2.5);
  line (width*1/2, height*1/3,1000,425);
  
  
}
