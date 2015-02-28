
float truc;
float a;
float b;
float c;
float d;

void setup (){
  size (500,500);
  smooth ();
  a = 0;
  b = 0;
  c = 0;
  d = 0;
  truc = 0;
}

void draw (){
  
  background (0);
 
  int plch;
  plch = width/5;
  int plcv;
  plcv = 400;
  
  //   temps descente
  int temps;
  temps = 119;
  
  //   taille des trucs
  int ttruc;
  ttruc = 150;
  
  
  int lrg;
  lrg = 50;
  
  int htra;
  htra = 50;
  if (a>ttruc-15){
    htra =25;}
    
  int htrb;
  htrb = 50;
  if (b>ttruc-15){
    htrb =25;}
  
  int htrc;
  htrc = 50;
  if (c>ttruc-15){
    htrc =25;}
  
  int htrd;
  htrd = 50;
  if (d>ttruc-15){
    htrd =25;}
  
  
  
  //   FLOAT
  
  
  
  truc = truc + 1;
  if (truc>temps-1){
    truc = 0;}
  
  
  //   A
  if (truc>0){
    if (truc<(temps/20*1)){
    a = a - 2;}}
  if (truc>(temps/20*1)){
    if (truc<(temps/20*2)){
    a = a - 3;}}
  if (truc>(temps/20*2)){
    if (truc<(temps/20*3)){
    a = a - 4;}}
  if (truc>(temps/20*3)){
    if (truc<(temps/20*4)){
    a = a - 7;}}
  if (truc>(temps/20*4)){
    if (truc<(temps/20*5)){
    a = a - 10;}}
  if (truc<(temps/4)*0+1) {
    if (truc>(temps/4)*0-1) {
    a = ttruc;}}
  if (a<-25){
    a=-25;}
  
  
  //   B
  if (truc>temps/20*5){
    if (truc<(temps/20*6)){
    b = b - 2;}}
  if (truc>(temps/20*6)){
    if (truc<(temps/20*7)){
    b = b - 3;}}
  if (truc>(temps/20*7)){
    if (truc<(temps/20*8)){
    b = b - 4;}}
  if (truc>(temps/20*8)){
    if (truc<(temps/20*9)){
    b = b - 7;}}
  if (truc>(temps/20*9)){
    if (truc<(temps/20*10)){
    b = b - 10;}}
  if (truc<(temps/4)*1+1) {
    if (truc>(temps/4)*1-1) {
    b = ttruc;}}
  if (b<-25){
    b=-25;}
  
  
  //   C
  if (truc>temps/20*10){
    if (truc<(temps/20*11)){
    c = c - 2;}}
  if (truc>(temps/20*11)){
    if (truc<(temps/20*12)){
    c = c - 3;}}
  if (truc>(temps/20*12)){
    if (truc<(temps/20*13)){
    c = c - 4;}}
  if (truc>(temps/20*13)){
    if (truc<(temps/20*14)){
    c = c - 7;}}
  if (truc>(temps/20*14)){
    if (truc<(temps/20*15)){
    c = c - 10;}}
  if (truc<(temps/4)*2+1) {
    if (truc>(temps/4)*2-1) {
    c = ttruc;}}
  if (c<-25){
    c=-25;}
  
  
  //   D
  if (truc>temps/20*15){
    if (truc<(temps/20*16)){
    d = d - 2;}}
  if (truc>(temps/20*16)){
    if (truc<(temps/20*17)){
    d = d - 3;}}
  if (truc>(temps/20*17)){
    if (truc<(temps/20*18)){
    d = d - 4;}}
  if (truc>(temps/20*18)){
    if (truc<(temps/20*19)){
    d = d - 7;}}
  if (truc>(temps/20*19)){
    if (truc<(temps/20*20)){
    d = d - 10;}}
  if (truc<(temps/4)*3+1) {
    if (truc>(temps/4)*3-1) {
    d = ttruc;}}
  if (d<-25){
    d=-25;}
  
  
  
  //  DRAW
  
  
  //   a
  noStroke ();
  fill (175,255,25);
  
  rect (plch*1-lrg/2,plcv-a,lrg,50+a);
  ellipse (plch*1,plcv-a,lrg,htra);
  //
  if (a<ttruc-25){
    fill (0);
    ellipse (plch*1-lrg/4,plcv-a,lrg/8,htra/8);
    ellipse (plch*1+lrg/4,plcv-a,lrg/8,htra/8);
    stroke (0);
    strokeWeight (3);
    line (plch*1-lrg/3,plcv-a+15,plch*1+lrg/3,plcv-a+15);}
  if (a>ttruc-25){
    fill (0);
    ellipse (plch*1,plcv-a+15,lrg/2,htra/2);
    stroke (0);
    strokeWeight (3);
    line (plch*1-lrg/5,plcv-a,plch*1-lrg/3,plcv-a);
    line (plch*1+lrg/5,plcv-a,plch*1+lrg/3,plcv-a);}
  
  //   b
  noStroke ();
  fill (255,255,0);
  
  rect (plch*2-lrg/2,plcv-b,lrg,50+b);
  ellipse (plch*2,plcv-b,lrg,htrb);
  //
  if (b<ttruc-25){
    fill (0);
    ellipse (plch*2-lrg/4,plcv-b,lrg/8,htrb/8);
    ellipse (plch*2+lrg/4,plcv-b,lrg/8,htrb/8);
    stroke (0);
    strokeWeight (3);
    line (plch*2-lrg/3,plcv-b+15,plch*2+lrg/3,plcv-b+15);}
  if (b>ttruc-25){
    fill (0);
    ellipse (plch*2,plcv-b+15,lrg/2,htrb/2);
    stroke (0);
    strokeWeight (3);
    line (plch*2-lrg/5,plcv-b,plch*2-lrg/3,plcv-b);
    line (plch*2+lrg/5,plcv-b,plch*2+lrg/3,plcv-b);}
  
  //   c
  noStroke ();
  fill (255,0,0);
  
  rect (plch*3-lrg/2,plcv-c,lrg,50+c);
  ellipse (plch*3,plcv-c,lrg,htrc);
  //
  if (c<ttruc-25){
    fill (0);
    ellipse (plch*3-lrg/4,plcv-c,lrg/8,htrc/8);
    ellipse (plch*3+lrg/4,plcv-c,lrg/8,htrc/8);
    stroke (0);
    strokeWeight (3);
    line (plch*3-lrg/3,plcv-c+15,plch*3+lrg/3,plcv-c+15);}
  if (c>ttruc-25){
    fill (0);
    ellipse (plch*3,plcv-c+15,lrg/2,htrc/2);
    stroke (0);
    strokeWeight (3);
    line (plch*3-lrg/5,plcv-c,plch*3-lrg/3,plcv-c);
    line (plch*3+lrg/5,plcv-c,plch*3+lrg/3,plcv-c);}
  
  //   d
  noStroke ();
  fill (255,150,0);
  
  rect (plch*4-lrg/2,plcv-d,lrg,50+d);
  ellipse (plch*4,plcv-d,lrg,htrd);
  //
  if (d<ttruc-25){
    fill (0);
    ellipse (plch*4-lrg/4,plcv-d,lrg/8,htrd/8);
    ellipse (plch*4+lrg/4,plcv-d,lrg/8,htrd/8);
    stroke (0);
    strokeWeight (3);
    line (plch*4-lrg/3,plcv-d+15,plch*4+lrg/3,plcv-d+15);}
  if (d>ttruc-25){
    fill (0);
    ellipse (plch*4,plcv-d+15,lrg/2,htrd/2);
    stroke (0);
    strokeWeight (3);
    line (plch*4-lrg/5,plcv-d,plch*4-lrg/3,plcv-d);
    line (plch*4+lrg/5,plcv-d,plch*4+lrg/3,plcv-d);}
 
  
}
