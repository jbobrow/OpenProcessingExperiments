
PImage head;
PImage body;
PImage la;
PImage ra;
PImage ll;
PImage rl;
PImage tail;
PImage bird;
PImage lw;
PImage rw;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  head = loadImage ("head.png");
  body = loadImage ("body.png");
  la = loadImage ("left arm.png");
  ra = loadImage ("right arm.png");
  ll = loadImage ("left leg.png");
  rl = loadImage ("right leg.png");
  tail = loadImage ("tail.png");
  bird = loadImage("bird body.png");
  lw= loadImage("left wing.png");
  rw= loadImage("right wing.png");
}




void draw() { 
  background(120, 150, 200);


  //brick wall
  fill(240);
  quad(0, height/2+45, width, height/2+45, width, height, 0, height);
  fill(194, 66, 76);
  for ( int i =5; i<width; i = i+55) {
    for (int j=300; j<(height+100); j=j+25) {
      quad(i, j, i+50, j, i+50, j+20, i, j+20);
    }
  }


  float w=width;
  float h=height;
  float fall=0;
  float mx= map(mouseX, 0, 500, 1, 4);

  //   //bird
  pushMatrix();
     translate( 10+1.2*mx, -200+112*mx);
     rotate(sin(10*mx)/2+0.2);
  image(lw,0,-40, 80-10*mx, 120-10*mx);
  popMatrix();
  
   pushMatrix();
   translate(90-1.2*mx, -190+112*mx);
     rotate(sin(10*mx-10)/2+0.2);
  image(rw,-30,-40, 80-8*mx, 120-10*mx);
  popMatrix();
  
  pushMatrix();
  image(bird, 50, -200+110*mx, 80, 120);
  popMatrix();
  

  
  
  //egg body
  fill(255);
  ellipse(width/2, height/2+20, 280, 410);


  line(w/2-50, h/2-40, w/2-10, h/2-50);
  line(w/2+50, h/2-40, w/2+10, h/2-50);


  //eyes
  fill(240, 220, 150);
  ellipse(w/2 +60, h/2-30, 50, 40-mx*3);
  ellipse(width/2 -60, height/2-30, 50, 40-mx*3);

  //mouth
  ellipse(width/2, height/2+120+mx*5, 20*mx, 8*mx);
fill(255);
  ellipse(width/2, height/2+110+mx*5, 20*mx, 8*mx);

  fill(240, 220, 150);
  //nose
  ellipse(width/2, height/2+50, 50, 40-mx*2);
  triangle(width/2-15, height/2+45, width/2+15, height/2+45, width/2, height/2-10-mx*3);

  //pupils
  fill(255);
  ellipse(width/2 +60, height/2-30, 15, 15-mx);
  ellipse(width/2 -60, height/2-30, 15, 15-mx);

  //mustache
  fill(100);
  arc(width/2-mx*3, height/2+95, 100+mx*2, 100, radians(150+mx*3), radians(165+mx*3));
  arc(width/2+mx*3, height/2+95, 100+mx*2, 100, radians(15-mx*3), radians(30-mx*3));

  //blush
  fill(240, 150, 150);
  ellipse(width/2+100+fall, height/2+50, -10+mx*10, -10+mx*10);
  ellipse(width/2-100+fall, height/2+50, -10+mx*10, -10+mx*10);


  //hat
  rectMode(CENTER);
  fill(90);
  ellipse(width/2, height/2-100-mx, 370, 60);
  quad(width/2-120, height/2-100, width/2+120, height/2-100, width/2+100, height/2-200, width/2-100, height/2-200);
  ellipse(width/2, height/2-200, 199, 23+mx*6);

  //mole
  ellipse(width/2-20+fall, height/2+30, 5, 5);



  imageMode(CENTER);
  //squirrel
  pushMatrix();
  translate(width+155-mx*50, height/2-17);
  rotate(1.5*sin(mx)/2);
  image(ra, 0, 0, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width+110-mx*50, height/2+5);
  rotate(sin(-mx));
  image(la, 0, 0, 25, 25);
  popMatrix();

  pushMatrix();
  translate(width+170-mx*50, height/2-10);
  rotate(cos(-mx)+19.7);
  image(tail, 0, 0, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width+125-mx*50, height/2+22);
  rotate(sin(7*mx+20)/2);
  image(ll, -10, 0, 25, 40);
  popMatrix();

  pushMatrix();
  translate(width+155-mx*50, height/2+22);
  rotate(sin(7*mx)/2);
  image(rl, -10, 0, 25, 40);
  popMatrix();

  image(body, width+134-mx*50, height/2, 50, 50);
  image(head, width+120-mx*50, height/2-30, 50, 50);
  fill(240);
  ellipse(width+108-mx*50, height/2-30, 0.5+2*mx, 0.5+2*mx);
  ellipse(width+123-mx*50, height/2-30, 1+2*mx, 1+2*mx);
}

