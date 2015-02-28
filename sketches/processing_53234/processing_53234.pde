

 
PShape mleft;
PShape mright;
PShape mleftcorner;
PShape mmid;
PShape mrightbar;
PShape mrightcorner;

float mleft_x, mleft_y;
float mright_x, mright_y;
float mleftcorner_x, mleftcorner_y;
float mmid_x, mmid_y;
float mrightbar_x, mrightbar_y;
float mrightcorner_x, mrightcorner_y;
float e_easing = 0.5;
 
void setup()
{
  size(700, 500);
  rectMode(CENTER);
  fill(215);
  smooth();
  mleft= loadShape ("mleft.svg");
  mright= loadShape ("mright.svg");
  mleftcorner= loadShape ("mleftcorner.svg");
  mmid= loadShape ("mmid.svg");
  mrightbar= loadShape ("mrightbar.svg");
  mrightcorner = loadShape ("mrightcorner.svg");
 
 // starting points for all shapes
  mleft_x = 80; 
  mleft_y = 40; 
  mright_x = 160;
  mright_y = 160;
  mleftcorner_x = 25;
  mleftcorner_y = 400;
  mmid_x = 300;
  mmid_y = 450;
  mrightbar_x = 600;
  mrightbar_y = 25;
  mrightcorner_x = 540;
  mrightcorner_y = 200;
}
 
void draw()
{
  background(50);
  mleftShift(mouseX);
  mrightShift(mouseX);
  mleftcornerShift(mouseX);
  mmidShift(mouseX);
  mrightbarShift(mouseX);
  mrightcornerShift(mouseX);
  
}
 
// top left shape of M 
void mleftShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 80, 45);
  float targetY = map(mx, 0, width, 40, 145); 
 
  mleft_x += (targetX - mleft_x) * e_easing;
  mleft_y += (targetY - mleft_y) * e_easing;
  
 
  translate(mleft_x, mleft_y);
  shape(mleft);
  popMatrix();
}

// top right shape of M
void mrightShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 360, 140);
  float targetY = map(mx, 0, width, 160, 145); 
 
  mright_x += (targetX - mright_x) * e_easing;
  mright_y += (targetY - mright_y) * e_easing;
  
 
  translate(mright_x, mright_y);
  shape(mright);
  popMatrix();
}

// bottom right corner of M
void mleftcornerShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 25, 45);
  float targetY = map(mx, 0, width, 400, 240); 
 
  mleftcorner_x += (targetX - mleftcorner_x) * e_easing;
  mleftcorner_y += (targetY - mleftcorner_y) * e_easing;
  
 
  translate(mleftcorner_x, mleftcorner_y);
  shape(mleftcorner);
  popMatrix();
}

// middle v shape of M
void mmidShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 300, 86);
  float targetY = map(mx, 0, width, 450, 189); 
 
  mmid_x += (targetX - mmid_x) * e_easing;
  mmid_y += (targetY - mmid_y) * e_easing;
  
 
  translate(mmid_x, mmid_y);
  shape(mmid);
  popMatrix();
}

// long right bar of M
void mrightbarShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 600, 175);
  float targetY = map(mx, 0, width, 25, 194); 
 
  mrightbar_x += (targetX - mrightbar_x) * e_easing;
  mrightbar_y += (targetY - mrightbar_y) * e_easing;
  
 
  translate(mrightbar_x, mrightbar_y);
  shape(mrightbar);
  popMatrix();
}

// bottom right small rec of M
void mrightcornerShift(float mx)
{ 
  pushMatrix();
  float targetX = map(mx, 0, width, 540, 175);
  float targetY = map(mx, 0, width, 200, 265); 
 
  mrightcorner_x += (targetX - mrightcorner_x) * e_easing;
  mrightcorner_y += (targetY - mrightcorner_y) * e_easing;
  
 
  translate(mrightcorner_x, mrightcorner_y);
  shape(mrightcorner);
  popMatrix();
}


