
void setup () {
  size(300,300);
}

void draw(){
  //Background
  smooth();
  noStroke();
  fill(mouseY, mouseY, 100);
  rect (0,0,300,300);
  
 //Regulating Line
  fill(0);
  rect(0,200,mouseY,25 );

  //Constant Rectangle
  fill(16,16,60);
  rect(200, 0, 75, height);
  
  //Main Regulating line
  stroke(0);
  strokeWeight(2);
  line(50,0,50, mouseY);
  
  //Secondary regulating lines
  stroke(0);
  strokeWeight(1);
  line(75,0,75,mouseY);
  
   stroke(0);
  strokeWeight(1);
  line(25,0,25,mouseY);

  stroke(255,255,255);
 line( 25, 300, 25, mouseY);
 
  stroke(255,255,255);
 line( 75, 300, 75, mouseY);
 
 strokeWeight(3);
  stroke(255,255,255);
 line( 50, 300, 50, mouseY);
 
  strokeWeight(3);
  stroke(255,255,255);
 line(0, 250, mouseY, 250);
 
   strokeWeight(3);
  stroke(255,255,mouseY);
 line(300, 250, mouseY, 250);
 
   
   //First main circle
  stroke(1);
     fill(255,255,mouseY);
  ellipse(50, mouseY, 150,150); 
  noStroke();
  fill(255,255,255);
  ellipse(50, mouseY, 50,50);
  
  //Second main circle
  fill(255,255,width);
  ellipse(mouseY, 250, 75,75);

}

