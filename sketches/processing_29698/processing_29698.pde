
float nodoRadio = 5.0;
float[]nodoXPos = new float[0];
float[]nodoYPos= new float[0];
color inicialNodo = color(0);
boolean seCierra = false;
float gravedad = .4;
float rangoRebote = 90;
float rangoElasticidadMin = 1.5;
float elasticRangeMax = 50;
float friccion = .85;
float[]rebote = new float[0];
float[]Vex = new float[0];
float[]Vey = new float[0];
float[]elasticidad = new float[0];

void setup(){
size(300, 600);
frameRate(30);
smooth();
}

void draw(){
fill(#1F0234, 20);
rect(0, 0, width, height);
if (nodoXPos.length>1){
drawEdge();
enInicialNodo();
moveShape();
}
drawNodo();
}

void enInicialNodo(){
if (isInicialNodo()){
inicialNodo = color(195, 127, 200);
}
else {
inicialNodo = color(random(100,156),random(10,50),random(0,255));
}
}

void drawEdge(){
stroke(#5C16D8);
for (int i=0; i<nodoXPos.length; i++){
if (i>0){
line(nodoXPos[i], nodoYPos[i], nodoXPos[i-1], nodoYPos[i-1]);
}
if (seCierra && i == nodoXPos.length-1){
line(nodoXPos[i], nodoYPos[i], nodoXPos[0], nodoYPos[0]);
}
}
}

void drawNodo(){
noStroke();
for (int i=0; i<nodoXPos.length; i++){
if (i==0){
fill(inicialNodo);
}
else{
fill(random(20,27),random(0,3),random(0,59),30);
}
ellipse(nodoXPos[i], nodoYPos[i], nodoRadio*2, nodoRadio*2);
}
}
boolean isInicialNodo(){
boolean isOnNodo = false;
if (nodoXPos.length>2){
if (dist(mouseX, mouseY, nodoXPos[0], nodoYPos[0]) < nodoRadio){
isOnNodo = true;
}
}
return isOnNodo;
}
void mousePressed(){
if(seCierra){
nodoXPos = subset(nodoXPos, 0, 0);
nodoYPos = subset(nodoYPos, 0, 0);
Vex = subset(Vex, 0, 0);
Vey = subset(Vey, 0, 0);
rebote = subset(rebote, 0, 0);
elasticidad = subset(elasticidad, 0, 0);
seCierra = false;
}
if(!isInicialNodo()){
nodoXPos = append(nodoXPos, mouseX);
nodoYPos = append(nodoYPos, mouseY);
Vex = append(Vex, 0);
rebote = append(rebote, random(-rangoRebote, rangoRebote));
elasticidad = append(elasticidad, random(rangoElasticidadMin, rangoElasticidadMin));
Vey = append(Vey, 0);
}
else {
seCierra = true;
}
}
void moveShape(){
if (seCierra){
for (int i=0; i<nodoXPos.length; i++){
nodoXPos[i]+=Vex[i];
Vey[i]+=gravedad;
nodoYPos[i]+=Vey[i];
if (nodoXPos[i]>width-nodoRadio){
nodoXPos[i] = width-nodoRadio;
Vex[i]*=-1;
}
if (nodoXPos[i]<nodoRadio){
nodoXPos[i] = nodoRadio;
Vex[i]*=-1;
}
if (nodoYPos[i]>height-nodoRadio){
nodoYPos[i] = height-nodoRadio;
Vex[i
]+=rebote[i];
Vex[i]*=friccion;
rebote[i]*=friccion;
Vey[i]*=-1;
Vey[i]*=elasticidad[i];
}
}
}
}               
