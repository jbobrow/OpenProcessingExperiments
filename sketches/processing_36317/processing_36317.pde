
void setup () {
  background (255);
  size (300, 300);
}

int x=0;
int y=20;


void draw() {	

  if (mouseY>160) {
    background(255);
  }
  else {
    background(0);
  }

  strokeWeight(.5);//grey line at center, pass over to change background
  stroke(80);
  line (0, 160, width, 160);

  fill(10);
  strokeWeight(4);
  stroke (255);
  rect (0, 100, width, 25);

  fill(10);
  strokeWeight(4);
  stroke (255);
  rect (0, 200, width, 25);


  stroke(255);
  strokeWeight(2);//applies to both circles

  fill(61, 103, 152);//blue
  ellipseMode(CENTER);
  ellipse(225, 100-y, x, x);



  fill(21, 129, 16);//green
  ellipseMode(CENTER);
  ellipse(75, 220-y, x, x);

  fill(61, 103, 152);//blue
  ellipseMode(CENTER);
  ellipse(225-y, 100, x, x);



  fill(21, 129, 16);//green
  ellipseMode(CENTER);
  ellipse(75-y, 220, x, x);




  stroke(255);
  strokeWeight(2);//applies to both circles

  fill(61, 103, 152);//blue
  ellipseMode(CENTER);
  ellipse(125, 50-y, x, x);



  fill(21, 129, 16);//green
  ellipseMode(CENTER);
  ellipse(175, 120-y, x, x);

  fill(61, 103, 152);//blue
  ellipseMode(CENTER);
  ellipse(125, 50-y, x, x);



  fill(21, 129, 16);//green
  ellipseMode(CENTER);
  ellipse(175, 120-y, x, x);


  x++;  //adding 1,1,1 to the height and width because my integer is x.
  if (x>100) {
    x=100;//the circles dont go passed 100.

    if (y> 299) {
      y=20;
    }
    y++;
  }//closing x++ statement.

  //green and blue circles grow until they are 100 across.
}


