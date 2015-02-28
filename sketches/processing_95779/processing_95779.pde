
//total nubmer of possible points:

int numpoints = 1000;

float [] x = new float [numpoints];

float [] y = new float [numpoints];

 

//number of points to draw:

int drawpoints = 0 ;

void setup() {

  size (1440, 900);

}

//store the data of mouseX,mouseY:

void mouseDragged() {

  //add a new pint to the end of the list of points

  if (drawpoints < numpoints) {

    x[drawpoints]= mouseX;

 

    y[drawpoints] =mouseY;

    drawpoints += 1;

    println(drawpoints);

  }

}

int frame = 0;

void draw() {

 

  frame++;

  background(200);

 

  for (int i = 1;i <drawpoints; i++) {

    float phase = frame / i;

    float size = ((frame + i)*0.2) % 20;
    
    float sizeA= size+ random(10,20);

    //curve(x[i], y[i], x[i-1], y[i-1],x[i-2], y[i-2], x[i-3], y[i-3]); 

    
fill(random(1,255),random(1,255),random(1,255));
    ellipse (x[i],y[i], sizeA,sizeA);

 

    x[i] = x [i] + sin(phase);

    y[i] = y [i] + cos(phase);

  

  //line(x[i], y[i], x[i-1], y[i-1]);

 

}

}

 

void drawFace() {

  // paint in white:

  fill(255);

  // head:

  ellipse(0, 0, 300, 300);        

 

  // paint in black:

  fill(0);

  // mouth

  rect(-100, 50, 200, 20);

  // nose

  line(0, 0, 0, 20);

  // eyes

  ellipse(-70, -50, 80, 80);

  ellipse( 70, -50, 80, 80);

}

 

void mousePressed() {

  drawpoints = 0;

}
