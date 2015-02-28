
///////////////////////////////////////////////////
// ASH                                           //  
// This is a strand of pacman's DNA              //
//////////////////////////////////////////////////

void setup(){
  size(475,250);
  background(200);
 fill(255,230,80);
smooth();
  translate(30,30);

//frieze pattern
  pushMatrix();
  for(int i=0; i<10; i++){
    pushMatrix();
    pacmansDNA();
    translate(0,60);
    scale(1,-1);
    pacmansDNA();
    translate(40,0);
    scale(-1,1);
    pacmansDNA();
    translate(0,60);
    scale(1,-1);
    pacmansDNA();
    popMatrix();
    translate(40,0);

  }
  popMatrix();
 
  translate(0,80);
 
}
 //the pac man shape
void pacmansDNA(){
ellipse(0,0,30,30);
ellipse(5,5,5,5);
ellipse(5,5,2,2);
ellipse(5,5,1,1);
ellipse(5,5,3,3);
line(30,15,5,5);
line(15,30,10,10);
  endShape();
}

// for some reason the last two pac mans are looking the opposite way?
                                                
