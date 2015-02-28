
//Homework 7
// Amy Friedman
//amyfried
//Copyright Amy Friedman October 2013 Pittsburgh, PA

// head controls:
// faster in initial X direction: k
// slower in initial X direction: h
// faster in initial Y direction: u
// slower in initial Y direction: j
 
// body controls:
// faster in initial X direction: f
// slower in initial X direction: s
// faster in initial Y direction: e
// slower in initial Y direction: d

// "spacebar" : resets the head and body

float x,y,wd,ht,faceSpeedx, faceSpeedy;//face dimensions
float x2,y2,wd2,ht2,bodySpeedx, bodySpeedy;//body dimensions


void setup()
{
  size(800,800);
  rectMode(CENTER);
  
  x=150;
  y=150;
  wd=125;
  ht=125;
  faceSpeedx=5;
  faceSpeedy=3;
  
  x2=300;
  y2=300;
  wd2=200;
  ht2=200;
  bodySpeedx=3;
  bodySpeedy=5;
  
  
}

void draw()
{
  background(203,233,242);
  
  collidingFigures();
  bodyBounce();
  faceWrap();
  body(x2,y2,wd2,ht2);
  face(x,y,wd,ht);
}



void collidingFigures()
{
  float d = dist(x,y,x2,y2);
  
   if (d < (wd*.5 + wd2*.5)&& d<(ht*.5 +ht2*.5))
  {
    noLoop();
    fill(0);
    textSize(30);
    text("Hi, Im Jim", random(0,800),random(0,800));
    
  }
}

void bodyBounce()
{
  x2 = x2 + bodySpeedx; 
   if ( x2 > width || x2 < 0  ) // too far right?
   {
     bodySpeedx = -bodySpeedx;  // move left
   }
    y2 = y2 + bodySpeedy; 
   if ( y2 > width || y2 < 0  ) // too far right?
   {
     bodySpeedy = -bodySpeedy;  // move left
   }
}

void faceWrap()
{
 x+=faceSpeedx;
  if (x>width)
  {
    x=random(0,800);
  }
  
  y+=faceSpeedy;
  if (y>height)
  {
    y=random(0,700);
  }

}


