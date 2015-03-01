
int laberinto [][]=
{{0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1},
{1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1},
{0,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0},
{1,1,0,1,0,1,0,0,1,0,0,1,1,1,0,1},
{0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,0},
{1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0},
{0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,0},
{0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,0}};

color rojo = color(255 ,1 , 1); 
color verde = color(1, 255 ,78);
color azul = color(1, 18, 255);
color blanco = color(255,255,255);
color amarillo = color(255,247,0);
int mplayer1[][]=new int [14][18];
int mplayer2[][]=new int [14][18];
int mplayerpc[][]=new int [12][16];
int mdisparo1[][]=new int [12][16];
int mdisparo2[][]=new int [12][16];
int mdisparopc[][]=new int [12][16];
int mplayer1i,mplayer1j,mplayer2i=15,mplayer2j=11;
PImage tanque1,tanquee1,tanque2,tanquee2,tanque3,tanquee3,tanque4,tanquee4;
int copypos1i,copypos1j,copypos2i=10,copypos2j=14;
PImage dtanque1;
void setup(){
size(800,600);
frameRate(1000);
tanque1 = loadImage("tanque1.png");
tanquee1= loadImage("tanquee1.bmp");
tanque2 = loadImage("tanque2.png");
tanquee2= loadImage("tanquee2.bmp");
tanque3 = loadImage("tanque3.png");
tanquee3= loadImage("tanquee3.bmp");
tanque4 = loadImage("tanque4.png");
tanquee4= loadImage("tanquee4.bmp");
dtanque1=tanque1;}
void keyPressed(){
if (key == CODED) {
  if (keyCode == UP){
    mplayer1j=mplayer1j-1;
  dtanque1=tanque1;} 
 if (keyCode == DOWN){
    mplayer1j=mplayer1j+1;
  dtanque1=tanque3;} 
 if (keyCode == RIGHT){
    mplayer1i=mplayer1i+1;
  dtanque1=tanque2;} 
 if(keyCode == LEFT) {
    mplayer1i=mplayer1i-1;
  dtanque1=tanque4;}}}
  
void laberinto(){
for(int i=0;i<=11;i++){
for(int j=0;j<=15;j++){
if(laberinto[i][j]==1){
fill(verde);
noStroke();
rect(50*j,50*i,50,50);}
else{fill(blanco);
noStroke();
rect(50*j,50*i,50,50);}}}}
//funcion para jugador 1
void player1(){
for(int i=0;i<=12;i++){
for(int j=0;j<=16;j++){
mplayer1[i][j]=0;}}
mplayer1[mplayer1j+1][mplayer1i+1]=1;
image(dtanque1, 50*mplayer1i,50*mplayer1j);}
//funcion para jugador 2
void player2(){
for(int i=0;i<=12;i++){
for(int j=0;j<=16;j++){
mplayer2[i][j]=0;}}
mplayer2[mplayer2j+1][mplayer2i+1]=1;
image(tanquee1, 50*mplayer2i,50*mplayer2j);
}
void ajuste(){
  /////ajuste player1
if(mplayer1j>11){
mplayer1j=11;}
if(mplayer1i>15){
mplayer1i=15;}
if(mplayer1j<0){
mplayer1j=0;}
if(mplayer1i<0){
mplayer1i=0;}
///ajuste player2
if(mplayer2j>11){
mplayer2j=11;}
if(mplayer2i>15){
mplayer2i=15;}
if(mplayer2j<0){
mplayer2j=0;}
if(mplayer2i<0){
mplayer2i=0;}
//posicion del tanque 1    
if(laberinto[mplayer1j][mplayer1i]==1){
mplayer1i=copypos1i;
mplayer1j=copypos1j;}
//posicion  del tanque 2
if(laberinto[mplayer2j][mplayer2i]==1){
mplayer2i=copypos2i;
mplayer2j=copypos2j;}
//choque de tanques
if(mplayer1[mplayer2j+1][mplayer2i+1]==1){
mplayer2i=copypos2i;
mplayer2j=copypos2j;}
if(mplayer2[mplayer1j+1][mplayer1i+1]==1){
mplayer1i=copypos1i;
mplayer1j=copypos1j;}}



void draw(){
laberinto();
player1();
player2();
ajuste();

//copia de las pociciones antes de mover
copypos1i=mplayer1i;
copypos1j=mplayer1j;
copypos2i=mplayer2i;
copypos2j=mplayer2j;
}



