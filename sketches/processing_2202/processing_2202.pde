
float posX;
float posY;
float velX = 25;
float velY = 5;

float posJ;
float posK;
float velJ = -20;
float velK = -15;


float radio = 15;

float diametro = radio*2;

float valorfondo = 0;

//int sz = 25;
int lineaX=0;
float huePrincipal = random (245);




void setup(){
  
size(700,400);

colorMode(HSB,255);
posX = width/2;
posY = height/2;
posJ= width/2;
posK= height/2;

background (valorfondo);

}

void draw(){

smooth();


posX = posX+velX;
posY = posY+velY;

///////////////
posJ = posJ-velK;
posK = posK-velK;

pendulo ();



}


void pendulo() {
  
  
noStroke();
fill(0,5);
rect(0,0,width,height);


if((posJ-radio <0)||(posJ+radio >lineaX)){
   velJ = -velJ;



 }
if((posK-radio <0)||(posK+radio >lineaX)){
   velK = -velK;




}


strokeWeight(random (5,40));
strokeCap(ROUND);
stroke (huePrincipal + random (10), 100 + random (10), 100 + random (55),50);


//stroke (huePrincipal + random (10), 100 + random (55), 100 + random (45),50);


ellipse (posX,posY,diametro,diametro);

//fill (random (10), 50 + random (25), 50 + random (155),50);
line (posJ,posK, posX+radio,posY-radio);


if((posX-radio <0)||(posX+radio >width)){
   velX = -velX;
  // fill(255,0,0);


 }
if((posY-radio <0)||(posY+radio >height)){
   velY = -velY;
   //fill(0,255,0);



}


lineaX +=1;
lineaX = lineaX % height;
strokeWeight(2);
stroke(0,0);
line (lineaX,0, lineaX,width);



}



/////escaner



