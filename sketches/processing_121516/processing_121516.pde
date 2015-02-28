
float therotate = 0;
float lightcolour = 0;
float strokeblackwhite = 0;
float strokethick = 10;


void setup()
{
size(1200, 800, P3D);
}

void draw()
{
  background(255,255,255);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  
  
  if (mousePressed) {
    directionalLight(random(255), random(255), random(255), 0, -1, -1);
 background(0,0,0,200);
  }
  

translate(width/2, height/2, 0);
rotateY(therotate);
rotateX(therotate);
rotateZ(therotate);
//lights();
fill(255,0,0);
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(200,300,100);



translate(100, -100, 100);
rotateY(therotate);
rotateX(therotate);
//rotateZ(therotate);
//lights();
fill(255,255,0);
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(100);

translate(200, -200, 0);
rotateY(therotate);
//rotateX(therotate);
rotateZ(therotate);
//lights();
fill(255,0,0);
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(100,50,50);

translate(0, 0, 0);
rotateY(therotate);
rotateX(therotate);
//rotateZ(therotate);
//lights();
noFill();
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(400,100,800);

translate(-100, 100,0);
//rotateY(therotate);
rotateX(therotate);
rotateZ(therotate);
//lights();
fill(0,0,255);
strokeWeight(strokethick);
//strokeJoin(MITER);
strokeCap(PROJECT);
stroke(strokeblackwhite);
box(300,100,200);

translate(-100, 0, 0);
//rotateY(therotate);
//rotateX(therotate);
rotateZ(therotate);
//lights();
noFill();
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(100,400,600);




translate(300, 100,0);
rotateY(therotate);
//rotateX(therotate);
rotateZ(therotate);
//lights();
fill(0,0,255);
strokeWeight(strokethick);
//strokeJoin(MITER);
strokeCap(PROJECT);
stroke(0,0,0);
box(strokeblackwhite);

translate(-400, 0, 0);
//rotateY(therotate);
rotateX(therotate);
//rotateZ(therotate);
//lights();
noFill();
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(800,600,100);




translate(0, 0, -100); 
rotateY(therotate);
//rotateX(therotate);
//lights();
noFill();
strokeWeight(strokethick);
//strokeJoin(MITER);
stroke(strokeblackwhite);
box(300,400,500);

if (mousePressed)
{
  therotate=therotate+(random(0.05));
  //lightcolour = 255;
   strokeblackwhite = random(255);
   strokethick=4;
}
else
{ strokeblackwhite = 0;
strokethick = 20;
}
}


