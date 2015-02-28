

PShape yea;
PShape yea1;
PShape yea2;
PShape yea3;
float a=40;
float b = 60;
int c= 750;
int e= 400;
int f=  500;
int g= 200;
int h = 600;

void setup(){
 fill(255);
  size (400,600);
  
 yea= loadShape ("lifeisyea.svg");
 yea1= loadShape ("lifeisyea1.svg");
 yea2= loadShape ("lifeisyea2.svg");
 yea3= loadShape ("jjjjjjj.svg");
 smooth ();

}

void draw (){
  size(400,600);
 background (0);
 if (mousePressed){
fill(255,random(70,80));
quad(a,b,pmouseX,pmouseY,h,400,e,100);

a= a+1;
e =e+3;
h=h+2;
b=b+2;

} else {
a=0;
b=0;
c=0; 
 e=0; f=0; g =0; h=0;}
  shape (yea,random(-300,600),random(-300,600),500,600);
shape (yea1,random(-300,600),random(-300,600),500,600);
shape (yea2, random(-300,600),random(-300,600),500,600);
delay (50);
}


