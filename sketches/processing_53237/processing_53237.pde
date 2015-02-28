


	
void setup() {
  size(600,400);
  background(180);
  
}

void draw() {
  //draw handle
  fill(72,39,4);
  quad(130,135,190,190,240,300,50,300);
  
 //draw gun frame 
  stroke(0);
  fill(0);
  rect(200,100,125,50);
  rect(200,100,300,40);
  rect(480,90,20,10);
  quad(130,135,180,168,190,190,103,190);
  
  ellipseMode(CENTER);
  ellipse(200,150,150,100);
   
   //create gap
  fill(180);
  stroke(0);
  arc(205,150,100,60,0,PI/2);
  
  //hammer
   fill(0);
   stroke(0);
   quad(120,110,140,100,150,150,140,140);
   //draw over arc fill
   ellipse(200,150,75,50);
  //println("Down the barrel of a Gun");
}





