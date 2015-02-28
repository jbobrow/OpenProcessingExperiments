
//para grabar video descomentar (//) todo lo que est]a debajo de cada //MM
// (to make a movie, uncomment everything underneath // MM

//MM
//import processing.video.*;
//MovieMaker mm;

int p=10;
color[] colores=new color[4]; //creo la paleta (create the palette)
int v=1;
int m=0;

void setup(){
  size(300,420);
  background(0);
  colores[0]=color(64,73,163); //azul (blue)
  colores[1]=color(56,115,82); //verde (green)
  colores[2]=color(252,202,18); //naranja (orange)
  colores[3]=color(207,92,72); //rojo (red)
  frameRate(3);
//MM
//  mm = new MovieMaker(this, width, height, "Paris.mov",
//                     3, MovieMaker.ANIMATION, MovieMaker.HIGH);

}
void draw(){
  noStroke();
  for(int x=0;x<=width;x+=3*p){
    for(int y=0;y<=height;y+=3*p){
      fill(colores[int(random(0,4))]);
      rect(x,y,p*3,p*3);}}
 //invader 1
 fill(250);
 rect(p*3*3+p,p*3+p,2*p,2*p);
 rect(p*3*5+p,p*3+p,2*p,2*p);
 rect(p*3*3-p,p*3*2,6*2*p,2*p);
 rect(p*3*3-p,p*3*3-p,7*2*p,4*p);
 rect(p*3+p,p*3*4,11*2*p,4*p); 
 rect(p*3*2,3*5*p+p,2*p,2*p);
 rect(p*3*4,3*5*p+p,2*p,2*p);
 rect(p*3*5+p,3*5*p+p,2*p,2*p);
 rect(p*3*7+p,3*5*p+p,2*p,2*p);
 rect(p*3+p,3*6*p,2*p,2*p);
 rect(p*3*8,3*6*p,2*p,2*p);
 rect(p*3+p,p*3*3-p,2*p,4*p);
 rect(p*3*8,p*3*3-p,2*p,4*p);
 //ojos movedizos (moving eyes)
 fill(colores[0]);
 pushMatrix();
 if (v%2==0){m=-p;} else {m=0;}
 translate(m,0);
 rect(p*3*3+p,p*3*3+p,2*p,2*p);
 rect(p*3*6,p*3*3+p,2*p,2*p);
 popMatrix();
//invader 2
 fill(250);
 rect(p*3*3-p,p*3*7+p,2*p,2*p);
 rect(p*3*7-p,p*3*7+p,2*p,2*p);
 rect(p*3*3+p,p*3*8,2*p,2*p);
 rect(p*3*6,p*3*8,2*p,2*p);
 rect(p*3*3-p,p*3*9-p,p*2*7,2*p);
 rect(p*3*2,p*3*9+p,p*2*9,2*p);
 rect(p*3+p,p*3*10,p*2*11,2*p);
 rect(p*3*3-p,p*3*11-p,p*2*7,2*p);
 rect(p*3*3-p,p*3*11+p,p*2,2*p);
 rect(p*3*7-p,p*3*11+p,p*2,2*p);
 rect(p*3*3+p,p*3*12,4*p,2*p);
 rect(p*3*5+p,p*3*12,4*p,2*p);
 rect(p*3+p,p*3*11-p,2*p,4*p);
 rect(p*3*8,p*3*11-p,2*p,4*p);
//ojos movedizos (moving eyes)
 fill(colores[0]);
 pushMatrix();
 if (v%2==0){m=p;} else {m=0;}
 translate(m,0);
 rect(p*3*3+p,p*3*9+p,2*p,2*p);
 rect(p*3*6,p*3*9+p,2*p,2*p);
 popMatrix();

  stroke(20);
  for(int x=0;x<=width;x+=p){
    line(x,0,x,height);}
  for(int y=0;y<=height;y+=p){
    line(0,y,width,y);}
 v+=1;
// MM
//   mm.addFrame(); 
//  if (v==30){mm.finish();} //controla la cantidad de frames a grabar (controls how many frame to record)

}
  
//inspired by http://www.space-invaders.com/
//Paris intervention http://www.flickr.com/photos/50ftw/5361722051/
//Paris intervention http://www.flickr.com/photos/50ftw/5362334328/

