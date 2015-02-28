
int t=40; // t de tamaño
int x=80; //defino posicion inicial x e y
int y=20;  
int v=1; //variable para contar cuando llego al limite

void setup(){
size(600,600);
frameRate(8);
}

void draw(){
  background(255);
  noStroke();
fill(30,113,75); //ej x inicial 120 y inicial 40
rect(x,y,t,t); //1 verde
rect(x+3*t,y,t,t); //2 verde
fill(252,226,23);
rect(x-t,y+t,t*6,t); //largo naranja
fill(255,22,5);
rect(x-2*t,y+t*2,t*2,t); //1 rojo
rect(x+t,y+t*2,t*2,t);//2 rojo
rect(x+4*t,y+t*2,t*2,t); //3 rojo
fill(170,32,43);
rect(x-t,y+t*3,t*6,t); //largo bordo
fill(69,71,88);
rect(x,y+t*4,t,t); // 1 azul
rect(x+3*t,y+t*4,t,t); // 2 azul
fill(67,168,229);
rect(x-t,y+t*5,t,t);// 1 celeste
rect(x+t,y+t*5,t*2,t); // 2 celeste
rect(x+4*t,y+t*5,t,t); // 3 celeste
rect(x-2*t,y+t*6,t,t); // 4 celeste
rect(x+5*t,y+t*6,t,t); // 5 celeste

for(int i=0; i<width;i+=20){
  stroke(205);
  line(i,0,i,height+20);}
  
for(int ii=0;ii<=height;ii+=20){
  stroke(205);
  line(0,ii,width,ii);}
  float r=v/14;
  float r1=v/26;
  int s=v%2;
  if (r%2==0){
  x+=20;} else{ x-=20;}
  if (r1%2==0){y+=20*s;} else {y-=20*s;}
  v+=1;
  println(y);
  println(v);
 if (x==360){x=80;}
}
  
// basado en SpaceInvaders http://www.flickr.com/photos/50ftw/5230871540/    

