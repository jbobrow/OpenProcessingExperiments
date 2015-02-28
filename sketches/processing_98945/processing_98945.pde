
int Rodones = 50;
int bordes = 40;
float[] posx= new float [Rodones];
float[] posy= new float [Rodones];
float[] velx= new float [Rodones];
float[] vely= new float [Rodones];
void setup(){
size(400,400);
for(int a=0; a< Rodones; a++){
posx[a] =random(width);
posy[a] =random(height);
velx[a] =random(0,5);
vely[a] = 5;
}
}
void draw(){
dibuixafons();
for(int a=0; a<Rodones;a++){
posicio_rodones(posx[a],posy[a]);
actualitzar_posicio(a); 
}
}
void dibuixafons(){
background(0);
for(int a=0;a<width; a++){
stroke(400,0,a);
line(0,a,0,height);
line(a,0,a,width);
line(a,a,a,height);
line(a,a,width,height);
}
}
void posicio_rodones(float posx, float posy){

stroke(random(255));
fill(255,random(300));
ellipse(posx+30,posy+30,bordes,bordes);
stroke(random(255),random(255),0);
line(posx+15,posy+15,200,200);
}
void actualitzar_posicio(int a){
posx[a] = posx[a] + velx[a];
posy[a] = posy[a] + vely[a];
if (posx[a] < 0 || posx[a] >(height-bordes/2)) {
velx[a] = -velx[a];
}
if ((posy[a] <= 0) || (posy[a] >(width-bordes/2))) {
vely[a] = -vely[a];
}
}


