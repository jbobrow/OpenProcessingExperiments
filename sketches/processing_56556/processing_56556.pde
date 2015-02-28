
/* 
                      Chunzhong Li
                Four Leaves Clover Flag
   Love makes our country stronge and powerful!
 
 */
 
void setup()
{
  size(400, 300);
  smooth();
}

void draw()
{
  background(255);
  noStroke();
  fill(96, 183, 6);
  ellipse(400, 150, 400, 300);
  rect(0, 150, 400, 150);
  fill(255);
  ellipse(0, 150, 400, 300);// background

  arc(260, 120, 60, 60, PI/-2.0, PI/2.0);//white part clover
  arc(260, 180, 60, 60, PI/-2.0, PI/2.0);
  arc(170, 210, 60, 60, 0, PI);
  arc(230, 210, 60, 60, 0, PI);
  quad(222, 90, 260, 90, 260, 210, 178, 210);
  
  fill(96, 183, 6);// green part clover
  arc(170, 90, 60, 60, PI, TWO_PI);
  arc(230, 90, 60, 60, PI, TWO_PI);
  arc(140, 120, 60, 60, PI/2.0, PI*3.0/2.0);
  arc(140, 180, 60, 60, PI/2.0, PI*3.0/2.0);
  quad(140, 90, 222, 90, 178, 210, 140, 210);
  arc(170, 210, 60, 60, PI*0.61, PI);
  triangle(168,210,178,210,160,239);
  triangle(230,150,270,148,270, 152);
  triangle(200,180,198, 220,202,220);
  
  fill(255);
  arc(230, 90, 60, 60, PI*1.61, TWO_PI);
  triangle(222,90,232,90,240,61);
  triangle(198, 80, 202, 80, 200, 120);// little white gap
  triangle(130, 148, 130, 152, 170, 150);
 
  stroke(255);// non-colored part of clovers
  noFill();
  for ( int a = 0; a < 170; a += 40)
  {
    arc(215+a, 270, 10, 10, PI, TWO_PI);
    arc(225+a, 270, 10, 10, PI, TWO_PI);
    arc(230+a, 275, 10, 10, PI/-2.0, PI/2.0);

    arc(210+a, 275, 10, 10, PI/2.0, 3.0/2.0*PI);
    arc(210+a, 285, 10, 10, PI/2.0, 3.0/2.0*PI);  
    arc(215+a, 290, 10, 10, 0, PI);

    line(210+a, 280, 230+a, 280);
    line(220+a, 270, 220+a, 290);
  }

  for ( int b = 0; b < 170; b += 40)  //small colored part clovers
  {
    fill(3+2*b, 255-b, 211);
    rect(220+b, 280, 10, 10);
    arc(230+b, 285, 10, 10, PI/-2.0, PI/2.0);
    arc(225+b, 290, 10, 10, 0, PI);
  }
}


