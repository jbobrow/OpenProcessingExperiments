
void setup(){
size (500, 500);
smooth();
background (0);
}

void draw () {
  
  //Ausfedeln
  fill (0, 5);
  rect(width/2, height/2, width, height);
  
  noFill();
  translate (width/2, height/2);

  //Sekunden
    for(int i=0; i<100; i++){ 
    pushMatrix ();
    rotate(radians(second()*6)-45);
    fill (0, 0, 0, 50);
    strokeWeight (3);
    stroke (255, 255, 255, 20);
    ellipse (125, 0, 250, 50);
    popMatrix ();
  }
  
  
  //Minuten
  for(int i=0; i<minute(); i++){
    pushMatrix();
    rectMode(CENTER);
    strokeWeight (1);
    stroke(115, 112, 206);
    noFill();
    rotate(radians(0));
    rect(0,0,2+i*8,2+i*8);
    popMatrix();
  }
  
  
  //Stunden
  for(int i=0; i<hour(); i+=20){
    pushMatrix();
    noFill();
    stroke (250);
    fill(50,121,103,15);
    ellipse (0, 0, hour()*4, hour()*4);
    popMatrix();
  }
  
}
