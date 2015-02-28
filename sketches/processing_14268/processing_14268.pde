
int f;

void setup() {
size(600,600);
noStroke();
smooth();
noFill();
}


void draw() {
  background(0);
  float mapColorG =  map(mouseX, 0, 600, 0, 255);
   float mapColorB =  map(mouseX, 0, 600, 0, 255);
   fill(0, mapColorG, mapColorB);
  rect (0, 0, width, height); //black line


for (int y=0; y <= height; y +=40){
  for (int x= 0; x <= width; x +=40){
    fill (196,142,255,144);
    ellipse(x,y,40,40);
  }
}


int y = 100;

stroke(224);
strokeWeight(2);
ellipse(y,y,y,y);


stroke(222);
strokeWeight(4);
ellipse(y,y,200,200);

stroke(220);
strokeWeight(8);
ellipse(y,y,450,450);

stroke(234,214,255);
strokeWeight(15);

ellipse(y,y,900,900);

//core
noStroke();
fill(183,131,240);
ellipse(y,y,40,40);


int b= 60;
int c= 40;
int v= 300;
int p= 350;
int m= 800;
int e= 440;
int f= 700;
int h= 780;

fill(129,42,149);
ellipse(e,e,b,b);

stroke(206,160,216);
noFill();
strokeWeight(8);
ellipse(e,e,p,p);
strokeWeight(4);
ellipse(e,e,v,v);
strokeWeight(6);
ellipse(e,e,m,m);
strokeWeight(1);
ellipse(e,e,f,f);
strokeWeight(2);
ellipse(e,e,h,h);


int d= 400;

//first one
fill(51,242,196);
noStroke();
smooth();
quad(0,300,140,160,160,180,0,340);

//line 2
fill(195,112,214);
quad(d,180,580,0,620,0,420,200);
quad(420,200,600,380,600,420,d,220);

//little pruple one
fill(195,112,214);
quad(e,200,480,160,520,200,480,240);
quad(320,200,360,160,400,200,360,240);

//pink
fill(234,85,217);
quad(280,d,d,280,440,320,320,e);

fill(129,42,149);
quad(240,600,380,460,e,520,360,600);
quad(460,380,600,240,600,360,520,e);



//Black middle one
if (mousePressed && insideQuad(60,300,300,60,440,200,200,440)) {
    f = 256 ;
  }
  else {
    f= 0;
  }
  fill(f);
  quad(60,300,300,60,440,200,200,440);
}

boolean insideQuad(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
  return insideTriangle(x0, y0, x1, y1, x2, y2) || insideTriangle(x2, y2, x3, y3, x0, y0);
}

boolean insideTriangle(float x0, float y0, float x1, float y1, float x2, float y2) {
 
  float dx0 = x1 - x0;
  float dy0 = y1 - y0;
  
  float dx1 = x2 - x0;
  float dy1 = y2 - y0;
  
  float dx2 = mouseX - x0;
  float dy2 = mouseY - y0;

  float dot00 = dx0 * dx0 + dy0 * dy0;
  float dot01 = dx0 * dx1 + dy0 * dy1;
  float dot02 = dx0 * dx2 + dy0 * dy2;
  float dot11 = dx1 * dx1 + dy1 * dy1;
  float dot12 = dx1 * dx2 + dy1 * dy2;

 float invDenom = 1.0f / (dot00 * dot11 - dot01 * dot01);
  float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  float v = (dot00 * dot12 - dot01 * dot02) * invDenom;
return (u > 0) && (v > 0) && (u + v < 1);

}


