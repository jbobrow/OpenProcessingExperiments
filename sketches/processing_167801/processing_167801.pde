

float a,b,c,d;
int m= #14CAD8;
int o= #618FB4;
int p= #7F2881;
boolean change=false;
void setup()
{
size(500,500);
background(#D5EEF0);
fill(#8C949B);
rect(0,460,500,35);

}
void draw()
{
if(change==true){

fill(m,220);
m=m+1;
rect(a,b,d,d);
a=random(20,490);
b=random(20,450);
d=random(20-40);
} else{

fill(p,200);
o=o+1;

p=p+1;

ellipse(a,b,c,c);
a=random(10,490);
b=random(20,450);
c=random(0,30);


}
}
void mousePressed(){
if(mouseY>460 && mouseX>0 && mousePressed){
background( #618FB4);
fill( #8C949B);
rect(0,460,500,35);
change=!change;
}
}
