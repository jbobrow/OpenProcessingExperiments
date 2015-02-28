
int numpoints = 1000;

float [] x = new float [numpoints];

float [] y = new float [numpoints];
int drawpoints = 0 ;
void setup() {
  size(700,300);
 background(0);
 strokeWeight(10);
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
void draw(){
  stroke(random(0,255),0,0);
  quad(130,0, 170,0, 40,300, 0,300);
  quad(130,0,170,0, 300,300,260,300);
  quad(106,150,160,150,180,180,92,180);
    stroke(0);
    fill(255,200,120);
  rect(330,mouseY, 40,mouseY);
  rect(mouseX,140, mouseX,40);
   stroke(0,random(0,255),random(0,255));
   fill(255);
  rect(400,5,260,40);
  rect(515,5,45,300);
  
  
  
  

  frame++;



 

  for (int i = 1;i <drawpoints; i++) {

    float phase = frame / i;

    float size = ((frame + i)*0.8) % 40;

 
//stroke(random(0,255),random(0,255),random(0,255));
 strokeWeight(3);
 fill(random(0,100),random(0,100),random(0,100),5);
    ellipse (x[i],y[i], size,size);

 

    x[i] = x [i] + sin(phase);

    y[i] = y [i] + cos(phase);
//fill(random(0,255),random(0,255),random(0,255));
 fill(random(0,255));


}
}
