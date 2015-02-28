
int cs = 80;
int modi = 0;
int counter = 0;

void setup(){
size(1200,800);
background(255);
smooth();
frameRate(10);
}
void draw(){
//randomSeed(0);

if(modi==1){
if(mousePressed){
background(color(random(255),random(255),random(255)));
 
for(int j = 0; j<=height/cs;j++){
for(int i = 0; i<=width/cs;i=i+1){
fill(color(random(255),random(255),random(255), 100));
noStroke();

int x = int(random(20,40));
int y = int(random(20,40));
rect(i*cs, j*cs, cs+x, cs+y);
}
}
}
}

if(modi==2){
if(mousePressed){
background(color(random(255),random(255),random(255)));
 
for(int j = 0; j<=height/cs;j++){
for(int i = 0; i<=width/cs;i=i+1){
fill(color(random(255),random(255),random(255), 180));
noStroke();

int x = int(random(10,20));
int y = int(random(10,20));
rect(i*cs, j*cs, cs+x, cs+y);
}
}
}
}

if(modi==3){
if(mousePressed){
background(255);

 
for(int j = 0; j<=height/cs;j++){
for(int i = 0; i<=width/cs;i=i+1){
fill(color(random(255),random(255),random(255), 100));
noStroke();

int x = int(random(10,20));
int y = int(random(10,20));
rect(i*cs, j*cs, cs+x, cs+y);
}
}
}
}

}

void keyPressed(){
if(key=='1'){
modi = 1;
}
if(key=='2'){
modi = 2;
}
if(key=='3'){
modi = 3;
}

if(key=='s'){
saveFrame("Bild_"+counter+".png");
counter++;
}

}


