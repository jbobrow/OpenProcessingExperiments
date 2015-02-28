
float numeroLineas;
float miAlpha, R,G,B,A,sumaR,sumaB,sumaG,sumaA;
int i = 1;
float delgado,medio,grueso;
float R_aleatorio,G_aleatorio,B_aleatorio;


void setup(){
size(800,600, P3D);
background(0);
smooth();
noStroke();
R= 1;
G= 1;
B= 1;
A=1;
sumaA= 5;
miAlpha= 10;
numeroLineas= 5;
delgado= 15;
medio=25;
grueso=45;
sumaR= 3;
sumaG= 6;
sumaB= 9;
R_aleatorio= random(200,240);
G_aleatorio= random(200,255);
B_aleatorio= random(220,235);
}

void draw(){
if(R>=255 || R<=0) sumaR= sumaR*(-1);
if(G>=255 || G<=0) sumaG= sumaG*(-1);
if(B>=255 || B<=0) sumaB= sumaB*(-1);
if(A>=255 || A<=0) sumaA= sumaA*(-1);

R += sumaR;
G += sumaG;
B += sumaB;
A += sumaA;
stroke(R_aleatorio-(R * R_aleatorio/255),G_aleatorio-(G * G_aleatorio/255),B_aleatorio-(B * B_aleatorio/255),miAlpha - (A * miAlpha/255));

lineas();
//colores();
println(i +"////////"+ "lineas:" +"///////" + numeroLineas + "///////"+ keyCode);
//println("color_inicial:"+ "    "+ R_aleatorio);
//println(R + " , "+ G +" , " + B + " , " + A);
}


void colores(){



}
void lineas(){
  
translate(mouseX,mouseY);
rotate(radians(numeroLineas+(5 * i)));
//rotate(radians(i)+ (numeroLineas* random(-1,1)));
//stroke(255,100,255);

line(0,0,pmouseX,pmouseY);

if(i>= 100) i = i % i;
//if(i<0)  i++;
i++;

}

void mouseDragged(){


//lineas();

}
void mousePressed(){
//colores();
//lineas();
}
void mouseMoved(){

//lineas();

}


void keyPressed(){

if(keyCode == 8){
fill(0,0,0,100);
noStroke();
//translate(0,0);
rect(0,0,width *3,height *3);

}


if(keyCode == 49){

strokeWeight(delgado);

}
if(keyCode == 50){

strokeWeight(medio);

}
if(keyCode == 51){

strokeWeight(grueso);

}
if (keyCode == 72){
colorMode(HSB,255);
//stroke(R_aleatorio-(R * R_aleatorio/255),G_aleatorio-(G * G_aleatorio/255),B_aleatorio-(B * B_aleatorio/255));
}
if (keyCode == 82){
  
 colorMode(RGB,255);
}

if (keyCode == 32){

saveFrame("faroColor.png");

}

}

