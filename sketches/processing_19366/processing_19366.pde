
int x=0;
PFont sarah;

void setup (){
  size(250,250);
  sarah=createFont("ariel", 20);
}

void draw (){
background (90);
fill (20,190,70);

pushMatrix();
  x=x+1;
if (x>250) {x=10;}
smooth();
text("abc",x-10,20);
popMatrix();

pushMatrix();
  x=x+8;
if (x>250) {x=10;}
smooth();
text("abc",x-10,60);
popMatrix();

fill (20,190,70,random(255));
text("abc",200,200);
}
                

