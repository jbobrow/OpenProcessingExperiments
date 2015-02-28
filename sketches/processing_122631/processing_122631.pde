
void setup() {
  
 size (600,600);
}

void draw() {
    background (225);
  float sec = second();
  rectMode (CENTER);
  fill (0);
  rect (300,300,450+sec,450+sec);
    
  
  noStroke ();
  translate (50,50);
  rectMode( CORNER);
  fill (255);
    //großes rechteck
    rect ( 25,25, 450,450);
    fill( 0);
   //Mitte
    rect (25,300,225,1);
    rect (250, 300,1, -100);
    rect ( 250, 200, 225, 1);
    // Yang Farbe
    
 
    rect (25,300,225,175);
    rect (250,200,225,275);
    
    pushMatrix ();
    float min = minute (); 
     rectMode( CENTER);
    fill (0);
    rect ( 112.5,200,20+min,20+min);
    popMatrix();
    
    float h = hour ();

    rectMode (CENTER);
    fill (255);
    rect (362.5,300,20+h,20+h);
    
    if (min!= 15 && min !=30 && min != 30&& min!=45){
      fill (0);
      rect ( 112.5,200,20+min,20+min);

    }
    else {
    ellipse ( 112.5,200,20+min,20+min);
    }
    
  
    } 

