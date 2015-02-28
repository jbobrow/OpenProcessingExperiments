

                
                void setup () {
  size (300,500);
  background (20,70,70);
  smooth ();
}

void draw () {
 for (int x = 12; x<=width; x +=30) {
     for (int j = 10; j<height; j+= 30){

    stroke(0);
    smooth ();
    fill(255);
    ellipse (x,j,5,5);
     }
  }
  noStroke ();
  fill (20,140,170);
  rect (20,20,255,445);

  noStroke ();
  // rect background
  fill (240,233,181);
  rect (35,35,225,420);
  // rect ornament background
  rect (20,20,50,25);
  rect (225,20,50,25);
  rect (20,440,50,25);
  rect (225,440,50,25);

  //top corners
  fill (20,40,70);
  rect (70,55,30,15); // this and next horizontals
  rect (195,55,30,15);
  rect (70,55,15,30); // this and next verticals
  rect (210,55,15,30);

  // bottom corners
  fill (20,40,70);
  rect (70,420,30,15); // this and next horizontals
  rect (195,420,30,15);
  rect (70,405,15,30); // this and next verticals
  rect (210,405,15,30);
  
  // top and bottom middles
  fill (20,140,170);
  rect (100,115,95,15);//this and next horizontals
  rect (100,355,95,15);
  rect (137,340,20,30); // this and next verticals
  rect (137,115,20,30);
  
  // left and right middles
  rect (70,140,15,205);// verticals
  rect (210,140,15,205);
  rect (195,235,25,20);// horizontals
  rect (70,235,30,20);
  
  // middle cross
  fill (20,70,70);
  rect (137,220,20,50); //vertical
  rect (122,235,50,20);
  
  // rects in mid
  noFill ();
  stroke (0);
  strokeWeight (7);
  rect (100,170,25,25);
  rect (170,170,25,25);
  rect (100,290,25,25);
  rect (170,290,25,25);
}
