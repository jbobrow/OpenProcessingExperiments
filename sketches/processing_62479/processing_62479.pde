
int pos1; pos2;
void setup (){
size (400,400);
pos1 = 25;
pos2 = 375;

}
void draw(){
background (150);
ellipse (pos1,pos1,50,50);
ellipse (pos2,pos1,50,50);
pos1++;
pos2--;

}
