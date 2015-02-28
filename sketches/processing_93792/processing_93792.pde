
//variables
int x; //center of canvas
int y; //center of canvas
int eyeSize=14; //(12)

int dx; //fly
int dy; //fly

void setup() {
  size(300, 200); //(200,200)
  smooth();
  x=width/2; //setting the variables after size has been declared
  y=height/2; //setting the variables after size has been declared
}

void draw() {
  background(#bbbbbb);
  //background(mouseX*0.2);
  //stroke(#bbbbbb);
  noStroke();
  fill(#EDE0C4); //brown body fill

  beginShape(); //snout
  vertex(x-40, y-40); //under chin //(60,60)
  vertex(x-60, y-30); //(40,70)
  vertex(x-84, y-28); //(16,72)
  vertex(x-90, y-38); //(10,68)
  vertex(x-91, y-42); //(9,58)
  vertex(x-86, y-46); //(14,54)
  vertex(x-54, y-74); //(46,26)
  vertex(x-30, y-82); //tangent to ear //(70,18)
  vertex(x-22, y-80); //tangent to ear //(78,20)

  vertex(x+16, y-20); //back //(116,80)
  vertex(x+34, y-4); //(134,96)
  vertex(x+64, y+40); //matches start of tail //(164,140)
  vertex(x+64, y+80); //(164,180)

  vertex(x+40, y+90); //rump //(140,190)
  vertex(x-10, y+50); //(90,150)
  vertex(x-20, y+10); //(80,110)
  vertex(x-30, y-24); //(70,76)
  endShape(CLOSE);

  //noStroke(); //nose has no stroke
  fill(0, 0, 0, 180); //black nose, slightly transparent

  ellipse(x-89, y-40, 9, 9); //nose //(11,60,9,9)

  fill(#EDE0C4); //return brown body fill for tail
  //stroke(#bbbbbb); //return stroke




  //if the mouse is pressed and the mouse is in the right-hand third,
  //make the tail move right

  if (mousePressed==true&&mouseX>width/2) {
    beginShape(); //tail RIGHT
    vertex(x+62, y+40); //matches back //(164,140)
    vertex(x+82, y+10); //(182,110)
    vertex(x+98, y-30); //(180,70)
    vertex(x+103, y-32); //(184,68)
    vertex(x+88, y+8); //(188,108)
    vertex(x+64, y+80); //(164,180)
    endShape();
  } 
  else if (mousePressed==true&&mouseX<=width/2) {
    beginShape(); //tail LEFT
    vertex(x+60, y+40); //matches back //(164,140)
    vertex(x+73, y+10); //(182,110)
    vertex(x+53, y-28); //(180,70)
    vertex(x+56, y-32); //(184,68)
    vertex(x+79, y+8); //(188,108)
    vertex(x+64, y+80); //(164,180)
    endShape();
  }
  else {
    beginShape(); //tail
    vertex(x+62, y+40); //matches back //(164,140)
    vertex(x+82, y+10); //(182,110)
    vertex(x+80, y-30); //(180,70)
    vertex(x+84, y-32); //(184,68)
    vertex(x+88, y+8); //(188,108)
    vertex(x+64, y+80); //(164,180)
    endShape();
  }


  fill(#493418); //set ear to a brown fill
  noStroke();

  ellipse(x-30, y-68, 28, 28); //ear top //(70,32,28,28)

  beginShape(); //ear bottom
  vertex(x-44, y-68); //(56,32)
  vertex(x-36, y-24); //(64,76)
  vertex(x-24, y-24); //(76,76)
  vertex(x-16, y-68); //(84,32)
  endShape();

  fill(#ffffff);
  ellipse(x-56, y-60, eyeSize, eyeSize); //eyeball (44,40,12,12)
  fill(#000000);
  float offsetIris = map(mouseX, 0, width, -1, 2);
  ellipse(x-57+offsetIris, y-60, eyeSize*0.583, eyeSize*0.583); //iris (43,40,7,7)
  //ellipse(x-57, y-60, eyeSize*0.583, eyeSize*0.583); //iris (43,40,7,7)
  fill(#ffffff);

  float offset = map(mouseX, 0, width, -1, 2);
  ellipse(x-58+offset, y-61, eyeSize/6, eyeSize/6); //glint (42,39,2,2)
  //ellipse(x-58, y-61, eyeSize/6, eyeSize/6); //glint (42,39,2,2)
  fill(#EDE0C4); //set body back to a light-brown fill
  stroke(#cccccc); //return stroke, a bit darker (foreground elements)

  ellipse(x+40, y+60, 62, 62); //rump (140,160,62,62)

  beginShape(); //back leg
  vertex(x+40, y+91); //(140,191)
  vertex(x+2, y+91); //(102,191)
  vertex(x+2, y+81); //(102,181)
  vertex(x+30, y+81); //(130,181)
  endShape();

  beginShape(); //front leg
  vertex(x-18, y); //(82,100)
  vertex(x-18, y+91); //(82,191)
  vertex(x-8, y+91); //(92,191)
  vertex(x-8, y+24); //(92,124)
  vertex(x, y); //(100,100)
  endShape();

  //fly
  float easing= 0.08;
  float targetX = mouseX;
  dx+= (targetX-dx)*easing;
  float targetY = mouseY;
  dy+= (targetY-dy)*easing;
  fill(0);
  noStroke();
  ellipse(dx, dy, 8, 3); // fly body
  fill(0, 130);
  ellipse(dx, dy, 5, 8); //fly wings
}