void body(float x2, float y2, float wd2, float ht2)
{
 fill(0);
 noStroke(); 
 rect(x2,y2,wd2*.5,ht2*.8);
 rect(x2+wd2*.15, y2+ht2*.65, wd2*.15, ht2*1.25);
 rect(x2-wd2*.15, y2+ht2*.65, wd2*.15, ht2*1.25);
 rect(x2-wd2*.25, y2-ht2*.1, wd2*.2,ht2*.6);
 rect(x2+wd2*.25, y2-ht2*.1, wd2*.2,ht2*.6);

 fill(255);
 stroke(255);
 triangle(x2,y2, x2-wd2*.15,y2-ht2*.4, x2+wd2*.15,y2-ht2*.4);

 fill(#9F44C6);
 stroke(#9F44C6);
 strokeWeight(1);
 ellipse(x2, y2-ht2*.15, wd2*.03, ht2*.03);
 ellipse(x2, y2-ht2*.25, wd2*.03, ht2*.03);
 ellipse(x2, y2-ht2*.35, wd2*.03, ht2*.03);
}


void face(float x, float y, float wd, float ht)
{
noStroke();
fill(#F7D3AC);
ellipse(x, y, wd, ht);

//dimples//
noStroke();
fill(#9B652C);//brown//
ellipse(x-wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse(x+wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse( x-wd*.2, y-ht*.12, wd*.17, ht*.13);
ellipse( x+wd*.2, y-ht*.12, wd*.17, ht*.13);
fill(#F7D3AC);//skin//
ellipse(x-wd*.28, y+ht*.16, wd*.13, ht*.13);
ellipse(x+wd*.28, y+ht*.16, wd*.13, ht*.13); 
ellipse( x-wd*.2, y-ht*.13, wd*.2, ht*.13);
ellipse( x+wd*.2, y-ht*.13, wd*.2, ht*.13);

//eyes//
noStroke();
fill(#FFFFFF); //white eye part//
ellipse( x-wd*.15, y-ht*.1, wd*.2, ht*.1);
ellipse(x+wd*.15, y-ht*.1, wd*.2, ht*.1);
noStroke();
fill(#836646); //iris//
ellipse(x-wd*.15, y-ht*.1, wd*.09, ht*.11);
ellipse( x+wd*.2, y-ht*.1, wd*.09, ht*.11);
fill(#030303); //pupil//
ellipse( x-wd*.15, y-ht*.1, wd*.05, ht*.07);
ellipse(x+wd*.2, y-ht*.1, wd*.05, ht*.07);
strokeWeight(8);

//smile//
strokeWeight(7);
stroke(#FF939F);
fill(#FFFFFF);
beginShape();
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.27);
 curveVertex(x-wd*.13, y+ht*.30);
 curveVertex(       x, y+ht*.33);
 curveVertex(x+wd*.13, y+ht*.30);
 curveVertex( x+wd*.2, y+ht*.27);
 curveVertex( x+wd*.2, y+ht*.25);
 curveVertex( x+wd*.2, y+ht*.25);
endShape();

//mustache//
stroke(200);
fill(200);
beginShape();
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex(x-wd*.23, y+ht*.3);
 curveVertex(x-wd*.17, y+ht*.27);
 curveVertex( x-wd*.1, y+ht*.23);
 curveVertex(x-wd*.03, y+ht*.27);
 curveVertex(      x,  y+ht*.27);
 curveVertex(x+wd*.03, y+ht*.27);
 curveVertex( x+wd*.1, y+ht*.23);
 curveVertex(x+wd*.17, y+ht*.27);
 curveVertex(x+wd*.23, y+ht*.3);
 curveVertex( x+wd*.1, y+ht*.1);
 curveVertex( x+wd*.1, y+ht*.1);
endShape();

//nose//
strokeWeight(1);
stroke(#9B652C);
fill(#F7D3AC);
beginShape();
  curveVertex(x-wd*.15, y-ht*.2);//reference point
  curveVertex(x-wd*.07, y-ht*.2);
  curveVertex(x-wd*.05, y+ht*.02);
  curveVertex(x-wd*.1, y+ht*.1);
  curveVertex(x-wd*.11, y+ht*.17);
  curveVertex(x-wd*.06, y+ht*.15);
  curveVertex(x-wd*.03, y+ht*.18);
  curveVertex(   x*.98, y+ht*.19);
  curveVertex(       x, y+ht*.2);
  curveVertex(  x*1.02, y+ht*.19);
  curveVertex(x+wd*.03, y+ht*.18);
  curveVertex(x+wd*.06, y+ht*.15);
  curveVertex(x+wd*.11, y+ht*.17);
  curveVertex(x+wd*.13, y+ht*.16);
  curveVertex( x+wd*.1, y+ht*.1); 
  curveVertex(x+wd*.05, y+ht*.02);
  curveVertex(x+wd*.07, y-ht*.2);
  curveVertex(x+wd*.15, y-ht*.2);//reference point
endShape();
arc( x-wd*.09, y+ht*.13, wd-wd*1.24, ht-ht*1.25,    HALF_PI,    PI+HALF_PI, OPEN);
arc(x+wd*.095, y+ht*.13, wd-wd*1.24, ht-ht*1.25, PI+HALF_PI,TWO_PI+HALF_PI, OPEN);

//ears
fill(#F7D3AC);
noStroke();
ellipse(x-wd*.5, y-ht*.07, wd*.2, ht*.2);
ellipse(x+wd*.5, y-ht*.07, wd*.2, ht*.2);



//glasses//
noFill();
stroke(15);
strokeWeight(7);
fill(#E0FBFF, 125);
beginShape(); //left side//
 curveVertex(x-wd*.37, y-ht*.23);//reference point
 curveVertex(x-wd*.37, y-ht*.23);
 curveVertex(x-wd*.33, y-ht*.1);
 curveVertex(x-wd*.27, y-ht*.03);
 curveVertex(x-wd*.13, y-ht*.03);
 curveVertex(x-wd*.07, y-ht*.1);
 curveVertex(x-wd*.03, y-ht*.23);
 curveVertex(x-wd*.03, y-ht*.23);//reference point
endShape();

beginShape();//right side//
 curveVertex(x+wd*.03, y-ht*.23);//reference point
 curveVertex(x+wd*.03, y-ht*.23);
 curveVertex(x+wd*.07, y-ht*.1);
 curveVertex(x+wd*.13, y-ht*.03);
 curveVertex(x+wd*.27, y-ht*.03);
 curveVertex(x+wd*.33, y-ht*.1);
 curveVertex(x+wd*.37, y-ht*.23);
 curveVertex(x+wd*.37, y-ht*.23);//reference point
endShape();
line(x-wd*.5, y-ht*.23, x+wd*.5, y-ht*.23);

}

void keyPressed()
{
  if (key=='f')
  {
    bodySpeedx++;
  }
  else if (key=='s')
  {
    bodySpeedx--;
  }
  else if (key=='e')
  {
    bodySpeedy++;
  }
  else if (key=='d')
  {
    bodySpeedy--;
  }
  
  else if (key=='k')
  {
    faceSpeedx++;
  }
  else if (key=='h')
  {
    faceSpeedx--;
  }
  else if (key=='u')
  {
    faceSpeedy++;
  }
  else if (key=='j')
  {
    faceSpeedy--;
  }
  
  
  else if (key==' ')
  {
    loop();
    x= random(0,800);
    y= random(0,800);
    x2=random(0,800);
    y2=random(0,800);
  }  
}


