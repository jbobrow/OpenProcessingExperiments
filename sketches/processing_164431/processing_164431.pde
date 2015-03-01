
void setup () {
  size(1100, 700);
 background(#343030);
}

void draw() {
 noStroke();

  

  
     fill(300+ 300*cos(frameCount*(.028)),  300+100*sin(frameCount*(.024)),0); 
  // fill(0,300+100*sin(frameCount*(.06)),300+ 300*cos(frameCount*(.07))); //switches the colors' sides
  ellipse( 550+ 500*cos(frameCount*(.028)),  400+ 250*sin(frameCount*(.024)),10,10  );
}

void keyPressed() {
  saveFrame();
}




