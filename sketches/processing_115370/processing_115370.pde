
//Chun Yi Wu
// study "for"and"change number"

void setup() {
  size(600, 600);
  background(255); 
  smooth();
}
void draw() {
  background(255);
  //////
  if (mousePressed) {
    for (float x =5;x<width-40;x += 40) {
      for (float y = 5;y<height-40; y +=40) {


        fill((x+y)/3,(mouseX+mouseY)/10, (mouseX+mouseY)/2 );
        noStroke();
       arc(x+30, y+30, 30, 30,radians(60),radians(310));
       fill(0);
       stroke(255);
       strokeWeight(1);
       ellipse(x+28,y+22,3,3);
      }
    }
    
    
    
  }
  ////
  else {
    for (float x =5;x<width-40;x += 40) {
      for (float y = 5;y<height-40; y +=40) {


        fill((mouseX+mouseY)/2, (mouseX+mouseY)/7, (x+y)/10);
        noStroke();
        arc(x+30, y+30, 30, 30,radians(20),radians(340));
        fill(0);
       stroke(255);
       strokeWeight(1);
       ellipse(x+32,y+22,3,3);
      }
    }
  }
}



