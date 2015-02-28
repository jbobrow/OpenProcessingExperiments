
void setup (){
  size (500,500);
  background (#E65F00);
}

void draw (){
  //cara
  fill (#FCD0B4);
    ellipse (250,250, 210,250);
  //ull esquerre
  //ull
  fill (#FFFFFF);
    ellipse (210,210, 50,35);
    //iris
      fill (#773525);
        ellipse (210,210, 25,25);
        //pupil·les
          fill (#000000);
            ellipse (210,210, 10,10);
  //ull dret
  //ull
  fill (#FFFFFF);
    ellipse (290,210, 50,35);
    //iris
      fill (#773525);
        ellipse (290,210, 25,25);
        //pupil·les
          fill (#000000);
            ellipse (290,210, 10,10);
  //nas
  line (265,230, 265,275);
  line (235,230, 235,275);
  noFill();
    arc (250,275, 30,30, 0, PI, OPEN);
  //boca
  fill (#000000);
    arc (250, 310, 100, 80, 0, PI, OPEN);
  //celles
  line (180,170, 230,180);
  line (320,170, 270,180);
  //barba
  fill (#67403A);
    triangle (220,360, 280,360, 250,400);
  //coordinació
  println(mouseX+","+ mouseY);
}


