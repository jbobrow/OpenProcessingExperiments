
//// int numeros enteros
 // puede ser int posX = 100 ;
int posX;
int posY;
int posZ;
int posW;
int incX;
int incY;
int incW;
int incZ;
int b;
///  void setup solo una vez
void setup  () {

size (700,700);
background (10,20,211);
posX=50;
posY=600;
posZ=20;
posW=30;
incX= 100;
incY= 50;
incW =100;
incZ =1;
}
// -void draw------ continuamente
void draw () {
  //background (10,20,211);
 fill (132,255,b!1, 11);
noStroke ();
 rect (0,0, width, height);
 
 noStroke();
 fill (10,20,211, 5);
rect (0,0,width,height); 
fill (255, 122, 122);
ellipse (posX, posY,20,20);
stroke (127);
line (posX, posY, mouseX, mouseY);


fill (255);
ellipse (posZ,posW,30,30);
stroke (255);
line (posZ,posW, mouseX,mouseY);

//posX = posX +1;  ///esto es igual posX ++
//posX = posX % width;
//posZ++;
//posZ = posZ % width;

//que rebote: variable de incremento
posX= posX+incX ;

if (posX < 0){
incX =  incX *-1;
}

if (posX>width){
  incX = incX * -1;
}

posY= posY+incY ;

if (posY< 0){
incY =  incY * -1;
}

if (posY>height){
  incY = incY * -1;
}
posZ = posZ+incZ;
if (posZ < 0){
incZ =  incZ *-1;
}
if (posZ>width){
  incZ = incZ * -1;
}

posW= posW+incW ;
if (posW< 0){
incW =  incW * -1;
}
if (posW>height){
  incW = incW * -1;
}


};
