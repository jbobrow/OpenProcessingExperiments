
void setup (){
size(200,200);
background(255);
}
void draw() {
for(int x=10; x<120 ; x= x+20)
{ stroke (0);
strokeWeight(4);
line(30,x*2,70,x+30);
if ( x > 70 ){ 
stroke (0,155,0);
line(30,x*2,70,x+30);}
}
}
