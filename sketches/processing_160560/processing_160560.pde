

import ddf.minim.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
Minim minim;
AudioPlayer player;
                                                                  ////MATRIZ SE LABERINTO
int laberinto [][]=
{{0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,1},
{2,2,0,2,1,1,1,1,1,1,1,1,1,1,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1},
{0,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0},
{1,1,0,1,0,1,0,0,1,0,0,1,1,1,0,1},
{0,0,0,1,0,1,0,0,1,0,0,0,0,1,0,0},
{1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{2,2,0,1,1,1,1,1,1,1,1,1,0,0,0,0},
{0,2,0,0,0,1,0,0,0,1,0,0,0,2,2,0},
{0,0,0,1,0,0,0,1,0,0,0,1,0,2,0,0}};
                                                               ///////MATRICES PARA DISPARO DE LOS JUGADORES 
int disparo1p1[][]= new int [12][16];
int disparo2p1[][]= new int [12][16];
int disparo3p1[][]= new int [12][16];
int disparo4p1[][]= new int [12][16];
int disparo1p2[][]= new int [12][16];
int disparo2p2[][]= new int [12][16];
int disparo3p2[][]= new int [12][16];
int disparo4p2[][]= new int [12][16];
int disparo1pc[][]= new int [12][16];
int disparo2pc[][]= new int [12][16];
int disparo3pc[][]= new int [12][16];
int disparo4pc[][]= new int [12][16];
 
int mplayer1[][]=new int [14][18];
int mplayer2[][]=new int [14][18];
int mplayerpc[][]=new int [14][18];
int mplayer1i,mplayer1j,mplayer2i=15,mplayer2j=11,mplayerpci=15,mplayerpcj=11;
PImage tanque1,tanquee1,tanque2,tanquee2,tanque3,tanquee3,tanque4,tanquee4,piso,bloque,bomba,muro,gameover;
PImage dtanque1,dtanque2,dtanquepc;
float c;
int disparo1i,disparo1j,disparo2i,disparo2j,disparopci,disparopcj;
int d1,d2,dpc;
int m;

void setup(){
size(800,600);
frameRate(5);
arduino = new Arduino(this, Arduino.list()[0], 57600);
minim = new Minim(this);
player = minim.loadFile("sonido.mp3");
player.play();
                                                                        ////CARGAR LAS IMAGENESSS
tanque1 = loadImage("tanque1.png");
tanquee1= loadImage("tanquee1.bmp");
tanque2 = loadImage("tanque2.png");
tanquee2= loadImage("tanquee2.bmp");
tanque3 = loadImage("tanque3.png");
tanquee3= loadImage("tanquee3.bmp");
tanque4 = loadImage("tanque4.png");
tanquee4= loadImage("tanquee4.bmp");
bloque =  loadImage("bloque.png");
piso = loadImage("piso.png");
bomba = loadImage("bomba.png");
muro = loadImage("muro.png");
gameover = loadImage("gameover.jpg");
dtanque1=tanque1;
dtanque2=tanquee1;
dtanquepc=tanque1;
arduino.pinMode(7,arduino.INPUT);
arduino.pinMode(8,arduino.INPUT);}
                                                                  /////DIRECCION DEL JUGADOR UNOOOO
void di1(){
int valor1 = arduino.analogRead(0);
int valor2 = arduino.analogRead(1);
  
  if ((valor1 < 400 )&& (mplayer1j>0)){
  if(laberinto[mplayer1j-1][mplayer1i]==0) {
    mplayer1j=mplayer1j-1;}
  dtanque1=tanque1;
  d1=1;} 
  
 if ((valor1 > 600 )&&(mplayer1j<11)){
  if(laberinto[mplayer1j+1][mplayer1i]==0){
    mplayer1j=mplayer1j+1;}
  dtanque1=tanque3;
  d1=3;} 
  
 if ((valor2 < 400)&&(mplayer1i<15)){
   if(laberinto[mplayer1j][mplayer1i+1]==0){
    mplayer1i=mplayer1i+1;}
  dtanque1=tanque2;
  d1=2;} 
  
 if((valor2 >600) && (mplayer1i>0)){
   if(laberinto[mplayer1j][mplayer1i-1]==0){
    mplayer1i=mplayer1i-1;}
  dtanque1=tanque4;
 d1=4;}}
                                                            ////DIRECCION PARA EL SEGUNDO JUGADOR
  void di2(){
int  valor3 = arduino.analogRead(2);
int  valor4 = arduino.analogRead(3);
  
  if ((valor3 < 400 )&& (mplayer2j>0)){
  if(laberinto[mplayer2j-1][mplayer2i]==0) {
    mplayer2j=mplayer2j-1;}
  dtanque2=tanquee1;
   d2=1;} 
  
 if ((valor3 > 600 )&&(mplayer2j<11)){
  if(laberinto[mplayer2j+1][mplayer2i]==0){
    mplayer2j=mplayer2j+1;}
  dtanque2=tanquee3;
  d2=3;} 
  
 if ((valor4 < 400)&&(mplayer2i<15)){
   if(laberinto[mplayer2j][mplayer2i+1]==0){
    mplayer2i=mplayer2i+1;}
  dtanque2=tanquee2;
 d2=2;} 
  
 if((valor4 >600) && (mplayer2i>0)){
   if(laberinto[mplayer2j][mplayer2i-1]==0){
    mplayer2i=mplayer2i-1;}
  dtanque2=tanquee4;
 d2=4;}}
  
void laberinto(){
for(int i=0;i<=11;i++){
for(int j=0;j<=15;j++){
if(laberinto[i][j]==1){
image(bloque,50*j,50*i);}
if(laberinto[i][j]==2){
image(muro,50*j,50*i);}
if(laberinto[i][j]==0){
image(piso,50*j,50*i);}}}}

                                                                                  //FUNCION PARA JUGADOR UNO
void player1(){
for(int i=0;i<=13;i++){
for(int j=0;j<=17;j++){
mplayer1[i][j]=0;}}
mplayer1[mplayer1j+1][mplayer1i+1]=1;
image(dtanque1, 50*mplayer1i,50*mplayer1j);}

                                                                                  //FUNCION PARA JUGADOR DOS
void player2(){
for(int i=0;i<=13;i++){
for(int j=0;j<=17;j++){
mplayer2[i][j]=0;}}
mplayer2[mplayer2j+1][mplayer2i+1]=1;
image(dtanque2, 50*mplayer2i,50*mplayer2j);}
                                                                               ////DISPARO PARA LA MAQUINA

                                                                                     ///FUNCION PC
void playerpc(){
    c = random(0,6);
                                                                                     //MOVIMIENTOS PC
  if ((c>=0)&&(c<1)&&(mplayerpcj>0)){
  if(laberinto[mplayerpcj-1][mplayerpci]==0){
    mplayerpcj=mplayerpcj-1;}
    dtanquepc=tanquee1;
    dpc=1;} 
 if ((c>=1)&&(c<2)&&(mplayerpcj<11)){
   if(laberinto[mplayerpcj+1][mplayerpci]==0){
    mplayerpcj=mplayerpcj+1;}
    dtanquepc=tanquee3;
    dpc=3;} 
 if ((c>=2)&&(c<3)&&(mplayerpci<15)){
   if(laberinto[mplayerpcj][mplayerpci+1]==0 ){
    mplayerpci=mplayerpci+1;}
   dtanquepc=tanquee2;
   dpc=2;} 
 if((c>=3)&&(c<4)&&(mplayerpci>0)) {
   if(laberinto[mplayerpcj][mplayerpci-1]==0){
    mplayerpci=mplayerpci-1;}
   dtanquepc=tanquee4;
   dpc=4;}
                                                                  ///DISPARO PARA PC
                                                      
 ///disparo hacia arriba
 for(int i=0;i<=15;i++){
 disparo1pc[11][i]=0;}
 if((dpc==1)&&(c<6)&&(c>5)){
 disparo1pc[mplayerpcj][mplayerpci]= 1;}
 for(int i=0; i<=10;i++){
 for(int j=0;j<=15;j++){
 disparo1pc[i][j]=disparo1pc[i+1][j];}}

  //disparo hacia abajo
 for(int i=0;i<=15;i++){
 disparo3pc[0][i]=0;}
 if((dpc==3)&&(c<6)&&(c>5)){
 disparo3pc[mplayerpcj][mplayerpci]= 1;}
 for(int i=11; i>=1;i--){
 for(int j=0;j<=15;j++){
 disparo3pc[i][j]=disparo3pc[i-1][j];}}
 
 //disparo hacia la derecha
 for(int i=0;i<=11;i++){
 disparo2pc[i][0]=0;}
 if((dpc==2)&&(c<6)&&(c>5)){
 disparo2pc[mplayerpcj][mplayerpci]=1;}
 for(int j=15;j>=1;j--){
 for(int i=0;i<=11;i++){
 disparo2pc[i][j]=disparo2pc[i][j-1];}}
 
 //disparo hacia la izquierda
 for(int i=0;i<=11;i++){
 disparo4pc[i][15]=0;}
 if((dpc==4)&&(c<6)&&(c>5)){
 disparo4pc[mplayerpcj][mplayerpci]= 1;}
 for(int j=0;j<=14;j++){
 for(int i=0;i<=11;i++){
 disparo4pc[i][j]=disparo4pc[i][j+1];}}  
 

               //MOSTRAR DISPARO
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo1pc[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo2pc[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo3pc[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo4pc[j][i]==1){
   image(bomba,i*50,j*50);}}}
 
 //////MOSTRAR TANQUE PC
  for(int i=0;i<=13;i++){
  for(int j=0;j<=17;j++){
  mplayerpc[i][j]=0;}}
  mplayerpc[mplayerpcj+1][mplayerpci+1]=1;
image(dtanquepc, 50*mplayerpci,50*mplayerpcj);}
                                                            ///////DISPARO PARA EL PRIMER JUGADOR
void disparo1(){

 ///disparo hacia arriba
 for(int i=0;i<=15;i++){
 disparo1p1[11][i]=0;}
 if(d1==1){
 disparo1p1[mplayer1j][mplayer1i]= arduino.digitalRead(7);}
 for(int i=0; i<=10;i++){
 for(int j=0;j<=15;j++){
 disparo1p1[i][j]=disparo1p1[i+1][j];}}

  //disparo hacia abajo
 for(int i=0;i<=15;i++){
 disparo3p1[0][i]=0;}
 if(d1==3){
 disparo3p1[mplayer1j][mplayer1i]= arduino.digitalRead(7);}
 for(int i=11; i>=1;i--){
 for(int j=0;j<=15;j++){
 disparo3p1[i][j]=disparo3p1[i-1][j];}}
 
 //disparo hacia la derecha
 for(int i=0;i<=11;i++){
 disparo2p1[i][0]=0;}
 if(d1==2){
 disparo2p1[mplayer1j][mplayer1i]= arduino.digitalRead(7);}
 for(int j=15;j>=1;j--){
 for(int i=0;i<=11;i++){
 disparo2p1[i][j]=disparo2p1[i][j-1];}}
 
 //disparo hacia la izquierda
 for(int i=0;i<=11;i++){
 disparo4p1[i][15]=0;}
 if(d1==4){
 disparo4p1[mplayer1j][mplayer1i]= arduino.digitalRead(7);}
 for(int j=0;j<=14;j++){
 for(int i=0;i<=11;i++){
 disparo4p1[i][j]=disparo4p1[i][j+1];}}  
 

//mostrar disparo
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo1p1[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo2p1[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo3p1[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo4p1[j][i]==1){
   image(bomba,i*50,j*50);}}}
 }
                                                      /////DISPARO PARA SEGUNDO JUGADOR
 void disparo2(){

 ///disparo hacia arriba
 for(int i=0;i<=15;i++){
 disparo1p2[11][i]=0;}
 if(d2==1){
 disparo1p2[mplayer2j][mplayer2i]= arduino.digitalRead(8);}
 for(int i=0; i<=10;i++){
 for(int j=0;j<=15;j++){
 disparo1p2[i][j]=disparo1p2[i+1][j];}}

  //disparo hacia abajo
 for(int i=0;i<=15;i++){
 disparo3p2[0][i]=0;}
 if(d2==3){
 disparo3p2[mplayer2j][mplayer2i]= arduino.digitalRead(8);}
 for(int i=11; i>=1;i--){
 for(int j=0;j<=15;j++){
 disparo3p2[i][j]=disparo3p2[i-1][j];}}
 
 //disparo hacia la derecha
 for(int i=0;i<=11;i++){
 disparo2p2[i][0]=0;}
 if(d2==2){
 disparo2p2[mplayer2j][mplayer2i]= arduino.digitalRead(8);}
 for(int j=15;j>=1;j--){
 for(int i=0;i<=11;i++){
 disparo2p2[i][j]=disparo2p2[i][j-1];}}
 
 //disparo hacia la izquierda
 for(int i=0;i<=11;i++){
 disparo4p2[i][15]=0;}
 if(d2==4){
 disparo4p2[mplayer2j][mplayer2i]= arduino.digitalRead(8);}
 for(int j=0;j<=14;j++){
 for(int i=0;i<=11;i++){
 disparo4p2[i][j]=disparo4p2[i][j+1];}}  
 

//mostrar disparo
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo1p2[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo2p2[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo3p2[j][i]==1){
   image(bomba,i*50,j*50);}}}
   
 for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if(disparo4p2[j][i]==1){
   image(bomba,i*50,j*50);}}}
 }

