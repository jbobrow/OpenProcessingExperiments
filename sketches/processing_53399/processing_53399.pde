

// M PShape
PShape mleft;
PShape mright;
PShape mleftcorner;
PShape mmid;
PShape mrightbar;
PShape mrightcorner;

// M x and y
float mleft_x, mleft_y;
float mright_x, mright_y;
float mleftcorner_x, mleftcorner_y;
float mmid_x, mmid_y;
float mrightbar_x, mrightbar_y;
float mrightcorner_x, mrightcorner_y;

// O Pshape
PShape otopleft;
PShape obottomleft;
PShape obottomright;
PShape obottomsml;
PShape otopright;

// O x and y
float otopleft_x, otopleft_y;
float obottomleft_x, obottomleft_y;
float obottomright_x, obottomright_y;
float obottomsml_x, obottomsml_y;
float otopright_x, otopright_y;

// C Pshape
PShape cbottomleft;
PShape cbottomright;
PShape crightsml;
PShape ctopleft;
PShape ctopright;

// C x and y
float cbottomleft_x, cbottomleft_y;
float cbottomright_x, cbottomright_y;
float crightsml_x, crightsml_y;
float ctopleft_x, ctopleft_y;
float ctopright_x, ctopright_y;

// A Pshape
PShape atopleft;
PShape abottomleft;
PShape atopright;
PShape atop;
PShape arightsml;

// A x and y
float abottomleft_x, abottomleft_y;
float atop_x, atop_y;
float arightsml_x, arightsml_y;
float atopleft_x, atopleft_y;
float atopright_x, atopright_y;


float e_easing = 0.01;

float[] randx = new float[21];
float[] randy = new float[21];
 
void setup()
{
  size(700, 500);
  shapeMode(CENTER);
  fill(215);
  smooth();
  mleft= loadShape ("mleft.svg");
  mright= loadShape ("mright.svg");
  mleftcorner= loadShape ("mleftcorner.svg");
  mmid= loadShape ("mmid.svg");
  mrightbar= loadShape ("mrightbar.svg");
  mrightcorner = loadShape ("mrightcorner.svg");
  otopleft = loadShape ("otopleft.svg");
  obottomleft = loadShape ("obottomleft.svg");
  obottomright = loadShape ("obottomright.svg");
  obottomsml= loadShape ("obottomsml.svg");
  otopright = loadShape ("otopright.svg");
  cbottomleft = loadShape ("cbottomleft.svg");
  cbottomright = loadShape ("cbottomright.svg");
  crightsml = loadShape ("crightsml.svg");
  ctopleft = loadShape ("ctopleft.svg");
  ctopright = loadShape ("ctopright.svg");
  atop = loadShape ("atop.svg");
  atopleft = loadShape ("atopleft.svg");
  abottomleft = loadShape ("abottomleft.svg");
  atopright = loadShape ("atopright.svg");
  arightsml = loadShape ("arightsml.svg");
  
   for(int i=0; i<randx. length; i++)
  {
     randx[i] = random(-width,width);
     randy[i] = random(-height,height);
  }
 
}
 
 
void draw()
{
  background(255);
  // Translate to the center and draw the M components
  
  
  pushMatrix();
  translate(125,200);
  shapeTween(mleft, mouseX,  randx[0],randy[0],  -32,-4); // the starting points are taken from the list of random numbers
  shapeTween(mright, mouseX, randx[1],randy[1],  60, -11);
  shapeTween(mleftcorner, mouseX, randx[2],randy[2],  -51.5, 64);
  shapeTween(mmid, mouseX, randx[3],randy[3],  8, 23);
  shapeTween(mrightbar, mouseX, randx[4],randy[4],  76, 30);
  shapeTween(mrightcorner, mouseX, randx[5],randy[5],  76, 75);
  popMatrix();
  
  pushMatrix();
  translate(310,200);
  shapeTween(otopleft, mouseX, randx[6], randy[6], -30, -27);
  shapeTween(obottomleft, mouseX, randx[7], randy[7], -39.8, 35.5);
  shapeTween(otopright, mouseX, randx[8], randy[8], 25, -6.8);
  shapeTween(obottomright, mouseX, randx[9], randy[9], 24, 55);
  shapeTween(obottomsml, mouseX, randx[10], randy[10], -11, 70.7);
  popMatrix();
  
  pushMatrix();
  translate(450,200);
  shapeTween(ctopleft, mouseX, randx[11], randy[11], -30, -27);
  shapeTween(cbottomleft, mouseX, randx[12], randy[12], -20, 62);
  shapeTween(ctopright, mouseX, randx[13], randy[13], 20,-30.5);
  shapeTween(cbottomright, mouseX, randx[14], randy[14], 34.5, 45);
  shapeTween(crightsml, mouseX, randx[15], randy[15], 44.5, 0);
  popMatrix();
  
  pushMatrix();
  translate(570,200);
  shapeTween(atop, mouseX, randx[16], randy[16], 30, -26);
  shapeTween(atopleft, mouseX, randx[17], randy[17], -0.5, 0);
  shapeTween(abottomleft, mouseX, randx[18], randy[18], -4.9, 56);
  shapeTween(atopright, mouseX, randx[19], randy[19], 55.4, 36.2 );
  shapeTween(arightsml, mouseX, randx[20], randy[20], 69.5, 82);
  popMatrix();
  
}
/* Parameters:  1. your shape, 2. your input (mouse), 3. starting x, 4. starting y, 5. target x, 6. target y
*/

void shapeTween(PShape ps, float mx, float startx, float starty, float targetx, float targety)

{
  pushMatrix();

  mx = constrain(mx, 0,width-50);
  float x = map( mx, 0,width-50, startx, targetx);
  float y = map( mx, 0,width-50, starty, targety);
  
  x += (targetx - x) * e_easing;
  y += (targety - y) * e_easing;

 // I removed the easing equation so things would be easier to see right now. 
  translate(x, y);
  shape(ps, 0,0);
  popMatrix();
}

