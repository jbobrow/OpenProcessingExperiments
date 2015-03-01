
void draw ();
size (500,500);
background (200)
if mousePressed {

strokeWeight (8);
line (75,250,125,150);
line (125,150,175,250);
line (325,250,375,150);
line (375,150,425,250);
strokeWeight (4);
fill (250,203,203);
ellipse (100,300,150,50);
ellipse (400,300,150,50);
strokeWeight (8);
line (150,375,350,375)
int counter;


void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
