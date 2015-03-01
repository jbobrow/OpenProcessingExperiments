
void setup() {
//translate (300,300);
  size(600, 600);
  background(255);
}

void draw() {
 translate (300,300);
   
   
  
rotate(frameCount / 20.0);

   fill (0);
 ellipse(0,0,270,300);

   fill (255);
 ellipse(0,0,250,270);   
 fill (0);
 ellipse(0,0,230,250);




 if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
//fill (255);
 ellipse (0,0,100,100);
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
// fill (255);
 ellipse (0,0,100,50);
 
  fill (0);
 ellipse(0,0,50,50);
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
 //fill (255);
 ellipse (0,0,20,20);


 


 
}




