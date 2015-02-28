
/*sketch for lama that moves with your mouse, 
 the eye colour changes for the position 
 and if you click a head apears*/

void setup () {
  // size window
  size(200,200);
}

void draw () {
  // blue background and colour for fill
  background(120,50,255);
  // drawn the lama with r 
  lama (mouseX,mouseY,45,color(255,21,90),2);
}

/* make the lama a function with first the x position 
 then the y position the rotation of the hat which isn't working properly jet
 , the color of the hat and the scale*/
void lama ( int x_position, int y_position, int r, color c, float s) {
  fill(255,153,0);

  // ellipse in center mode
  ellipseMode(CENTER);

  //neck and head
  rect(x_position-30*s,y_position-40*s,10*s,40*s);
  ellipse(x_position-33*s,y_position-40*s,30*s,15*s);

  // body
  ellipse(x_position,y_position,60*s,50*s);

  //legs
  line(x_position-15*s,y_position+10*s,x_position-20*s,y_position+50*s);
  line(x_position-10*s,y_position+23*s,x_position,y_position+50*s);
  line(x_position+10*s,y_position+10*s,x_position+13*s,y_position+50*s);
  line(x_position+15*s,y_position+21*s,x_position+23*s,y_position+50*s);

  //tail
  line(x_position+30*s,y_position,x_position+45*s,y_position+5*s);
  line(x_position+38*s,y_position+3*s,x_position+44*s,y_position+2*s);
  line(x_position+37*s,y_position+3*s,x_position+42*s,y_position+8*s);

  //eye
  fill(x_position+75,y_position+75,20);
  ellipse(x_position-28*s,y_position-42*s,3*s,6*s);

  //when the mouse is pressed
  if(mousePressed) {
    //hoedje
    fill(c);
    rotate(radians(r));
    triangle(x_position-35*s,y_position-46*s,x_position-25*s,y_position-60*s,x_position-17*s,y_position-42*s);
  }
}


                
                
