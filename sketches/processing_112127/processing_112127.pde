
//Homework 5
//Amy Friedman
//amyfried
//copyright Amy Friedman Sept 2013
//star coding comes from not_55 on processing forum
//"f" key pressed the clouds speed increases
//'s' key pressed the clouds speed decreases
//'n' key pressed causes night time
//if mouse x>200 then jim has a bowtie
//if mouse x<200 then jim has a hat

float x,y,wd,ht,xi,yi,wdi,hti,dx;
int iLoop1;
int iNumStars = 100;
int[][] iStars = new int[iNumStars][4];

PImage cloud;

void setup()
{
size(400,400);
rectMode (CENTER);

x= width/2;
y= height/2;
wd= width*.375;
ht= height*.375; 
xi= width/2;
yi= height/2;
wdi= width*.375;
hti= height*.375;
dx= 5;

cloud = loadImage("images.png");

 //init array
  for (iLoop1=0; iLoop1<iNumStars; iLoop1++) {   

    iStars[iLoop1][0]=int(random(width));
    iStars[iLoop1][1]=int(random(height));
    iStars[iLoop1][2]=int(random(1, 4));
    iStars[iLoop1][3]=int(128 + random(127)); }  
}

void draw()
{
noStroke();
rectMode(CENTER);
fill(#C2F5FA);
rect(200,200,400,400);

image(cloud, xi*.25, yi*.25, wdi*.9,hti*.5);
image(cloud, xi*.85, yi*.85, wdi*.75,hti*.45);
image(cloud, xi+wd,yi+hti, wdi*.55,hti*.35);
image(cloud, xi*.15,yi+hti, wdi*.85,hti*.35);

daytime();
moveClouds();
nightTime();
drawFace(mouseX,mouseY,pmouseX,pmouseY);
}

void daytime()
{
fill(#FFF8AA);
stroke(#F9FAC2);
strokeWeight(random(0,20));
ellipse(x+wd, y-ht, wd*.67, ht*.67);

}
void keyPressed()
{ 
  if ( key == 'f') dx++;
  else if (key  == 's') dx--;
}

void moveClouds()
{ 
  xi= xi+dx;
 if (xi>width + wdi*.5)
 { 
   xi=-wdi*.5;
 }
 else if (xi<-wdi)
  { 
   xi=width + wdi*.5;
  }
 
}
void nightTime ()
{
   if (key == 'n')
  { fill(#08174B);
    noStroke();
    rectMode(CENTER);
    rect(x,y,x*2,y*2);
        fill(#FFFFFF);
    ellipse(x-wd*.93,y-ht,x-wd,y-ht);
    fill(#08174B);
    ellipse( x-wd,y-ht,x-wd,y-ht);
    
     for (iLoop1=0; iLoop1<iNumStars; iLoop1++) 
     {
     fill(iStars[iLoop1][3]);
     ellipse(iStars[iLoop1][0], iStars[iLoop1][1], random(0,4), random(0,4));
     }

  }
  
}


void drawFace(float x, float y, float wd, float ht)
{

  //face shape//
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
stroke(200);
strokeWeight(2);
fill(#FFFFFF); //white eye part//
ellipse( x*.85, y*.9, wd*.2, ht*.1);
ellipse(x*1.15, y*.9, wd*.2, ht*.1);
noStroke();
fill(#836646); //iris//
ellipse(  x*.85, y*.9, wd*.09, ht*.11);
ellipse(x+wd*.2, y*.9, wd*.09, ht*.11);
fill(#030303); //pupil//
ellipse(  x*.85, y*.9, wd*.05, ht*.07);
ellipse(x+wd*.2, y*.9, wd*.05, ht*.07);
strokeWeight(8);
stroke(200);//eyebrows//
line(x*.72, y*.83, x*.9, y*.75);
line(x+wd*.28, y*.83, x+wd*.07, y*.75);

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
arc( x-wd*.09, y+ht*.13, x-wd*1.24, y-ht*1.25,    HALF_PI,    PI+HALF_PI, OPEN);
arc(x+wd*.095, y+ht*.13, x-wd*1.24, y-ht*1.25, PI+HALF_PI,TWO_PI+HALF_PI, OPEN);

//ears
fill(#F7D3AC);
noStroke();
ellipse(x-wd*.5, y-ht*.07, wd*.2, ht*.2);
ellipse(x+wd*.5, y-ht*.07, wd*.2, ht*.2);

//glasses//
noFill();
stroke(random(0,255), random(0,255), random(0,255));
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

  if (mouseX<200)
  { fill(0);
  noStroke();
  rectMode(CENTER);
  rect(x,y-ht*.5, wd*.5, ht*.3);
  stroke(0);
  strokeWeight(30);
  line(x-wd*.35, y-ht*.35, x+wd*.35, y-ht*.35);} 
  
  if (mouseX>200)
  {fill(random(mouseX,mouseY), random(mouseX,mouseY), random(mouseX,mouseY));
noStroke();
ellipse( x, y+ht*.5,    wd*.2,    ht*.2);
triangle(x, y+ht*.5,    x*.75, y+ht*.75,    x*.75, y+ht*.33);
triangle(x, y+ht*.5, x+wd*.33, y+ht*.75, x+wd*.33, y+ht*.33);}
 }
 
 




