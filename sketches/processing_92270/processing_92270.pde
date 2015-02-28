
//Declaración de variabes

float x, y;
float apx1, apy1;
float apx2, apy2;
float radaPx1, radaPy1;
float radaPx2, radaPy2;
float radX, radY;
float cX, cY;
float b, incB;
float w;



//-----------------------

//Definición del lienzo

void setup(){
  size(500, 500);
  //background(111, 45, 170);
  
  cX = width/2;
  cY = height/2;
  
  radaPx1 = 125;
  radaPy1 = 125;
  radaPx2 = 125;
  radaPy2 = 125;
  
  radX = 62.5;
  radY = 62.5;
  b = 0;
  incB = TWO_PI/360;
  
  }


//-----------------------


// Formas

void draw(){
  
  noStroke();
  fill(111, 45, 170, 20);
  rect(0, 0, width, height);

  //fondo del círculo
  fill(0, 0, 0, 30);
  noStroke();
  ellipse(cX, cY, width/2, height/2);
  
  //separación de las formas
  apx1 = cX + radaPx1*cos(b);
  apy1 = cY*cos(b);
  
  apx2 = cX + radaPx1*cos(b);
  apy2 = cY - radaPy1*cos(b);
  
  x = cX + radX*cos(b);
  y = cY + radY*sin(b);
  w = random(1, 5);

  stroke(255, 255, 255, 50);
  strokeWeight(w);
  noFill();
  bezier(cX, cY, apx1, apx2, apx2, apy2, x, y);
  
  b+= incB;
  
  }
  
  
  
  
  
  
  
  
  



//-----------------------


