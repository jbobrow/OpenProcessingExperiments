
/*Code created by Anne Marie Hood, YSDN Interactivity 2, Project 3*/
PImage img;
float x1= 43;
float x2= 393;
float x3= 390;
float x4= 40;

float y1= 20;
float y2= 80;
float y3= 516;
float y4= 568;

void setup (){
  size (450,600);
  img= loadImage ("doors.jpg");
}

void draw (){
  image (img, 0,0);
  
  smooth ();
  fill (#07080b);
  noStroke();
  beginShape();
  vertex (x1,y1); 
   x1+= 1;
    if (x1>240){
      fill(0,0);}
    y1+= .187;

  vertex (x2,y2);
   x2-= .737;
    y2-= .117;

  vertex (x3,y3);
    x3-= .729;
    y3+= .1118 ;

  vertex (x4,y4);
    x4+= .97;
    y4-= .121 ;

  
  endShape (CLOSE);
  
}


