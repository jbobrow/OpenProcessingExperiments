
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
float o;
float p;

void setup (){
  size (250,250);
  
  a = width/2;
  b = height/2;
  c = width/2;
  d = height/2;
  e = width/2;
  f = height/2;
  g = width/2;
  h = height/2;
  i = width/2;
  j = height/2;
  k = width/2;
  l = height/2;
  m = width/2;
  n = height/2;
  o = width/2;
  p = height/2;
  
  
}

void draw (){
  
  
  
  background (0);
  
  
  
  //   INT
  
  
  //   strokeWeight
  int sw;
  sw = 1;
  
  //   strokeWeight 2
  int sw2;
  sw2 = 1;
  
  //   espacement entre les lignes 1
  int espcl1;
  espcl1 = 2;
  
  //   RANDOM
  int rand;
  rand = (1/4)+(mouseX/25);
  
  int rand2;
  rand2 = rand/2;
  
  
  
  //   COULEURS
  
  
  
  //   couleur lignes
  color cline = color (255,0);
  
  //   couleur lignes 2
  color cline2 = color (255);
  
  //   couleur quad
  color cquad = color (255,100);
  
  //   couleur triangle
  color ctri = color (255,50);
  
  
  
  
  
  //   FLOAT
  
  
  
  a = a + random(0,rand) - rand/2;
  b = b + random(0,rand) - rand/2;
  c = c + random(0,rand) - rand/2;
  d = d + random(0,rand) - rand/2;
  e = e + random(0,rand) - rand/2;
  f = f + random(0,rand) - rand/2;
  g = g + random(0,rand) - rand/2;
  h = h + random(0,rand) - rand/2;
  i = i + random(0,rand) - rand/2;
  j = j + random(0,rand) - rand/2;
  k = k + random(0,rand) - rand/2;
  l = l + random(0,rand) - rand/2;
  m = m + random(0,rand) - rand/2;
  n = n + random(0,rand) - rand/2;
  o = o + random(0,rand) - rand/2;
  p = p + random(0,rand) - rand/2;
  
  //   DEPLACEMENT EN CAS DE DEPASSEMENT
  
  if (a>width){
    a = random (0,width);}
  if (b>height){
    b = random (0,height);}
  if (c>width){
    c = random (0,width);}
  if (d>height){
    d = random (0,height);}
  if (e>width){
    e = random (0,width);}
  if (f>height){
    f = random (0,height);}
  if (g>width){
    g = random (0,width);}
  if (h>height){
    h = random (0,height);}
  if (i>width){
    i = random (0,width);}
  if (j>height){
    j = random (0,height);}
  if (k>width){
    k = random (0,width);}
  if (l>height){
    l = random (0,height);}
  if (m>width){
    m = random (0,width);}
  if (n>height){
    n = random (0,height);}
  if (o>width){
    o = random (0,width);}
  if (p>height){
    p = random (0,height);}
  
  if (a<0){
    a = random (0,width);}
  if (b<0){
    b = random (0,height);}
  if (c<0){
    c = random (0,width);}
  if (d<0){
    d = random (0,height);}
  if (e<0){
    e = random (0,width);}
  if (f<0){
    f = random (0,height);}
  if (g<0){
    g = random (0,width);}
  if (h<0){
    h = random (0,height);}
  if (i<0){
    i = random (0,width);}
  if (j<0){
    j = random (0,height);}
  if (k<0){
    k = random (0,width);}
  if (l<0){
    l = random (0,height);}
  if (m<0){
    m = random (0,width);}
  if (n<0){
    n = random (0,height);}
  if (o<0){
    o = random (0,width);}
  if (p<0){
    p = random (0,height);}
  
  
  
  //   depassement dans la forme
  
  
  if (a>c){
    a = random (0,width);
    c = random (0,width);}
  if (a>e){
    a = random (0,width);
    e = random (0,width);}
  if (a>g){
    a = random (0,width);
    g = random (0,width);}
  
  if (i>e){
    i = random (0,width);
    e = random (0,width);}
  if (i>k){
    i = random (0,width);
    k = random (0,width);}
  
  if (e>c){
    e = random (0,width);
    c = random (0,width);}
  if (e>g){
    e = random (0,width);
    g = random (0,width);}
    
  if (c>g){
    c = random (0,width);
    g = random (0,width);}
  
  if (k>g){
    k = random (0,width);
    g = random (0,width);}
  
  if (g>m){
    g = random (0,width);
    m = random (0,width);}
  if (g>o){
    g = random (0,width);
    o = random (0,width);}
  
  
  
  if (b>d){
    b = random (0,height);
    d = random (0,height);}
  if (b>f){
    b = random (0,height);
    f = random (0,height);}
  if (b>h){
    b = random (0,height);
    h = random (0,height);}
    
  if (d>f){
    d = random (0,height);
    f = random (0,height);}
  if (d>h){
    d = random (0,height);
    h = random (0,height);}
  if (d>n){
    d = random (0,height);
    n = random (0,height);}
  
  if (f>h){
    f = random (0,height);
    h = random (0,height);}
  if (f>j){
    f = random (0,height);
    j = random (0,height);}
  
  if (h>l){
    h = random (0,height);
    l = random (0,height);}
  if (h>p){
    h = random (0,height);
    p = random (0,height);}
  
  if (n>p){
    n = random (0,height);
    p = random (0,height);}
  
  
  
  
  
  
  
  
  //     DRAW     DRAW     DRAW     DRAW     DRAW
  
  
  
  
  
  //   QUAD 1
  stroke (cline);
  strokeWeight (sw);
  fill (cquad);
  
  quad (a,b,c,d,g,h,e,f);
  quad (a,b,c,d,g,h,e,f);
  quad (a,b,c,d,g,h,e,f);
  
  //   QUAD 2
  stroke (cline);
  strokeWeight (sw);
  fill (cquad);
  
  quad (e,f,g,h,k,l,i,j);
  quad (e,f,g,h,k,l,i,j);
  
  //   QUAD 3
  stroke (cline);
  strokeWeight (sw);
  fill (cquad);
  
  quad (c,d,m,n,o,p,g,h);
  
  //   QUAD 
  stroke (cline);
  strokeWeight (sw);
  fill (cquad);
  
  quad (m,n,o,p,k,l,i,j);
  
  
  //   TRIANGLE
  fill (ctri);
  triangle (g,h,o,p,k,l);
  
  
  //   LINES
  stroke (cline2);
  strokeWeight (sw2);
  
  
  line (a+((c-a)/19),b+((d-b)/19),e+((g-e)/19),f+((h-f)/19));
  line (a+((c-a)/19)*2,b+((d-b)/19)*2,e+((g-e)/19)*2,f+((h-f)/19)*2);
  line (a+((c-a)/19)*3,b+((d-b)/19)*3,e+((g-e)/19)*3,f+((h-f)/19)*3);
  line (a+((c-a)/19)*4,b+((d-b)/19)*4,e+((g-e)/19)*4,f+((h-f)/19)*4);
  line (a+((c-a)/19)*5,b+((d-b)/19)*5,e+((g-e)/19)*5,f+((h-f)/19)*5);
  line (a+((c-a)/19)*6,b+((d-b)/19)*6,e+((g-e)/19)*6,f+((h-f)/19)*6);
  line (a+((c-a)/19)*7,b+((d-b)/19)*7,e+((g-e)/19)*7,f+((h-f)/19)*7);
  line (a+((c-a)/19)*8,b+((d-b)/19)*8,e+((g-e)/19)*8,f+((h-f)/19)*8);
  line (a+((c-a)/19)*9,b+((d-b)/19)*9,e+((g-e)/19)*9,f+((h-f)/19)*9);
  line (a+((c-a)/19)*10,b+((d-b)/19)*10,e+((g-e)/19)*10,f+((h-f)/19)*10);
  line (a+((c-a)/19)*11,b+((d-b)/19)*11,e+((g-e)/19)*11,f+((h-f)/19)*11);
  line (a+((c-a)/19)*12,b+((d-b)/19)*12,e+((g-e)/19)*12,f+((h-f)/19)*12);
  line (a+((c-a)/19)*13,b+((d-b)/19)*13,e+((g-e)/19)*13,f+((h-f)/19)*13);
  line (a+((c-a)/19)*14,b+((d-b)/19)*14,e+((g-e)/19)*14,f+((h-f)/19)*14);
  line (a+((c-a)/19)*15,b+((d-b)/19)*15,e+((g-e)/19)*15,f+((h-f)/19)*15);
  line (a+((c-a)/19)*16,b+((d-b)/19)*16,e+((g-e)/19)*16,f+((h-f)/19)*16);
  line (a+((c-a)/19)*17,b+((d-b)/19)*17,e+((g-e)/19)*17,f+((h-f)/19)*17);
  line (a+((c-a)/19)*18,b+((d-b)/19)*18,e+((g-e)/19)*18,f+((h-f)/19)*18);
  line (a+((c-a)/19)*19,b+((d-b)/19)*19,e+((g-e)/19)*19,f+((h-f)/19)*19);
  
  
  line (i+((e-i)/19),j+((f-j)/19),k+((g-k)/19),l+((h-l)/19));
  line (i+((e-i)/19)*2,j+((f-j)/19)*2,k+((g-k)/19)*2,l+((h-l)/19)*2);
  line (i+((e-i)/19)*3,j+((f-j)/19)*3,k+((g-k)/19)*3,l+((h-l)/19)*3);
  line (i+((e-i)/19)*4,j+((f-j)/19)*4,k+((g-k)/19)*4,l+((h-l)/19)*4);
  line (i+((e-i)/19)*5,j+((f-j)/19)*5,k+((g-k)/19)*5,l+((h-l)/19)*5);
  line (i+((e-i)/19)*6,j+((f-j)/19)*6,k+((g-k)/19)*6,l+((h-l)/19)*6);
  line (i+((e-i)/19)*7,j+((f-j)/19)*7,k+((g-k)/19)*7,l+((h-l)/19)*7);
  line (i+((e-i)/19)*8,j+((f-j)/19)*8,k+((g-k)/19)*8,l+((h-l)/19)*8);
  line (i+((e-i)/19)*9,j+((f-j)/19)*9,k+((g-k)/19)*9,l+((h-l)/19)*9);
  line (i+((e-i)/19)*10,j+((f-j)/19)*10,k+((g-k)/19)*10,l+((h-l)/19)*10);
  line (i+((e-i)/19)*11,j+((f-j)/19)*11,k+((g-k)/19)*11,l+((h-l)/19)*11);
  line (i+((e-i)/19)*12,j+((f-j)/19)*12,k+((g-k)/19)*12,l+((h-l)/19)*12);
  line (i+((e-i)/19)*13,j+((f-j)/19)*13,k+((g-k)/19)*13,l+((h-l)/19)*13);
  line (i+((e-i)/19)*14,j+((f-j)/19)*14,k+((g-k)/19)*14,l+((h-l)/19)*14);
  line (i+((e-i)/19)*15,j+((f-j)/19)*15,k+((g-k)/19)*15,l+((h-l)/19)*15);
  line (i+((e-i)/19)*16,j+((f-j)/19)*16,k+((g-k)/19)*16,l+((h-l)/19)*16);
  line (i+((e-i)/19)*17,j+((f-j)/19)*17,k+((g-k)/19)*17,l+((h-l)/19)*17);
  line (i+((e-i)/19)*18,j+((f-j)/19)*18,k+((g-k)/19)*18,l+((h-l)/19)*18);
  line (i+((e-i)/19)*19,j+((f-j)/19)*19,k+((g-k)/19)*19,l+((h-l)/19)*19);
  
  
  
  
  
  
  //   texte
  
  
  /*
  text (1,a,b-10);
  text (2,c,d-10);
  text (3,e,f-10);
  text (4,g,h-10);
  */
  
}
