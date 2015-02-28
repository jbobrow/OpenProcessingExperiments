
float x = 190;
float x1 = 290;
void setup(){
  size(500,500);
}

void draw() {
  background(#3FD6B1);
  //body
    fill(#973DC9) ; 
  ellipse(250,270,400,430) ;
  //Right Arm
   fill(#973DC9) ; 
  ellipse(410,191,90,90);
    fill(#973DC9) ; 
  ellipse(415,236,90,90);
  fill(#973DC9) ; 
  ellipse(420,281,90,90);
  fill(#973DC9) ; 
  ellipse(425,326,90,90);
  fill(#973DC9) ; 
  ellipse(420,371,90,90);
   fill(#973DC9) ; 
  ellipse(415,416,90,90);
   fill(#973DC9) ; 
  ellipse(415,461,90,70);
 //Left Arm
   fill(#973DC9) ; 
  ellipse(94,191,90,90);
    fill(#973DC9) ; 
  ellipse(89,236,90,90);
  fill(#973DC9) ; 
  ellipse(85,281,90,90);
  fill(#973DC9) ; 
  ellipse(80,326,90,90);
  fill(#973DC9) ; 
  ellipse(85,371,90,90);
   fill(#973DC9) ; 
  ellipse(90,416,90,90);
   fill(#973DC9) ; 
  ellipse(90,461,90,70);
 //fingers front right
 fill(255);
 triangle(443,484,453,479,453,498);
 fill(255);
 triangle(383,484,393,489,380,498);
//fingers front left
 fill(255);
 triangle(54,482,64,488,57,498);
 fill(255);
 triangle(114,488,124,482,124,498);
  // Head
  fill(#973DC9) ; 
  ellipse(250,170,190,160) ;
  //eyes
  fill(255) ; 
  ellipse(200,158,50,40) ; 
  fill(255) ; 
  ellipse(300,158,50,40) ;
  //Iris
  fill(#C98C3D) ; 
  ellipse(x,158,20,35) ; 
  fill(#C98C3D) ; 
  ellipse(x1,158,20,35) ;
  //Pupil
   fill(0) ; 
  ellipse(x,158,10,15) ; 
  fill(0) ; 
  ellipse(x1,158,10,15) ;
 // eye tweak
  //left
  x = x + 0.1 ;
  if (x > 210) {
   x = 190 ;
  }
  //right
  x1 = x1 + 0.1 ;
  if (x1 > 310) {
   x1 = 290 ;
  } 
  //mouth
  fill(#6A178E);
  ellipse(250,210,105,random(35,44)) ; 
  fill(0) ;
  ellipse(250,210,100,random(40)) ;
  
  /*tooth
  fill(255);
  triangle(250,188,270,189,260,220);
  fill(255,0,0);
  triangle(257,207,265,206,260,220);
  */
  //nose
  fill(0);
  ellipse(247,168,3,10);
   fill(0);
  ellipse(253,168,3,10);
 
  println(mouseX + "," + mouseY) ; 
}


