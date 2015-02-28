
int numpoints = 1000;

float [] x = new float [numpoints];

float [] y = new float [numpoints];

int drawpoints = 0 ;

void setup() {

  size (500,500);

}


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

  background(0);


  for (int i = 1;i <drawpoints; i++) {

    float phase = frame / i;

    float size = ((frame + i)*0.8) % 40;

 
stroke(random(0,255),random(0,255),random(0,255));
   rect (x[i],y[i], size,size);

 

    x[i] = x [i] + sin(phase);

    y[i] = y [i] + cos(phase);
//fill(random(0,255),random(0,255),random(0,255));
 fill(random(0,255));


}

}
