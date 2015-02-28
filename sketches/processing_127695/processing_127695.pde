
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white

}

void draw() {  //draw function loops 
  background(255);
  line (mouseX +50, mouseY +50, mouseX +10, mouseY +10) ;
fill (0,0,0) ;
ellipse(mouseX +50, mouseY +50, 80, 80);
fill (255, 0,0) ;
 ellipse (mouseX,mouseY,20,10); 

  
  if(mousePressed == true) { //add some interaction
  
   ellipse (mouseX +30,mouseY +30, 150,150) ;
   fill (220,10,0) ;
   ellipse (mouseX +30, mouseY +30, 100,100) ;
  }
  
textSize(32);
text("BOOM", 10, 30); 
fill(0, 102, 153);
text("word", 10, 60);

  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
