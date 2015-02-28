
int t=40; // t de tamaño (size)
int v=1;
void setup(){
size(600,600);
frameRate(4);
}

void draw(){
float r=v%2;
if (r==0){background(255);} else {background(0);}
  noStroke();
int x=int(random(1,20))*20;
int y=int(random(1,20))*20;

fill(30,113,75); //
rect(x,y,t,t); //1 verde (first green)
rect(x+3*t,y,t,t); //2 verde (2nd green)
fill(252,226,23);
rect(x-t,y+t,t*6,t); //largo naranja (long orange)
fill(255,22,5);
rect(x-2*t,y+t*2,t*2,t); //1 rojo (first red)
rect(x+t,y+t*2,t*2,t);//2 rojo (2nd red)
rect(x+4*t,y+t*2,t*2,t); //3 rojo (3rd red)
fill(170,32,43);
rect(x-t,y+t*3,t*6,t); //largo bordo (long dark red)
fill(69,71,88);
rect(x,y+t*4,t,t); // 1 azul (1st blue)
rect(x+3*t,y+t*4,t,t); // 2 azul (2nd blue)
fill(67,168,229);
rect(x-t,y+t*5,t,t);// 1 celeste (1st light blue)
rect(x+t,y+t*5,t*2,t); // 2 celeste (2nd light blue)
rect(x+4*t,y+t*5,t,t); // 3 celeste (3rd light blue)
rect(x-2*t,y+t*6,t,t); // 4 celeste (4th light blue)
rect(x+5*t,y+t*6,t,t); // 5 celeste (5th light blue)

for(int i=0; i<width;i+=20){
  stroke(205);
  line(i,0,i,height+20);}
  
for(int ii=0;ii<=height;ii+=20){
  stroke(205);
  line(0,ii,width,ii);}
  v+=1;
}
  
// basado en SpaceInvaders http://www.flickr.com/photos/50ftw/5230871540/  

