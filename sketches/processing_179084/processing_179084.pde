
//float a=1;float i=6;void draw(){line(i,a,a,i);if(a<100){a=random(99);}if(i<100){i=random(99);}}
// made by christian



//void setup() {size(500,500);   background (10,200,70); }     void draw() {noStroke();    fill(0, 100, 200);       arc(mouseX,mouseY,80,80,0,PI+QUARTER_PI, PIE);      int s = second();   ellipse(s, 200, s, 33);}
// Laura´s pacman eats you all or no one :p


//void draw(){ ellipse(50,50,50+random(-25,15),50+random(-35,25));}void mousePressed(){fill(random(255));} 
//MADE BY JONATHAN


//void setup(){size (600,600);}void draw(){background(255);for (int i=0;i<600;i = i+5){line(i,mouseY-i,i,600);line(mouseX-i,i,0,i);}} 
//made by Sonja


//int f=98;void setup(){size(f*2, f*2,P3D);}void draw(){background(0);lights();translate(f,f,0);rotateY(mouseX/f);rotateX(mouseY/f*-1);box(50);}
//Nils


//int nr=90;void setup(){size(400,90);}void draw(){float rs=random(80);rect(random(400),rs,rs,90);}//made by Milena


//float c=100;void draw(){background(0,143,224);line(0,0,60,60);line(0,0,20,70);line(0,0,70,20);ellipse(0,0,c,c);fill(255,235,7);}
//made by Michelle

//void draw(){float a=random(300), b=random(300);   fill(a,b,b);   ellipse(a,b,a,b);   strokeWeight(2);  ellipse(mouseX,mouseY,15,15);}
//Jess

//float a=random(20), b;void draw(){if(mousePressed==true){a=a+1;stroke(b=random (255),b);rect(mouseX,mouseY,a,a);fill(b,0,0,b);if(a>25)a=0;}}
//made by Dar


//void draw(){for(int y=0;y<99;y++){stroke(random(255),random(255),random(255));float x=randomGaussian()*35;line(x,y,x,y);}}
// Made by Kamil


//int m=width/2;void draw(){for (int i=0;i<width;i++){stroke(random(255),random(179),random(113));line(m,i,i,m);}} 
// Made by Lara

//int x=0;void setup(){frameRate(1);}void draw(){String[]d=loadStrings("p");background(0);text(d[x],5,50);x++;if(d.length<=x){exit();}} // - Juan

/* == "p" text file content ==
Esa nube fue
y se fue.
¡Qué limpio
ha dejado
el aire
la pureza
de ese ser
que existió
para negarse!
*/

//float s;float c;void draw(){s=random(50);fill(0,c=random(255),c,c);c=c+1;if(c>255)c=0;}void mousePressed(){rect(mouseX,mouseY,s,s);}
//Inge



//int e,d;void draw(){d=0;for(;d<98;d++){if(e>0)set(d,e,get(d,e-1));else if(random(1)>0.5)set(d,0,color(random(255)));}e++;e%=99;}//CUARTIELLES

//void draw(){for(int j=0;j<100;j+=4){stroke(30,99-j/2,255-j*2);for(int i=0;i<100;i++){line(i,j-noise(i*.02,j*.5,frameCount*.01)*28,i,99);}}}//GYSING

//int x=9,y=3,X=2,Y=1;void draw(){rect(-1,0,99,99);x+=(x>96|x<2)?X=-X:X;y+=(y>97|y<1)?Y=-Y:Y;rect(x,y,1,1);rect(0,min(max(y-9,1),80),1,18);}//GYSING

//int y,o,f;void draw(){background(99);for(y=0;y<99;){o=int(sin(y++*.04+f*.01)*9)+50;line(o-y/2,y,o+y/2,y);if((f/2-y)%5==0)set(o,y,-1);}f++;}//GYSING

//float r;void setup(){size(99,99,P3D);}void draw(){background(99);translate(49,49);rotateX(r+=.04);rotateY(r);box(hour(),minute(),second());}//GYSING


//int i,n=100;void setup(){background(0);}void draw(){stroke(i%n,n-i%n,i%n,sin(i)*i%n);line(0,i%n,n,n-i%n);line(i%n,0,n-i%n,n);i++;}
// made by tim

//void draw(){background(0);stroke(0);translate(width/2,height/2);float theta=PI*mouseX/width;rotate(theta);rectMode(CENTER);rect(0,0,50,50);}
//THOR HELLSTORM

//
//void setup(){size(500,500);}void draw(){int x=frameCount%200+1;background(200);for(int i=0;i<25;i++){ellipse(random(500),random(500),x,x);}}
//by stephan

//int a=0;void draw(){fill(a);ellipse(50,50,80,80);}void mouseMoved(){a=a+ 10;if(a>100){a=0;}}
// Marianne

//void setup () {size(600,600);}void draw (){ {float a=random(70); float b= random(70);rect(mouseX,mouseY, a, b);fill(0,b=random(50),255,50);}}
// Luisa 

//int a=2;void draw(){for (int c=0; c<a;c++){stroke(255,20);line(mouseX/2,mouseY/2,mouseY*2,mouseX*2);}} //by Anette



