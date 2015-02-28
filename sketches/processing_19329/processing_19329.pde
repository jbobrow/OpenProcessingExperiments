
/* Assignment 3.2 _ Drawing Machine Mock-up
    Wylie Robinson _ Srping 2011
    
    The machine begins by drawing two ellipses with center points at the 1/4
    and 3/4 width points. The height (max = height/1.5) and width (max = 
    width/2.5) of the elipse are based on random variables. Each time the
    user presses the mouse a new ellipse is drawn. If the second in which
    the user click the mouse is an even number then the ellipse is drawn
    on the left side of the sketch but if the second is odd then it is drawn
    on the right side.*/

void setup (){
  size (500,300);
  background (255);
  smooth ();
  ellipseMode(CENTER);    //OG Circles
  fill(255);
  ellipse(width/4,height/2,random(width/4),random(height/2));
  fill(0);
  ellipse(3*width/4,height/2,random(width/4),random(height/2));
}

void draw (){
  if (mousePressed == true){    //User clicks the mouse
    if (second()%2<=0){    //if second is even draw left
      fill(random(200));
      ellipse(width/4,height/2,random(width/2.5),random(height/1.5));
    } else {    //if second is odd draw right
      fill(random(200));
      ellipse(3*width/4,height/2,random(width/2.5),random(height/1.5));
    }
  }
}
  


