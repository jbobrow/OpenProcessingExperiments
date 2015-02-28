
// Aris Bezas, 23 moon fase C Igoumeninja, drawing lines through physics laws and produce sound -->
//Pempti 17 November 2008 Igoumeninja Aris Bezas play with the superformula -->
 
int num = 60;//Arithos Sformon se kathe Sforma
int colorL=255,k = 255,j=255,i=100;
 
float x,y,z;
float r,th=0,step=.1,epi=200;
float m = 1,n1=-1,n2=0,n3=0;
float b=1,a=1;
int counter1=0, counter2=0;
 
 
void setup() 
{
  size(900,450);
  background(55);
  frameRate(10);
  smooth();
}
 
void draw() 
{
   
  fill(0,5);
  rect(-5, -5, 1250,510);
  counter1++;
  if (counter1 == 50) {
    m=int(random(3,40));
    n1=random(.5);
    n2=random(6.);
    //n3=random(6.);
    epi=random(100,200);
    step=random(.05,10);
    counter1 = 0;
  }
  translate(mouseX, mouseY);
  stroke(colorL,55);
  noFill();
  beginShape();
  for(int i=1; i < num; i++) {
    r = epi*pow(((pow(abs(cos(m*th/4)/a),n2))+(pow(abs(sin(m*th/4)/b),n3))),(-1/n1)); 
    th = th + step;
    x = r*cos(th);
    y = r*sin(th);
    curveVertex(x,y);
  }
  endShape();
 
}
 
void mousePressed()  {
    background(0);
}


