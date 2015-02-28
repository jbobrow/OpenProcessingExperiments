
void setup() {
  size(800,600);
  background(255);
}
 
void draw() {
  noStroke();
  fill(#B6EDAA,3);
  rect(10,10,380,280);
  rect(30,30,340,240);
  rect(50,50,300,200);
  rect(70,70,260,160);
  rect(410,10,380,280);
  rect(430,30,340,240);
  rect(450,50,300,200);
  rect(470,70,260,160);
  rect(10,310,380,280);
  rect(30,330,340,240);
  rect(50,350,300,200);
  rect(70,370,260,160);
  rect(410,310,380,280);
  rect(430,330,340,240);
  rect(450,350,300,200);
  rect(470,370,260,160);
  
  
 
 
  
  //noFill();
  stroke(#030A71);
  strokeWeight(random(1, 15));
  line(0, random(height), width, random(height));
 

}


