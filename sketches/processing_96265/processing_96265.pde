
void setup (){
size (200, 200);
background (124,252,0);
}
int x=-100;
int y=05;
 
void draw (){
int spacing= 8;
int endegs= 100;
 
strokeWeight(10);
x=x+spacing;
point (x+100,x*x/100+100);
point (-x+100,-x*x/100+100);
point (x*x/100+100, x+100);
point (-x*x/100+100, -x+100);
 
 
}
