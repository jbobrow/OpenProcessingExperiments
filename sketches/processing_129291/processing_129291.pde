
 
 //James Robe, NMD 295 Jan 20th,  2014
 //ok,  so here we have tons and tons of variables,  basically we
 //set up everything
 float y = height/2;
 float x = width/2;
 float ypos = 0; 
 float xpos;
 float d1;
 float d2;
 float a;
 float b;
 float diameter = height - 100; 
 float angle = 0; 
 boolean sad = false;
 boolean happy = true;
 boolean move = false;
// All of these variables are what set up the drawing to be 
// movable,  they are the basic points for the eyebrows,  most else
// is static

int[] bh = {110, 100, 93, 88, 93, 100, 110, 110, 100, 20};
int[] bs = {110, 100, 93, 85, 80, 77, 75, 74, 100, 500};

 float y1;
 float y2; 
 float y3;
 float y4; 
 float y5; 
 float y6;
 float y7; 
 float y8; 
 float x1; 
 float x2; 
 int eye1 = 400;
 int eye2 = 200;
// int eye1m;
// int eye2m;


void setup(){
size(600,600);
smooth();
}

void draw(){
fill(255);  
rect(0, 0, width, height);
if (move == true)
{
  ypos = ypos + (mouseY - pmouseY);
  xpos = xpos + (mouseX - pmouseX);
}

//if (move == false);
//{
//eye1m = mouseY/200;
//eye2m =  mouseY/200;
//eye1 = eye1m + eye1;
//eye2 = eye2m + eye2;
//}
//pulsating eye function
float d1 =  ((sin(angle)/5) * diameter) + diameter;
float d2 =  ((cos(angle)/5) * diameter) + diameter;
float a = (sin(angle));
float b = (sin(angle));
stroke(#FF4500);
fill(#FF4500);
//pulsating eyes,  size is dicated by sine function
ellipse(eye1 + xpos, 200 + ypos, d1, d1);
ellipse(eye2 + xpos, 200 + ypos, d2, d2);

if (sad == true)
{
 y1 = bs[0] + ypos;
 y2 = bs[1] + ypos;
 y3 = bs[2] + ypos;
 y4 = bs[3] + ypos;
 y5 = bs[4] + ypos;
 y6 = bs[5] + ypos;
 y7 = bs[6] + ypos;
 y8 = bs[7] + ypos;
 x1 =  bs[8] + ypos;
 x2 =  bs[9] + ypos;
}

fill(255);
strokeWeight(10);
stroke(#00B2EE);
ellipse(400 + xpos, 200 + ypos, 20, 20);
ellipse(200 + xpos, 200 + ypos, 20, 20);
angle += .03;
//black curve

if (happy == true)
{
 y1 = bh[0] + ypos;
 y2 = bh[1] + ypos;
 y3 = bh[2] + ypos;
 y4 = bh[3] + ypos;
 y5 = bh[4] + ypos;
 y6 = bh[5] + ypos;
 y7 = bh[6] + ypos;
 y8 = bh[7] + ypos;
 x1 =  bh[8] + ypos;
 x2 =  bh[9] + ypos;
}

stroke(#8A360F);
strokeWeight(15);
beginShape();
curveVertex(340 + xpos ,y1);
curveVertex(360 + xpos,y2);
curveVertex(380 + xpos,y3);
curveVertex(400 + xpos,y4);
curveVertex(420 + xpos,y5);
curveVertex(440 + xpos,y6);
curveVertex(460 + xpos,y7);
curveVertex(460 + xpos, y8);
endShape();

beginShape();
curveVertex(260 + xpos,y1);
curveVertex(240 + xpos,y2);
curveVertex(220 + xpos,y3);
curveVertex(200 + xpos,y4);
curveVertex(180 + xpos,y5);
curveVertex(160 + xpos,y6);
curveVertex(140 + xpos,y7);
curveVertex(140 + xpos,y8);
endShape();

fill(#FF4500);
strokeWeight(30);
curve(x1, x2, 200 + xpos, 400 + ypos, 400 + xpos, 400 + ypos, 200 + xpos, 300 + ypos);
}


void keyPressed() { 
    if (key == 'm') {
   println("yay");
   move = true;
  } 
  
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

void keyReleased() {
  if (key == 'm') {
   move = false; 
  }
}



