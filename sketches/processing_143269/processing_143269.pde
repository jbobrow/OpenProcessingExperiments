
void setup (){
  size(300, 300);
  noLoop();
  noStroke();
  background(0,0,0);
}

// Modeled after artwork by: Nadir Afonso

void draw(){
  fill();
  arcstart = (PI);
  arcend = (PI*1.5);
  arcpivot = (PI/11);
  
// line sequence
  
  stroke(8,160,138);
  line(0,15 , 300,15);
  line(0,10 , 300,10);
  line(0,285 , 300, 285);
  line(0,290 , 300, 290);
  noStroke();
 
// background quad/triangle sequence
  fill(137,0,0);
  
  // left quads
  quad(50,75 , 75,100 , 0,150 , 0,150); 
  quad(0,150 , 50,225 , 75, 200 , 0,150);
  quad(100,75 , 125,100 , 50,150 , 50,150);
  quad(50,150 , 100,225 , 125, 200 , 50,150);
  // right quads
  quad(225,200 , 250,225 , 300,150 , 300,150); 
  quad(300,150 , 250,75 , 225, 100 , 300,150);
  quad(175,200 , 200,225 , 250,150 , 250,150); 
  quad(250,150 , 200,75 , 175, 100 , 250,150);
  // middle triangles
  triangle(150,50, 125,150 , 175,150);
  triangle(150,250, 125,150 , 175,150);
  
  fill();

 // ellipse/arc sequence(top)
  ellipse(25,50 , 50, 50);
  fill(0,0,0);
  arc(25,50 , 52, 52 , arcstart, arcend );
  fill();
  
  ellipse(75,50 , 50, 50);
  fill(0,0,0);
  arc(75,50 , 52, 52 , arcstart+arcpivot, arcend+arcpivot);
  fill();
  
  ellipse(125,50 , 50, 50);
  fill(0,0,0);
  arc(125,50 , 52, 52 , arcstart+2*arcpivot, arcend+2*arcpivot);
  fill();
  
  ellipse(175,50 , 50, 50);
  fill(0,0,0);
  arc(175,50 , 52, 52 , arcstart+3*arcpivot, arcend+3*arcpivot);
  fill();
  
  ellipse(225,50 , 50, 50);
  fill(0,0,0);
  arc(225,50 , 52, 52 , arcstart+4*arcpivot, arcend+4*arcpivot);
  fill();
  
  ellipse(275,50 , 50, 50);
  fill(0,0,0);
  arc(275,50 , 52, 52 , arcstart+5*arcpivot, arcend+5*arcpivot);
  fill();
  
  
// triangle sequence
  triangle(100,100 , 150,100 , 150,150);
  triangle(100,100 , 100,150 , 50,150);
  triangle(50,150 , 50,100 , 0,100);
  
  triangle(150,150 , 150,200 , 200,200);
  triangle(200,200 , 200,150 , 250,150);
  triangle(250,150 , 250,200 , 300,200);
  
  stroke(0);
  triangle(150,100 , 150,150 , 100,150); // top overlap
  triangle(150,150 , 200,150 , 150,200); // bottom overlap
  noStroke();
  
  // squares
  fill(0);
  stroke(255);
  rect(117,105 , 12 , 12);
  rect(105,117 , 12 , 12);
  rect(170,180 , 12 , 12);
  rect(182,168 , 12 , 12);
  noStroke();
  fill();

  
// ellipse/arc sequence(bottom)
  ellipse(25,250 , 50, 50);
  fill(0,0,0);
  arc(25,250 , 52, 52 , arcstart/2, arcend/1.5);
  fill();
  
  ellipse(75,250 , 50, 50);
  fill(0,0,0);
  arc(75,250 , 52, 52 , arcstart/2-arcpivot, arcend/1.5-arcpivot);
  fill();
  
  ellipse(125,250 , 50, 50);
  fill(0,0,0);
  arc(125,250 , 52, 52 , arcstart/2-2*arcpivot, arcend/1.5-2*arcpivot);
  fill();
  
  ellipse(175,250 , 50, 50);
  fill(0,0,0);
  arc(175,250 , 52, 52 , arcstart/2-3*arcpivot, arcend/1.5-3*arcpivot);
  fill();
  
  ellipse(225,250 , 50, 50);
  fill(0,0,0);
  arc(225,250 , 52, 52 , arcstart/2-4*arcpivot, arcend/1.5-4*arcpivot);
  fill();
  
  ellipse(275,250 , 50, 50);
  fill(0,0,0);
  arc(275,250 , 52, 52 , arcstart/2-5*arcpivot, arcend/1.5-5*arcpivot);
  fill();


}



