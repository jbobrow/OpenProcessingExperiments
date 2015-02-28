
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
  
AudioPlayer player;
Minim minim;
AudioInput in;
int cara =10;

int x;
int y;
int p1;


void setup(){
  frameRate(20);
size(1000,500);
x = 0;
p1=0;
smooth();
noStroke();

minim = new Minim(this);

 
 player = minim.loadFile("beatles.mp3", 2048);
  
  player.play();
  minim=new Minim(this);
in=minim.getLineIn(Minim.MONO,512);


}

void draw(){
background(0);


fill(random(250,249.9),random(250),0);
ellipse(x,250,200,200);
triangle(x-50,130,x,50,x+50,130);
triangle(x-50,370,x,450,x+50,370);
triangle(x+120,290,x+120,190,x+200,240);
triangle(x-120,290,x-120,190,x-200,240);



 
 float m=0;
for(int i=0; i<in.bufferSize()-1;i++){
if(abs(in.mix.get(i))>m){
m=abs(in.mix.get(i))*15;
}
}
cara =int(m*2);
println(m);
strokeWeight(cara);
if(m<0.5){
  fill(250,0,50);
rect(x-30,250+20,60,10);
fill(250,0,50);
ellipse( x+30,230,40,50);
fill(250,0,50);
ellipse(x-30,230,40,50);
fill(0);
rect(x-20,280,40,20);
fill(250,0,50);
rect(x-20,300,40,10);
ellipse(x,250,20,20);
}
 else{
   //labios;
fill(250,0,50);
rect(x-30,250+20,60,10);
fill(250,0,50);
rect(x-20,280,40,10);
fill(250,0,50);
//nariz;
ellipse(x,250,20,20);
//ojos;
fill(250,0,50);
ellipse(x+30,230,40,50);
fill(250);
ellipse(x+30,230,40,40);
fill(0);
ellipse(x+30,230,20,20);
fill(250,0,50);
ellipse(x-30,230,40,50);
fill(250);
ellipse(x-30,230,40,40);
fill(0);
ellipse(x-30,230,20,20);
 }
   

if(p1==0){
x=x+2;
}
if(x==980){
p1=1;
}
if(p1==1){
x=x-2;
}
if(x==20){
p1=0;

}
}
