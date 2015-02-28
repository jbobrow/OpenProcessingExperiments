
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
  // drawn the lama
  lama (mouseX,mouseY,color(255,21,90));
}

/* make the lama a function with first the x position 
 then the y position and then the color of the hat*/
void lama ( int x_position, int y_position,color c) {
  fill(255,153,0);

  // ellipse in center mode
  ellipseMode(CENTER);

  //neck and head
  rect(x_position-30,y_position-40,10,40);
  ellipse(x_position-33,y_position-40,30,15);

  // body
  ellipse(x_position,y_position,60,50);

  //legs
  line(x_position-15,y_position+10,x_position-20,y_position+50);
  line(x_position-10,y_position+23,x_position,y_position+50);
  line(x_position+10,y_position+10,x_position+13,y_position+50);
  line(x_position+15,y_position+21,x_position+23,y_position+50);

  //tail
  line(x_position+30,y_position,x_position+45,y_position+5);
  line(x_position+38,y_position+3,x_position+44,y_position+2);
  line(x_position+37,y_position+3,x_position+42,y_position+8);

  //eye
  fill(x_position+75,y_position+75,20);
  ellipse(x_position-28,y_position-42,3,6);

  //when the mouse is pressed
  if(mousePressed) {
    //hoedje
    fill(c);
    triangle(x_position-35,y_position-46,x_position-25,y_position-60,x_position-17,y_position-42);
  }
}
                
                
