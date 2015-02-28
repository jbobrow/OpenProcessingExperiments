
void setup(){
  size(800,800);      //size of window
}

void draw (){
  background(255);    //background color
  smooth();           //Antialiasing
  rectMode(CENTER);   //Set rect pivot

  if ( mousePressed && ( mouseButton == LEFT ) ) {
    stroke(0);
    fill ( mouseX/2 , pmouseY/4, mouseX/4 );
    // Draw a line from previous mouse location to current mouse location.
    ellipse( mouseX, mouseY, mouseX/2, mouseY/2 );
    fill (0);
  }
  if ( mousePressed && ( mouseButton == RIGHT ) ) {
    
  }
  //  arms objects
  strokeWeight ( 4 ) ;
  line (mouseX- 20 , mouseY ,mouseX- 60 , mouseY + 40 ) ;  //  left arm
  line (mouseX+ 20 , mouseY ,mouseX+ 60 , mouseY + 40 ) ;  //  right arm
  //leg objects
  line (mouseX- 20 , mouseY + 60 ,mouseX- 20 , mouseY + 100 ) ;  //  left leg
  line(mouseX+ 20 , mouseY + 60 ,mouseX+ 20, mouseY + 100 ) ;  //  right leg
  strokeWeight( 1 ) ;
  fill( 187 ) ;
  ellipse(mouseX - 20 , mouseY + 80 , 20 , 20 ) ;  //  left plate
  ellipse(mouseX+ 20 , mouseY + 80 , 20 , 20 ) ;  //  right plate
  rect(mouseX- 20 , mouseY + 100 , 20 , 10 ) ;
  rect(mouseX + 20 , mouseY + 100 , 20 , 10 ); 
  //  body object
  fill(187);          //  COLOR 1 for Char
  rect( mouseX, mouseY + 30 , 40 , 60 ) ;  //  body
  //  neck object
  strokeWeight( 4 ) ;
  line(mouseX, mouseY - 20 ,mouseX, mouseY ) ;  //neck
  //  head objects
  strokeWeight( 1 ) ;
  fill( 187 ) ;                                                    //COLOR 1 for Char
  stroke( 0 ) ;
  rect(mouseX, mouseY -70 , 80 , 60 ) ;
  fill( 250 , 215 , 199 ) ;                                            //SKIN for Char
  rect(mouseX, mouseY - 30 , 70 , 20 ) ;
  fill( 60 ) ;                                                     //eye color
  rect(mouseX+ 20 , mouseY - 60 , 20 , 20 ) ;                            //right eye
  rect(mouseX- 20 , mouseY - 60 , 20 , 20 ) ;                            //left eye
  noStroke() ;                                                   //stop stroke for eye
  fill( 245 ) ;                                                    //sclera color
  rect(mouseX+ 20 , mouseY - 60 , 10 , 10 ) ;                            //right sclera
  rect(mouseX- 20 , mouseY - 60 , 10 , 10 ) ;                            //left sclera
  fill( 237 , 50 , 50 ) ;                                              //pupil color
  rect(mouseX+ 20 , mouseY - 60 , 5 , 5 ) ;                              //right pupil
  rect(mouseX- 20 , mouseY - 60 , 5 , 5 ) ;                              //left pupil
  fill( 0 ) ;                                                      //Black
  stroke( 0 ) ;                                                    //stroke back to normal
  rect(mouseX, mouseY - 36 , 20 , 5 ) ;                             //mouth
  line(mouseX+ 30 , mouseY - 85 ,mouseX+ 10 , mouseY - 75 ) ;            //right eyebrow
  line(mouseX- 30 , mouseY - 85 ,mouseX- 10 , mouseY - 75 ) ;            //left eyebrow
  fill( 235 ) ;
  triangle(mouseX+ 10 , mouseY - 100 ,mouseX- 10 , mouseY - 100 ,mouseX, mouseY - 130 ) ;
  triangle(mouseX- 30 , mouseY - 100 ,mouseX- 20 , mouseY - 100 ,mouseX- 25 , mouseY - 110 ) ;
  triangle(mouseX+ 20 , mouseY - 100 ,mouseX+ 30 , mouseY - 100 ,mouseX+ 25 , mouseY - 110 ) ;
  //  beard
  fill( 126 , 92 , 70 ) ;
  noStroke();
  rect(mouseX+ 30 , mouseY - 30 , 10 , 20 ) ;
  rect(mouseX- 30 , mouseY - 30 , 10 , 20 ) ;
  rect(mouseX+ 12 , mouseY - 30 , 5 , 20 ) ;
  rect(mouseX- 12 , mouseY - 30 , 5 , 20 ) ;
  rect(mouseX, mouseY - 20 , 70 , 10 ) ;
  ellipse(mouseX, mouseY - 23 , 40 , 15 ) ;
  ellipse(mouseX, mouseY - 13 , 70 , 25 ) ;
  ellipse(mouseX, mouseY - 3 , 60 , 25 ) ;
  ellipse(mouseX, mouseY + 7 , 40 , 20 ) ;
  ellipse(mouseX, mouseY + 12 , 25 , 20 ) ;
  stroke( 0 ) ;  
}

