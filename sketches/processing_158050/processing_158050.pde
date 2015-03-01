

 int [][] labe = new int[10][10];
 int px=0,py=0;
 color rojo = color(255 ,1 , 1);
 color verde = color(1, 255 ,78);
 color azul = color(1, 18, 255);
 color blanco = color(255,255,255);
 
 void setup(){
 size(500,500);
 frameRate(50);}
 
void laberinto(){
for(int j=0;j<=8;j++){
for(int i=1;i<=9;i++){
labe[j][0]=1;
labe[j][i]=0;}}
for(int i=0; i<=9;i++){
labe[9][i]=1;}}

void draw(){
laberinto();
for(int j=0;j<=9;j++){
for(int i=0;i<=9;i++){
if(labe[j][i]==1){
fill(verde);
rect(px+50*i,py+50*j,50,50);}
else{fill(blanco);
rect(px+50*i,py+50*j,50,50);}}}

if(labe[0][0]==1){
fill(rojo);
rect(px,py,50,50);}

if(labe[9][9]==1){
fill(azul);
rect(px+450,py+450,50,50);}}