void bumbum(){
                                                                  ////BUMMMMMM BUMMM PARA SEGUNDO JUGADOR
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo1p2[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo1p2[i][j]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo2p2[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo2p2[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo3p2[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo3p2[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo4p2[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo4p2[i][j]=0;}}}
   
  //////MUROS QUE NO CAMBIAN
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo1p2[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo1p2[i][j]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo2p2[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo2p2[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo3p2[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo3p2[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo4p2[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo4p2[i][j]=0;}}}
   
                                                                 ////BUMMMMMM BUMMM PARA PRIMER  JUGADOR
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo1p1[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo1p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo2p1[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo2p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo3p1[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo3p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo4p1[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo4p1[j][1]=0;}}}
   
   //////MUROS QUE NO CAMBIAN
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo1p1[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo1p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo2p1[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo2p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo3p1[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo3p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
 if((disparo4p1[j][i]==1-laberinto[j][i])&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo4p1[j][1]=0;}}}
                                                                 ///BUM BUMMM PARA JUGADOR PC
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo1pc[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo1pc[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo2pc[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo2p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo3pc[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo3pc[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo4pc[j][i]==laberinto[j][i])&&(laberinto[j][i]==1)){
   laberinto[j][i]=0;
   disparo4pc[j][i]=0;}}}
   
   ////MUROS QUE NO CAMBIAN
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo1pc[j][i]==1)&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo1pc[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo2pc[j][i]==1)&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo2p1[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo3pc[j][i]==1)&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo3pc[j][i]=0;}}}
   for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
   if((disparo4pc[j][i]==1)&&(laberinto[j][i]==2)){
   laberinto[j][i]=2;
   disparo4pc[j][i]=0;}}}
}

void fin(){
 
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
if((disparo1pc[j][i]== mplayer1[j+1][i+1]) || (disparo2pc[j][i]==mplayer1[j+1][i+1]) || (disparo3pc[j][i]==mplayer1[j+1][i+1]) || (disparo4pc[j][i]==mplayer1[j+1][i+1]) ){
if(mplayer1[j+1][i+1]==1){
   m=3;}}}}
   
for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
if((disparo1p1[j][i]== mplayerpc[j+1][i+1]) || (disparo2p1[j][i]==mplayerpc[j+1][i+1]) || (disparo3p1[j][i]==mplayerpc[j+1][i+1]) || (disparo4p1[j][i]==mplayerpc[j+1][i+1]) ){
if(mplayerpc[j+1][i+1]==1){
   m=3;}}}}
   
    for(int i=0;i<=15;i++){
   for(int j=0;j<=11;j++){
if((disparo1p1[j][i]== mplayer2[j+1][i+1]) || (disparo2p1[j][i]==mplayer2[j+1][i+1]) || (disparo3p1[j][i]==mplayer2[j+1][i+1]) || (disparo4p1[j][i]==mplayer2[j+1][i+1]) ){
if(mplayer2[j+1][i+1]==1){
   m=3;}}}}
   
   for(int i=0;i<=15;i++){
for(int j=0;j<=11;j++){
if((disparo1p2[j][i]== mplayer1[j+1][i+1]) || (disparo2p2[j][i]==mplayer1[j+1][i+1]) || (disparo3p2[j][i]==mplayer1[j+1][i+1]) || (disparo4p2[j][i]==mplayer1[j+1][i+1]) ){
if(mplayer1[j+1][i+1]==1){
   m=3;}}}}
}
                              /////MODO DE JUEGO
void game(int modo){
   if(modo==1){
    laberinto();
    di1();
    di2();
    disparo1();
    disparo2();
    player1();
    player2();
    bumbum();}
    
 if(modo==2){
  laberinto();
  di1();
  disparo1();
  player1();
  playerpc();
  bumbum();}   
  
  if(modo==3){
   image(gameover,0,0);}
}
void draw(){
m=2;
fin();
game(m);

}

                                                                     


