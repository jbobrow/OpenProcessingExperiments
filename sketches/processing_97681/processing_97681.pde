
int Rodones = 50;
int bordes = 30;
float[] posx= new float [Rodones];
float[] posy= new float [Rodones];
float[] velx= new float [Rodones];
float[] vely= new float [Rodones];
void setup(){
size(400,400);
for(int a=2; a< Rodones; a++){
posx[a] =random(width);
posy[a] =random(height);
velx[a] =random(0,10);
vely[a] = 10;
}
}
void draw(){
background(0);
for(int a=0;a<width; a++){
stroke(400,0,a);
line(0,a,0,height);
line(a,0,a,width);
line(a,a,a,height);
line(a,a,width,height);}
for (int a=0; a< Rodones; a++) {
posx[a] = posx[a] + velx[a];
posy[a] = posy[a] + vely[a];


if (posx[a] < 0 || posx[a] > (height-bordes)) {
velx[a] = -velx[a];
}
if (posy[a] < 0 || posy[a] > (width-bordes)) {
vely[a] = -vely[a];
}
stroke(random(255));
fill(255,random(300));
ellipse(posx[a],posy[a],30,30);
}
}


