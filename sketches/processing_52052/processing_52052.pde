
//PAUL RIVERA - QUICK FACE SKETCH

float r;
float ym; 
float xm; 
int i = 1;


void setup() {
  size(500, 500);
  smooth();
  //noStroke();
}

void draw() {

  float my2 = map(ym, 0, 500, .8, 1.7);
  float my3 = map(ym, 0, 500, 250, 270);
  float g = map(ym, 0, 500, 0, 120);
  float r = random(100);
  background(255);
  xm = mouseX;
  ym =mouseY;


  //  ellipse(width/2,height/2-30,450,450);

  println(ym);
  println (xm); 
  //Head

  strokeWeight(2);
  rect(184, 42.5, 132, 168);


  //eyebrows
  fill(g, 50);
  strokeCap(ROUND);
  strokeWeight(5);
  line(159, my2*69, 210, 66);
  line(291, 69, 342, my2*66);


  //Eyes
  strokeWeight(.01);
  fill(0);
  for (int i=1; i<=30; i=i+1) {
    fill (70, 50);
    ellipse(184.53, 109.5, i, i);
    ellipse(316.53, 109.5, i, i);
    i = i + 2;
    fill(40, 50);
    ellipse(184.53, 109.5, i/2, i/2);
    ellipse(316.53, 109.5, i/2, i/2);
  }
  fill(220);
  ellipse(187, 105, 10, 10);
  ellipse(322, 107, 10, 10);

  //Nose
  strokeWeight(1);
  fill(0);
  rect(248, 42.5, 5, 260);

  //stash

  strokeWeight(.01);
  fill(g);
  triangle(174, my3, 222, 238, 222, 273);
  triangle(280, 238, 328, my3, 280, 274);



  //Chin?
  fill(0);
  //rect(45, 364, 413, 92);
  float my4 = map (ym, 0, 500, 317, 383);
  float my5 = map (ym, 0, 500, 187, 116);
  float my6 = map (ym, 0, 500, 319, 302);
  //mouth
  strokeWeight(3);
  fill(255);
  quad(162, 303, 339, 303, my4, 374, my5, 374);

  //Teeth

  strokeWeight(1.2);
  line(335, my6, 168, my6);
  line(my5+3, 362.5, my4-2.5, 362);
  //  quad(227.44, 351.5, 273.63, 351.5, 268, 373, 232, 374);
  //  quad(225.38, 302.5, 274.45, 302.5, 282, 332.5, 218, 332.5);
  //  line(249, 302, 249, 332);
  //  line(249, 351, 249, 373);

  if (mousePressed)
  {

    for (int b=i*2; b<=width*2; b=b+3) 
    {
      noFill();
      stroke(i*2, i*4, i*10);


      //      ellipse(width/2, height/2,i, i);
      arc(width/2, height/2, i, i, radians(b), radians(b));
      arc(width/2, height/2, i*2, i*2, radians(b), radians(b));
      arc(width/2, height/2, i*4, i*4, radians(b), radians(b));
      //      b = b+10;
      //      for (int c=1; c<=width; c=c+2) {
      //      ellipse(width/2,width, c,c);
      //      }
    }
  }
  r=r/2;
  i = i+1;


  if ((i>=200) && (mousePressed))
  {
    i =i-30;
  }
}
 void mouseReleased() {
    i=1*0;
  }


//void mouseDragged() {
//  stroke(i/20, i/50, r);
//}



