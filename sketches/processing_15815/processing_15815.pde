
float currX = 0.0;
float currY = 0.0;
float easing = .1;


void setup()
{
  smooth();
  size( 660,480);
  stroke(63,209,44,200);
  background(0);
  fill(202,245,102);
//fill(255);
  ellipse(width/2,height/2,400,400);
  colorMode(HSB);
  frameRate(5);
}


void draw()
{  stroke(63,209,44,200);
  background(0);
  fill(202,245,102);
//fill(255);
  ellipse(width/2,height/2,400,400);
    float targetX = mouseX;
  float dx = (targetX - currX);
  currX += dx*easing;
  
  if (mouseX>0){
    //  {translate(65,-310);
//  
//    noStroke();
//  background(0);
//  fill(252,245,102);
////fill(255);
//  ellipse(width/2,height/2,400,400);
    //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,0);
  diamond (35, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,0);
  diamond (35, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,0);
  diamond (35, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,0);
  diamond (35, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,0);
  diamond (35, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,0);
  diamond (35, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,0);
  diamond (35, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,0);
  diamond (35, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,0);
  diamond (35, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,0);
  diamond (35, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,0);
  diamond (35, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,0);
  diamond (35, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,0);
  diamond (35, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,0);
  diamond (35, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,0);
  diamond (35, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,0);
  diamond (35, -40, 7);
  }
  
    if(mouseX>100)
    
  {
  rotate(radians(20));

    translate(20,-440);
  
  stroke(63,209,44,200);
background(0);
  fill(212,245,102);
//fill(255);
  ellipse(width/2,height/2,350,350);
    //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,0);
  diamond (25, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,0);
  diamond (25, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,0);
  diamond (25, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,0);
  diamond (25, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,0);
  diamond (25, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,0);
  diamond (25, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,0);
  diamond (25, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,0);
  diamond (25, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,0);
  diamond (25, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,0);
  diamond (25, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,0);
  diamond (25, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,0);
  diamond (25, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,0);
  diamond (25, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,0);
  diamond (25, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,0);
  diamond (25, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,0);
  diamond (25, -40, 7);
  }
  
  if(mouseX>200)
  { rotate(radians(20));

    translate(20,-440);
  
  stroke(63,209,44,200);
background(0);
  fill(222,245,102);
//fill(255);
  ellipse(width/2,height/2,300,300);
    //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,0);
  diamond (15, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,0);
  diamond (15, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,0);
  diamond (15, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,0);
  diamond (15, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,0);
  diamond (15, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,0);
  diamond (15, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,0);
  diamond (15, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,0);
  diamond (15, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,0);
  diamond (15, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,0);
  diamond (15, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,0);
  diamond (15, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,0);
  diamond (15, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,0);
  diamond (15, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,0);
  diamond (15, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,0);
  diamond (15, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,0);
  diamond (15, -40, 7);
  }
  
  
  if (mouseX>300)
  {  
 rotate(radians(20));

    translate(20,-440);
  
  stroke(63,209,44,200);
 background(0);
  fill(232,245,102);
//fill(255);
  ellipse(width/2,height/2,250,250);
  //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,10);
  diamond (10, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,10);
  diamond (10, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,10);
  diamond (10, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,10);
  diamond (10, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,10);
  diamond (10, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,10);
  diamond (10, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,10);
  diamond (10, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,10);
  diamond (10, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,10);
  diamond (10, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,10);
  diamond (10, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,10);
  diamond (10, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,10);
  diamond (10, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,10);
  diamond (10, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,10);
  diamond (10, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,10);
  diamond (10, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,10);
  diamond (10, -40, 7);
  }
  
  
  if (mouseX>400)
  { rotate(radians(20));

    translate(20,-440);
  
  stroke(63,209,44,200);
  background(0);
  fill(242,245,102);
//fill(255);
  ellipse(width/2,height/2,200,200);
      //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,30);
  diamond (5, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,30);
  diamond (5, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,30);
  diamond (5, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,30);
  diamond (5, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,30);
  diamond (5, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,30);
  diamond (5, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,30);
  diamond (5, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,30);
  diamond (5, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,30);
  diamond (5, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,30);
  diamond (5, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,30);
  diamond (5, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,30);
  diamond (5, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,30);
  diamond (5, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,30);
  diamond (5, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,30);
  diamond (5, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,30);
  diamond (5, -40, 7);
    
  }

  
  
  
  
  if (mouseX>500){
    rotate(radians(20));

    translate(20,-440);
  
  stroke(63,209,44,200);
  background(0);
  fill(252,245,102);
//fill(255);
  ellipse(width/2,height/2,150,150);
  //top

  translate(0,10);
    circle(1, 0, 0,-120, 0, 0,60);
  diamond (5, -120, 0);
  
  circle(1, 0, 0, -40, 0, 0,60);
  diamond (5, -40, 0);
  
  //left
translate(260,-170);
      circle(1, 1, 0,-120, 0, 0,60);
  diamond (5, -120, 1);
  
  circle(1, 1, 0, -40, 0, 0,60);
  diamond (5, -40, 1);
  
  //left 2
  translate(300,70);
      circle(1, 2, 0,-120, 0, 0,60);
  diamond (5, -120, 2);
  
  circle(1, 2, 0, -40, 0, 0,60);
  diamond (5, -40, 2);
  
  //left3
  translate (170,260);
  circle(1, 3, 0,-120, 0, 0,60);
  diamond (5, -120, 3);
  
  circle(1, 3, 0, -40, 0, 0,60);
  diamond (5, -40, 3);
  //down
  
  translate(-70,300);
  circle(1, 4, 0,-120, 0, 0,60);
  diamond (5, -120, 4);
  
  circle(1, 4, 0, -40, 0, 0,60);
  diamond (5, -40, 4);
  
  //down left
  translate (-260,165);
  circle(1, 5, 0,-120, 0, 0,60);
  diamond (5, -120, 5);
  
  circle(1, 5, 0, -40, 0, 0,60);
  diamond (5, -40, 5);
  
  //right 2
  translate(-300,-65);
    circle(1, 6, 0,-120, 0, 0,60);
  diamond (5, -120, 6);
  
  circle(1, 6, 0, -40, 0, 0,60);
  diamond (5, -40, 6);
  
  // right
  translate (-167,-260);
    circle(1, 7, 0,-120, 0, 0,60);
  diamond (5, -120, 7);
  
  circle(1, 7, 0, -40, 0, 0,60);
  diamond (5, -40, 7);
  
}

}


void circle(float x, int y, int w, int h, int a, int b, int c)

{
 fill(252,102,150,200);
  strokeWeight(3);
  stroke(71,57,234);
  smooth();
  pushMatrix();    
  scale(x,1);
  rotate(radians(45*y));
  translate((width/2)+w, (height/2)+h);

  ellipse(a,b-40,c,60);
  
  fill(57,218,234,200);
  strokeWeight(20);
  stroke(234,226,57,100);
  ellipse(a,b,c,60);
 
  popMatrix();
}


void diamond (int d, int e, int r)
{
  int wid= width/2;
  int hei = height/2;
strokeWeight(10);
stroke(234,95,57,100);
fill(102,249,252,100);
  pushMatrix();
  rotate(radians(45*r));
translate(d,e);
quad(wid-55,hei,wid-35,hei-20,wid-15,hei,wid-35,hei+20);


popMatrix();


pushMatrix();
rotate(radians(45*r));
translate(-d,e);
fill(234,57,72,100);
stroke(103,57,234,200);
strokeWeight(2);
quad(wid+55,hei,wid+35,hei-20,wid+15,hei,wid+35,hei+20);


popMatrix();
}


