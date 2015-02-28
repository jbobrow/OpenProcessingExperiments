
void setup() {


  size(900, 504);
  
}



void draw () {
  //wef
  background(random(0,10));
  stroke(60);
  smooth();
  fill(0);
  line(mouseX, 250, 451, 251);

  //I copy code
  fill(255);
  rect(45,34, 100, 245);


  stroke(70);
  strokeWeight(random(32));
  fill(mouseX,mouseY, mouseY, 100);
  ellipse(250, 250, random(225), random(200));




  fill(145, 100);
  triangle(10, 100, random(1), random(2), 100, 100);



}

                
                
