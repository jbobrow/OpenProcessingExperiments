
// copyright Yasha Mushtaq Mir
// Sep-16th/13
// Pittsburgh, PA
// HW_5 Jim caught the dog

void setup()
{
  size(600,600);
  textSize(24);
}

void draw()
{
 workit(); 
}

void linez()
{ 
 stroke(157,156,156);
 line(width*.33,0,width*.33,height);
 line(width*.66,0,width*.66,height);
}

void workit ()
{
  if (mouseX<width*.33)
  {
    dog (mouseY,mouseX);
  }
  else if (mouseX<width*.66)
  {
    caricature (mouseY, mouseX, width-mouseY, width-mouseX);
  }
  else
  {
    background (255,0);
    text("that's all folks !!", width*.35,height*.5);
  }
}

void dog(float x, float y)
{
 background (255,0);
 linez ();
 // shadow bird
 stroke(57,102,188);
 fill (145,100,157);
 triangle(x+100,y+100,random(400),random(400),random(400),random(400));
 //bird
 stroke(57,102,188);
 fill (219,130,194);
 triangle(x,y, random(200), random(200), random(200),random(200));
 //dog
 fill (157, 151, 138);
 stroke(255);
 triangle (x, y, 350, 200, 350, 350);
 ellipse (x, y, 50,50);
 triangle (300, 150, 350, 200, 300, 200); 
}

void caricature(float x, float y, float wd, float ht)
{
background (255,0);
linez();
strokeWeight(6);
stroke (224, 204, 152);
line (x+wd*.25,y+ht*.45,x+wd*.1,y+ht*.95);
fill(224, 204, 152);
noStroke();
beginShape( );
curveVertex (x-wd*.45,y-ht*.4);
curveVertex (x-wd*.45,y-ht*.35);
curveVertex (x-wd*.4,y+ht*.25);
curveVertex (x-wd*.25,y+ht*.5);
curveVertex (x,y+ht*.6);
curveVertex (x+wd*.25,y+ht*.5);
curveVertex (x+wd*.4,y+ht*.25);
curveVertex (x+wd*.45,y-ht*.35);
curveVertex (x+wd*.45,y-ht*.4);
endShape( );
 
//Hair
strokeWeight(1);
fill (72, 49, 49);
rect (x-wd*.48, y-ht*0.6, wd*.95, ht*0.25, wd*0.8, ht*.3, 0, 0);
 
//'M' Eyebrows
stroke(64,49,36);
strokeWeight(3);
strokeCap(SQUARE);
line (x-wd*.4,y-ht*.2,x-wd*.2,y-ht*.35);
line (x+wd*.4,y-ht*.2,x+wd*.2,y-ht*.35);
noFill();
strokeWeight(6);
arc (x, y-ht*.5, wd*0.5, ht*0.5, radians(37), radians(143));
 
//Eyes
fill(107,129,234,75);
strokeWeight(1);
ellipse (x-wd*.2,y-ht*.2,wd*.4,ht*.2);
ellipse (x+wd*.2,y-ht*.2,wd*.4,ht*.2);
 
stroke (255);
fill (38, 43, 62);
ellipse (x-wd*.2,y-ht*.2,wd*.05,ht*.1);
ellipse (x+wd*.2,y-ht*.2,wd*.05,ht*.1);
 
//'M' Moustache
noStroke();
fill (72, 49, 49);
beginShape( );
curveVertex (x-wd*.55,y+ht*.5);
curveVertex (x-wd*.5,y+ht*0.45);
curveVertex (x-wd*.3,y+ht*0.25);
curveVertex (x-wd*.1,y+ht*.2);
curveVertex (x,y+ht*.25);
curveVertex (x+wd*.1,y+ht*.2);
curveVertex (x+wd*.3,y+ht*0.25);
curveVertex (x+wd*.5,y+ht*0.45);
curveVertex (x+wd*.55,y+ht*0.5);
endShape( );
noFill();   
}


