

// top line for M and O
PShape leftline;
PShape leftline2;
PShape mvertex;
PShape rightline;
PShape slantlineleft;
PShape slantlineright;
PShape slantlineright2;
PShape tophorzline1;
PShape topleftcorner;
PShape toprightcorner;
PShape tophorzcorner;

// top line x and y
float leftline_x, leftline_y;
float leftline2_x, leftline2_y;
float mvertex_x, mvertex_y;
float rightline_x, rightline_y;
float slantlineleft_x, slantlineleft_y;
float slantlineright_x, slantlineright_y;
float slantlineright2_x, slantlineright2_y;
float tophorzline1_x, tophorzline1_y;
float topleftcorner_x, topleftcorner_y;
float toprightcorner_x, toprightcorner_y;
float toptophorzcorner_x, tophorzcorner_y;

// O Triangles
PShape otri1;
PShape otri2;
PShape otri3;
PShape otri4;

//O triangles x and y
float otri1_x, otri1_y;
float otri2_x, otri2_y;
float otri3_x, otri3_y;
float otri4_x, otri4_y;

// C Triangles
PShape ctri1;
PShape ctri2;
PShape ctri3;
PShape ctri4;

// C Triangles x and y
float ctri1_x, ctri1_y;
float ctri2_x, ctri2_y;
float ctri3_x, ctri3_y;
float ctri4_x, ctri4_y;

// A Triangles
PShape atri1;
PShape atri2;

// A triangles x and y
float atri1_x, atri1_y;
float atri2_x, atri2_y;

// bottom line C and A
PShape bottomline1;
PShape bottomline2;
PShape bottomline3;

// bottom line x and y
float bottomline1_x, bottomline1_y;
float bottomline2_x, bottomline2_y;
float bottomline3_x, bottomline3_y;

float e_easing = 0.02;

float[] randx = new float[24];
float[] randy = new float[24];


void setup()
{
  size(700, 500);
  shapeMode(CENTER);
  smooth();

  
  atri1 = loadShape ("atri1.svg");
  atri2 = loadShape ("atri2.svg");
  bottomline1 = loadShape ("bottomline1.svg");
  bottomline2 = loadShape ("bottomline2.svg");
  bottomline3 = loadShape ("bottomline3.svg");
  ctri1 = loadShape ("ctri1.svg");
  ctri2 = loadShape ("ctri2.svg");
  ctri3 = loadShape ("ctri3.svg");
  ctri4 = loadShape ("ctri4.svg");
  leftline = loadShape ("leftline.svg");
  leftline2 = loadShape ("leftline2.svg");
  mvertex = loadShape ("mvertex.svg");
  rightline = loadShape ("rightline.svg");
  slantlineleft = loadShape ("slantlineleft.svg");
  slantlineright = loadShape ("slantlineright.svg");
  slantlineright2 = loadShape ("slantlineright2.svg");
  tophorzline1 = loadShape ("tophorzline1.svg");
  topleftcorner = loadShape ("topleftcorner.svg");
  toprightcorner = loadShape ("toprightcorner.svg");
  tophorzcorner = loadShape ("tophorzcorner.svg");
  otri1 = loadShape ("otri1.svg");
  otri2 = loadShape ("otri2.svg");
  otri3 = loadShape ("otri3.svg");
  otri4 = loadShape ("otri4.svg");
  
  
  
  float d = 700;
   for(int i=0; i<randx. length; i++)
  {
     randx[i] = random(-d,d);
     randy[i] = random(-d,d);
  }
  
  
 
}

void draw()
{
  
  fill(255, 70);
  noStroke();
  rect(0, 0, width, height);
  drawMOline(width/2-200, height/2-70);
  drawO(width/2-70, height/2-65);
  drawC(width/2, height/2);
  drawA(width/2, height/2);
  drawCAline(width/2, height/2);
  
  
}

/* Parameters:  1. your shape, 2. your input (mouse), 3. starting x, 4. starting y, 5. target x, 6. target y
*/

void drawMOline (float x, float y)
{
  
  
  
 pushMatrix();
  translate(width/2-200, height/2-70);
  shapeTween(leftline, mouseX,  randx[0],randy[0],  -7,45); 
  shapeTween(leftline2, mouseX, randx[3],randy[3],  -7,85);
  shapeTween(mvertex, mouseX, randx[2],randy[2],  44,37);
  shapeTween(rightline, mouseX, randx[1],randy[1],  197, 59);
  shapeTween(slantlineleft, mouseX, randx[4],randy[4],  21,13);
  shapeTween(slantlineright, mouseX, randx[5],randy[5],  66,22);
  shapeTween(slantlineright2, mouseX, randx[6],randy[6],  81, 2);
  shapeTween(tophorzline1, mouseX, randx[7],randy[7],  141, -15);
  shapeTween(topleftcorner, mouseX, randx[8],randy[8],  3,3);
  shapeTween(toprightcorner, mouseX, randx[9],randy[9],  179, 7);
  shapeTween(tophorzcorner, mouseX, randx[23], randy[23], 104, -11);
  popMatrix();   
}

void drawO (float x, float y)
{
 pushMatrix();
 translate(width/2-70, height/2-65);
 shapeTween(otri1, mouseX, randx[10], randy[10], -5, 21);
 shapeTween(otri2, mouseX, randx[11], randy[11], -5, 78);
 shapeTween(otri3, mouseX, randx[12], randy[12], -5.5, 78.2);
 shapeTween(otri4, mouseX, randx[13], randy[13], 40.1, 77.4);
 popMatrix();
}

void drawC(float x, float y)
{
  pushMatrix();
  translate(width/2+50, height/2-64);
  shapeTween(ctri1, mouseX, randx[14], randy[14], 0, 63);
  shapeTween(ctri2, mouseX, randx[15], randy[15], 0, 8);
  shapeTween(ctri3, mouseX, randx[16], randy[16], -1, 6);
  shapeTween(ctri4, mouseX, randx[17], randy[17], 44, 7.4);
  popMatrix();
}

void drawA(float x, float y)
{
  pushMatrix();
  translate(width/2, height/2);
  shapeTween(atri1, mouseX, randx[18], randy[18], 179,-55);
  shapeTween(atri2, mouseX, randx[19], randy[19], 183, 10);
  popMatrix();
 
}

void drawCAline (float x, float y)
{
  pushMatrix();
  translate(width/2, height/2);
  shapeTween(bottomline1, mouseX, randx[20], randy[20], 50, 40);
  shapeTween(bottomline2, mouseX, randx[21], randy[21], 102, 24);
  shapeTween(bottomline3, mouseX, randx[22], randy[22], 141, -7);
  popMatrix();
}
 


void shapeTween(PShape ps, float mx, float startx, float starty, float targetx, float targety)

{
  pushMatrix();

  mx = constrain(mx, 0,width-50);
  float x = map( mx, 0,width-50, startx, targetx);
  float y = map( mx, 0,width-50, starty, targety);
  
  x += (targetx - x) * e_easing;
  y += (targety - y) * e_easing;

  translate(x, y);
  shape(ps, 0,0);
  popMatrix();
}

