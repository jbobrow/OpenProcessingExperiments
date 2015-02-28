
/*

 Homework 3 -- Mandala 
 by Gayatry Nair
 
 Using triginometry taught in class
 
 February 4, 2010
 
 */

int s = 500;

void setup(){

  size(s,s);

  background(0);

  smooth();

  drawMandala();



}



void drawMandala(){

  noFill();



  // Drawing the outside circles

  // ********** NEEDS WORK

  stroke(255);

  strokeWeight(2);

  ellipse(s/2,s/2,s-10,s-10);
  stroke(255,0,0);
  ellipse(s/2,s/2,s-15,s-15);
  stroke(255);
  ellipse(s/2,s/2,s-20,s-20);

  // Larger Blue Edgy thing in the back



  stroke(110,215,252, 50);

  fill(57,224,255, 40);

  float ptx = 0.0;

  float pty = 0.0;

  float theta = 0.0;

  int inR = s/6;

  int outR = s/2 - 15;

  boolean inC = true;

  boolean outC = false;

  beginShape();

  for (int i = 0; i < 12; i++){



    if (inC){

      ptx = s/2 + cos(theta) * inR;

      pty = s/2 + sin(theta) * inR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = false;

      outC = true;

    }



    if (outC){

      ptx = s/2 + cos(theta) * outR;

      pty = s/2 + sin(theta) * outR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = true;

      outC = false; 



    }

  }

  endShape(CLOSE);



  // Inside Blue Shape

  stroke(110,215,252);

  fill(57,224,255);

  ptx = 0.0;

  pty = 0.0;

  theta = 0.0;

  inR = s/20;

  outR = s/15;

  inC = true;

  outC = false;

  beginShape();

  for (int i = 0; i < 12; i++){



    if (inC){

      ptx = s/2 + cos(theta) * inR;

      pty = s/2 + sin(theta) * inR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = false;

      outC = true;

    }



    if (outC){

      ptx = s/2 + cos(theta) * outR;

      pty = s/2 + sin(theta) * outR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = true;

      outC = false; 



    }

  }

  endShape(CLOSE);


  // Edge things on the inside



  stroke(110,215,252, 50);

  fill(57,224,255, 40);

  ptx = 0.0;

  pty = 0.0;

  theta = PI/12;

  inR = s/6;

  outR = s/2 - 15;

  inC = true;

  outC = false;

  beginShape();

  for (int i = 0; i < 12; i++){



    if (inC){

      ptx = s/2 + cos(theta) * inR;

      pty = s/2 + sin(theta) * inR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = false;

      outC = true;

    }



    if (outC){

      ptx = s/2 + cos(theta) * outR;

      pty = s/2 + sin(theta) * outR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = true;

      outC = false; 



    }

  }

  endShape(CLOSE);



  // Inside Blue Shape

  stroke(191,52,52);

  ptx = 0.0;

  pty = 0.0;

  theta = 0.0;

  inR = s/8;

  outR = s/3;

  inC = true;

  outC = false;

  beginShape();

  for (int i = 0; i < 12; i++){



    if (inC){

      ptx = s/2 + cos(theta) * inR;

      pty = s/2 + sin(theta) * inR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = false;

      outC = true;

    }



    if (outC){

      ptx = s/2 + cos(theta) * outR;

      pty = s/2 + sin(theta) * outR;

      vertex(ptx,pty);

      theta += PI/12;

      inC = true;

      outC = false; 



    }

  }

  endShape(CLOSE);





  // White circles coming out from the inner

  fill(255,255,255,40);

  stroke(255,255,255,40);

  ellipse(s/4,s/2,s/2-20,s/2-20);

  ellipse(s/2,s/4,s/2-20,s/2-20);

  ellipse(s/2+s/4, s/2, s/2-20, s/2-20);

  ellipse(s/2, s/2+s/4, s/2-20, s/2-20);





  // Draw two Red octagon around it with first one transparent

  stroke(255,0,0,150);

  noFill();

  theta = 0.0;

  ptx = 0.0;

  pty = 0.0;

  // used to draw in Processing

  beginShape();

  for (int i=0; i<8; i++){

    ptx = s/2 + cos(theta)*s/10;

    pty = s/2 + sin(theta)*s/10;

    vertex(ptx, pty);

    theta += TWO_PI/8;

  }

  endShape(CLOSE);

  noFill();

  stroke(255,0,0);

  theta = 0.0;

  ptx = 0.0;

  pty = 0.0;

  // used to draw in Processing

  beginShape();

  for (int i=0; i<8; i++){

    ptx = s/2 + cos(theta)*(s/10-5);

    pty = s/2 + sin(theta)*(s/10-5);

    vertex(ptx, pty);

    theta += TWO_PI/8;

  }

  endShape(CLOSE);



  // Small circles on the outers -- red edges, white fills



  theta = PI/12;

  strokeWeight(2);

  stroke(255);

  fill(255,0,0);

  for (int i =0; i<24; i++){



    ellipse(s/2 + cos(theta) * (s/2-20), s/2 + sin(theta) * (s/2-20), 10, 10);

    theta+= PI/12;



  }

  /*
 // VSHAPEY THINGS
   noFill();
   // Start my first brown U-Shapes
   stroke(200,208,244,100);
   
   theta = 0.0;
   ptx = 0.0;
   pty = 0.0;
   boolean arch1 = true;
   boolean arch2 = false;
   int outerArchRad = s/2 - 10;
   int innerArchRad = s/5;  
   
   
   for (int i =0; i < 6; i++){
   
   beginShape();
   
   ptx = s/2 + cos(theta) * outerArchRad;
   pty = s/2 + sin(theta) * outerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   ptx = s/2 + cos(theta) * innerArchRad;
   pty = s/2 + sin(theta) * innerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   ptx = s/2 + cos(theta) * outerArchRad;
   pty = s/2 + sin(theta) * outerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   endShape();
   }
   
   // Start my blue U Shapes
   
   stroke(200,208,244,100);
   theta = PI/6;
   ptx = 0.0;
   pty = 0.0;
   arch1 = true;
   arch2 = false;
   outerArchRad = s/2 -10;
   innerArchRad = s/5;  
   
   
   for (int i =0; i < 6; i++){
   
   beginShape();
   
   ptx = s/2 + cos(theta) * outerArchRad;
   pty = s/2 + sin(theta) * outerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   ptx = s/2 + cos(theta) * innerArchRad;
   pty = s/2 + sin(theta) * innerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   ptx = s/2 + cos(theta) * outerArchRad;
   pty = s/2 + sin(theta) * outerArchRad;
   vertex(ptx,pty);
   theta += PI/6;
   
   endShape();
   }
   
   
   */
  noFill();
  translate(s/2,s/2);
  float sz=300;
  int strokeNum = 0;
  for(float i = 0.0; i < sz; i++){
    strokeNum += 20;
    stroke(255-strokeNum,0,0, i);
    rotate(PI/(i+1));
    // slowly decrease the size each time i gets larger
    ellipse(0,0,sz-(i*i),sz-(i*i)); 
  }







}



