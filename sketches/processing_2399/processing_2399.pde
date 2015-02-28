




//winds

float s, m ,h;

float a, b, c;

float xmag, ymag = 0;

float newXmag, newYmag = 0;

float k;

int u;



void setup(){

  background(255);

  size(1000,700,P3D);

  // smooth();



}



void draw(){

  s = second();

  m = minute();

  h = hour();



  //rotateX(u*(0.001*random(30)));

  //rotateY(u*(0.001*random(30)));

  //



 

  if(mousePressed == true) {

    newXmag = mouseX/float(width) * TWO_PI;

    newYmag = mouseY/float(height) * TWO_PI;

  };



  float diff = xmag-newXmag;

  if (abs(diff) >  0.01) {

    xmag -= diff/4.0;

  }



  diff = ymag-newYmag;

  if (abs(diff) >  0.01) {

    ymag -= diff/4.0;

  }



  rotateX(-ymag);

  rotateY(-xmag);



 // rotateZ(m);

  //rotateX(s*0.001);



  pushMatrix();

  rotateX(s*0.001);

//rotateX(s*(random(100)*0.001));

  rotateY(s*0.06084);

  translate(500,350);





  noStroke();

  fill(random(255),10,10,0.1);

  rotateX(u*0.01);

  //rotateY(u*0.01);

  rotateZ(u*0.01);

  rect(0,0,100,100);

  rect(-80,-80,40,30);

  fill(255,0.5);

  rect(-200,-200,200,200);

 

  if((keyPressed == true) && (key =='w')){

 fill(255,30);

  };

   if((keyPressed == true) && (key =='r')){

 fill(random(255),30,30,3);

  };

 rect(0,0,50,100);

  popMatrix();

 





  u++;

}








