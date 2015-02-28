
void setup (){  size(800,800);}
   int x;
   void draw (){
     if (mouseX> width/2){
background(40,40,100);
//Bloco principal: prédio
fill (180,100,180);
rect (200,150,350,550);
//Janelas da elevação frontal
for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (250,200,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (250,300,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (250,400,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (350,200,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (450,200,50,50); }
    for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (300,350,50,50); }
    for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (350,400,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (300,450,50,50); } 
  for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (400,450,50,50); } 
    for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (350,500,50,50); } 
    for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (250,500,50,50); }   
  for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (300,250,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (400,250,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (350,300,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (400,350,50,50); }
    for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (450,300,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (250,190,190);
  rect (450,500,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (200,220,230);
  rect (450,400,50,50); }
// Hall de entrada
fill (211,199,100,150);
rect (250,600,250,300);
rect (260,610,230,300);
//Rua
 fill (150);
 rect (0,700,800,100);
  }
   else {
  background(173,212,232,200);
fill (161,100,212);
rect (200,150,350,550);
//Janelas da elevação frontal
for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (250,200,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (250,300,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (250,400,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (350,200,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (450,200,50,50); }
     for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (300,350,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (350,400,50,50); } 
   for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (300,450,50,50); } 
    for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (400,450,50,50); } 
    for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (350,500,50,50); } 
      for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (250,500,50,50); } 
    for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (300,250,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (400,250,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (350,300,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (400,350,50,50); }
    for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (450,300,50,50); }
  for (int i = 5; i < height; i += 5) {
  fill (235,180,150);
  rect (450,500,50,50); }
   for (int i = 5; i < height; i += 5) {
  fill (225,225,250);
  rect (450,400,50,50); }
// Hall de entrada
fill (211,199,100,150);
rect (250,600,250,300);
rect (260,610,230,300);}
//Rua
 fill (150);
 rect (0,700,800,100);
  if(mouseX<width/2)
   fill (255,234,45);
   else
   fill(255,255,255);
   ellipse(x++,100,100,100);
   if(x>640) {
   x=-80;}}

