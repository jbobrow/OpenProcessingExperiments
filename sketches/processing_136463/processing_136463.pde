
color Green = color(30,82,8);
color Yellow = color(253,245,20);



void setup() {
  size (500, 500);
  noStroke();
}

void draw () {
  float rect_y =  map(mouseY, 0,height, 0, height);
  float rect_x =  map(mouseX, 0,height, height ,0);
  float rect_c =  map(mouseX, width, 0, 1, 0);
  float rect_cc =  map(mouseX, width, 0, 1, 0);
  color c = lerpColor( Green, Yellow, rect_c);
  color cc = lerpColor( Yellow, Green, rect_cc);

  background(cc);
  rect( 0,rect_y, 50,50 );
  fill(c);
  rect( 100,rect_y, 50,50 );
  rect( 200,rect_y, 50,50 );
  rect( 300,rect_y, 50,50 );
  rect( 400,rect_y, 50,50 );
  rect( 500,rect_y, 50,50 );
  rect( 50,rect_x, 50, 50 );
  rect( 150,rect_x, 50,50 );
  rect( 250,rect_x, 50,50 );
  rect( 350,rect_x, 50,50 );
  rect( 450,rect_x, 50, 50 );
}


