
void setup (){
  size (205,125);
  background(255);}
  
 void draw (){
noStroke();

int i = 10;
while (i<100){
fill (150);
rect (i,5,5,55);

i=i+10;
}
int a = 10;
while (a<60){
fill (245,184,0);
rect (105,a,95,5);
a=a+10;
}

stroke (255,51,204);
strokeCap (SQUARE);
strokeWeight (5);
int r=-150;
while(r<105){
  line (r+100,63,r,125);
  r=r+20;

}

noStroke();
fill (255);
rect (105,65,95,55);

stroke (0,175,255);
strokeCap (SQUARE);
strokeWeight (5);

line (112,60,214,125);
line (130,60,232,125);
line (148,60,250,125);
line (166,60,268,125);
line (184,60,330,152);

line (102,65,195,125);

line (102,77,177,125);
line (102,89,159,125);
line (102,101,141,125);
line (102,113,123,125);

stroke (255);
strokeCap (SQUARE);
strokeWeight (5);
line (100,60,200,60);

noStroke ();
fill (0);
rect (0,0,205,5);
rect (0,200,205,5);
rect (0,0,5,125);
rect (200,0,5,125);

rect (100,0,5,125);
rect (0,60,205,5);
rect (0,120,205,5);
 }


