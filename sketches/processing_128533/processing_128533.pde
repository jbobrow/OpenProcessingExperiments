
 float y = height/2;
 float x = width/2;
 float ypos; 
 float d1;
 float d2;
 float a;
 float b;
 float diameter = height - 100; 
 float angle = 0; 
 boolean sad = false;
 boolean happy = true;
 float y1 = 110;
 float y2 = 100;
 float y3 = 93;
 float y4 = 88;
 float y5 = 93;
 float y6 = 100;
 float y7 = 110;
 float y8 = 110;
 float x1 =  100;
 float x2 =  300;


void setup(){
size(600,600);
smooth();
}

void draw(){
fill(255);  // fill with black, low opacity; builds up over old ellipses
rect(0, 0, width, height);
float d1 =  ((sin(angle)/5) * diameter) + diameter;
float d2 =  ((cos(angle)/5) * diameter) + diameter;
float a = (sin(angle));
float b = (sin(angle));
stroke(#FF4500);
fill(#FF4500);
ellipse(400, 200, d1, d1);
ellipse(200, 200, d2, d2);

beginShape();
line(300,200,300,250);
line(300,250,320,250);

if (sad == true)
{
 y1 = 110;
 y2 = 100;
 y3 = 93;
 y4 = 85;
 y5 = 80;
 y6 = 77;
 y7 = 75;
 y8 = 74;
 x1 =  100;
 x2 =  300;
}

fill(255);
strokeWeight(10);
stroke(#00B2EE);
ellipse(400, 200, 20, 20);
ellipse(200, 200, 20, 20);
angle += .03;
//black curve

if (happy == true)
{
 y1 = 110;
 y2 = 100;
 y3 = 93;
 y4 = 88;
 y5 = 93;
 y6 = 100;
 y7 = 110;
 y8 = 110;
 x1 =  50;
 x2 =  30;
}

stroke(#8A360F);
strokeWeight(15);
beginShape();
curveVertex(340,y1);
curveVertex(360,y2);
curveVertex(380,y3);
curveVertex(400,y4);
curveVertex(420,y5);
curveVertex(440,y6);
curveVertex(460,y7);
curveVertex(460,y8);
endShape();

beginShape();
curveVertex(260,y1);
curveVertex(240,y2);
curveVertex(220,y3);
curveVertex(200,y4);
curveVertex(180,y5);
curveVertex(160,y6);
curveVertex(140,y7);
curveVertex(140,y8);
endShape();

fill(#FF4500);
strokeWeight(30);
curve(x1, x2, 200,400, 400, 400, 200, 300);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      happy = true;
      sad = false;
      println("happy");
      
    } if (keyCode == DOWN) {
      sad = true;
      happy = false;
      println("sad");
    } 
  } 
}



