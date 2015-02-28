
void setup(){
size (500, 500);
smooth();
}

void draw () {

  background (150);
  stroke (0);
  
  translate (width/2, height/2);
  
  fill (255);
  ellipse (0, 0, 450, 450);
  
  noFill ();
  rectMode (CENTER);
  strokeWeight(20);
  ellipse (0, 0, 450, 450);
  
  fill (255);
  
  //Loops
  
  //Linien schmal
  for (int i=0; i<360; i+=30){ 
    pushMatrix ();
    strokeWeight(2);
    rotate (radians(i) ); 
    translate (0, 195);
    line (0, 0, 0, 25);
    popMatrix ();
    println (i);
  }
  
  //Linien dick
    for (int i=0; i<360; i+=90){ 
    pushMatrix ();
    strokeWeight(3);
    rotate (radians(i) ); 
    translate (0, 180);
    line (0, 0, 0, 40);
    popMatrix ();
    println (i);
  }
  
 
  
  //Zeiger Stunde
  pushMatrix();
  strokeWeight(5);
  stroke (0);
  rotate(radians(hour()*30)-210);
  line (0, 0, 0, 150);
  popMatrix();
  
  //Zeiger Minute
  pushMatrix();
  strokeWeight(7);
  stroke (0);
  rotate (radians (6*minute()-180));
  line (0, 0, 0, 200);
  popMatrix();
  
  //Zeiger Sekunde
  pushMatrix();
  strokeWeight(2);
  stroke (255, 0, 0);
  rotate (radians (6*second()-170));
  line (-5, -30, 40, 200);
  popMatrix();
  
  strokeWeight(0);
  noStroke ();
  fill (255, 0, 0);
  ellipse (0, 0, 20, 20);
  
}
