
void setup(){
size(700,700);
background(255);
smooth();
}

void draw(){
  
/* set up for loop variables for carriages */
float ellipseX = 350;
float ellipseY = 265;
float el = 225;
float ex2;
float ey2;
 
/* for loop for carriages */
for(int i = 0;i<8;i++){
  ex2 = ellipseX+ el*sin(2*PI/8*i);
  ey2 = ellipseY+ el*cos(2*PI/8*i);
  stroke(100);
 strokeWeight(2);
 fill(185);
 ellipse(ex2, ey2+30, 75,55);
  //line(centerX,centerY,x2,y2);
}

/* set up for loop variables for support lines */
float centerX = 350;
float centerY = 265;
float l = 225;
float x2;
float y2;

/* for loop for support lines */
for(int i = 0;i<8;i++){
  x2 = centerX+ l*sin(2*PI/8*i);
  y2 = centerY+ l*cos(2*PI/8*i);
  stroke(255,105,100);
  strokeWeight(4);
  line(centerX,centerY,x2,y2);
}

  /* create outer edge of ferris wheel */
stroke(255,105,100);
strokeWeight(5);
noFill();
ellipse(350,265,450,450);

/* create inner edge of ferris wheel */
stroke(255,105,100);
strokeWeight(3);
noFill();
ellipse(350,265,150,150);


//fill(255,105,100);
strokeWeight(10);
beginShape();
vertex (200,580);
vertex (500,580);
vertex (350,265);
vertex (200,580);
endShape(CLOSE);
beginShape();
//beginContour (); doesn't work in javascript :(
vertex (220,560);
vertex (350,285);
vertex (480,560);
vertex (220,560);
//endContour();
endShape(CLOSE);

}

 





