

PImage sky;

void setup () {
  size(350, 800);
  smooth ();
  noLoop();
  noStroke();
  sky = loadImage("1.png");
}

void draw () {
  background (255);

  image(sky, 0, 0);

  float w=75;
  float h=100;

 


  for (int y=0; y< height+130; y+= 50) {

    float x;
    x=random(width);
    float s;
s=random(150);



    //draw
    pushMatrix();
    translate(x, random(y));
    scale(s/150);
    
    
    fill(random(255), random(255), random(255), 160);  

    balloon ();


    noStroke();
    popMatrix();
  }
}

void balloon () {

  stroke(100);
  strokeWeight(2); 
  line(40, 40+50, 40, 40+250);


  fill(random(255), random(255), random(255), 160);   
  noStroke();
  ellipse(40, 40, 75, 100);
  triangle(40, 40+50, 40-10, 40+65, 40+10, 40+65);


  noFill();
  pushMatrix();
  stroke(255);
  strokeWeight(3);
  arc(40, 40, 55, 85, radians(-65), radians(0));
  arc(40, 40, 55, 85, radians(20), radians(30));
  popMatrix();

  fill(1);
}



//---------------------- REDRAW
void mousePressed () {
  redraw();
}



