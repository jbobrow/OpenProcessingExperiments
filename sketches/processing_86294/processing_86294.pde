
float a;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
float k;
float l;
float m;
float n;

void setup () {
  size (500,500);
  smooth ();
  
  a = random(0,width);
  b = random(0,height);
  c = random(0,width);
  d = random(0,height);
  e = random(0,width);
  f = random(0,height);
  g = random(0,width);
  h = random(0,height);
  i = random(0,width);
  j = random(0,height);
  k = random(0,width);
  l = random(0,height);
  m = random(0,width);
  n = random(0,height);
  /*
  a = random(0,width);
  b = random(0,height);
  c = random(0,width);
  d = random(0,height);
  e = random(0,width);
  f = random(0,height);
  g = random(0,width);
  h = random(0,height);
  i = random(0,width);
  j = random(0,height);
  k = random(0,width);
  l = random(0,height);
  m = random(0,width);
  n = random(0,height);
  */
  
  fill (0);
  rect (0,0,width,height);
}

void draw () {
  
  noStroke ();
  fill (0);
  rect (0,0,width,height);
  
  
  
  //   INT
  
  
  
  int rand;
  rand = (1/4)+(mouseX/25);
  int rand2;
  rand2 = rand/2;
  
  int tc;
  tc = 15;
  
  int sw;
  sw = 1;
  
  int dplch;
  dplch = 0;
  int dplcv;
  dplcv = 0;
  
  color cq = color (255,25);
  color ce = color (255);
  color cl = color (255);
  
  
  
  
  
  a = a + random(0,rand) - rand/2 + dplch;
  if (a < 0) { 
  a = width/2;}
  if (a > width) { 
  a = random(0,width);}
  
  b = b + random(0,rand) - rand/2 + dplcv;
  if (b < 0) { 
  b = height/2;}
  if (b > height) { 
  b = random(0,height);}
  
  c = c + random(0,rand) - rand/2 + dplch;
  if (c < 0) { 
  c = width/2;}
  if (c > width) { 
  c = random(0,width);}
  
  d = d + random(0,rand) - rand/2 + dplcv;
  if (d < 0) { 
  d = height/2;}
  if (d > height) { 
  d = random(0,height);}
  
  e = e + random(0,rand) - rand/2 + dplch;
  if (e < 0) { 
  e = width/2;}
  if (e > width) { 
  e = random(0,width);}
  
  f = f + random(0,rand) - rand/2 + dplcv;
  if (f < 0) { 
  f = height/2;}
  if (f > height) { 
  f = random(0,height);}
  
  g = g + random(0,rand) - rand/2 + dplch;
  if (g < 0) { 
  g = width/2;}
  if (g > width) { 
  g = random(0,width);}
  
  h = h + random(0,rand) - rand/2 + dplcv;
  if (h < 0) { 
  h = height/2;}
  if (h > height) { 
  h = random(0,height);}
  
  i = i + random(0,rand) - rand/2 + dplch;
  if (i < 0) { 
  i = width/2;}
  if (i > width) { 
  i = random(0,width);}
  
  j = j + random(0,rand) - rand/2 + dplcv;
  if (j < 0) { 
  j = height/2;}
  if (j > height) { 
  j = random(0,height);}
  
  k = k + random(0,rand) - rand/2 + dplch;
  if (k < 0) { 
  k = width/2;}
  if (k > width) { 
  k = random(0,width);}
  
  l = l + random(0,rand) - rand/2 + dplcv;
  if (l < 0) { 
  l = height/2;}
  if (l > height) { 
  l = random(0,height);}
  
  m = m + random(0,rand) - rand/2 + dplch;
  if (m < 0) { 
  m = width/2;}
  if (m > width) { 
  m = random(0,width);}
  
  n = n + random(0,rand) - rand/2 + dplcv;
  if (n < 0) { 
  n = height/2;}
  if (n > height) { 
  n = random(0,height);}
  
  
  
  //   quad
  
  
  
  fill (cq);
  //   a,b,c,d
  quad (a,b,c,d,e,f,g,h);
  quad (a,b,c,d,e,f,i,j);
  quad (a,b,c,d,e,f,k,l);
  quad (a,b,c,d,e,f,m,n);
  quad (a,b,c,d,g,h,i,j);
  quad (a,b,c,d,g,h,k,l);
  quad (a,b,c,d,g,h,m,n);
  quad (a,b,c,d,i,j,k,l);
  quad (a,b,c,d,i,j,m,n);
  quad (a,b,c,d,k,l,m,n);
  //a,b,e,f
  quad (a,b,e,f,g,h,i,j);
  quad (a,b,e,f,g,h,k,l);
  quad (a,b,e,f,g,h,m,n);
  //a,b,g,h
  quad (a,b,g,h,i,j,k,l);
  quad (a,b,g,h,i,j,m,n);
  quad (a,b,g,h,m,n,k,l);
  //a,b,i,j
  quad (a,b,i,j,k,l,m,n);
  //c,d,e,f
  quad (c,d,e,f,g,h,i,j);
  quad (c,d,e,f,g,h,k,l);
  quad (c,d,e,f,g,h,m,n);
  quad (c,d,e,f,i,j,k,l);
  quad (c,d,e,f,i,j,m,n);
  quad (c,d,e,f,k,l,m,n);
  //e,f,g,h
  quad (e,f,g,h,i,j,k,l);
  quad (e,f,g,h,i,j,m,n);
  quad (e,f,g,h,k,l,m,n);
  // g,h,i,j
  quad (g,h,i,j,k,l,m,n);
  
  
  
  //   ellipses
  
  
  
  fill (ce);
  ellipse (a,b,tc*1,tc*1);
  ellipse (c,d,tc*1,tc*1);
  ellipse (e,f,tc*1,tc*1);
  ellipse (g,h,tc*1,tc*1);
  ellipse (i,j,tc*1,tc*1);
  ellipse (k,l,tc*1,tc*1);
  ellipse (m,n,tc*1,tc*1);
  
  
  
  //   lines
  
  
  
  strokeWeight (sw);
  stroke (cl);
  line (a,b,c,d);
  line (a,b,e,f);
  line (a,b,g,h);
  line (a,b,i,j);
  line (a,b,k,l);
  line (a,b,m,n);
  
  line (c,d,e,f);
  line (c,d,g,h);
  line (c,d,i,j);
  line (c,d,k,l);
  line (c,d,m,n);
  
  line (e,f,g,h);
  line (e,f,i,j);
  line (e,f,k,l);
  line (e,f,m,n);
  
  line (g,h,i,j);
  line (g,h,k,l);
  line (g,h,m,n);
  
  line (i,j,k,l);
  line (i,j,m,n);
  
  line (k,l,m,n);
  
  
  
  //   texte
  
  
  
  text (1,a,b-10);
  text (2,c,d-10);
  text (3,e,f-10);
  text (4,g,h-10);
  text (5,i,j-10);
  text (6,k,l-10);
  text (7,m,n-10);
  
  
}
