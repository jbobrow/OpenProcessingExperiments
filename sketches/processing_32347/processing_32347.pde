
void setup(){
size( 1680, 1000);
noStroke();
}
void draw (){
background( 0, 0, 0);
for( int x=650; x>=400; x-=50){
fill( x-395, x, x/13*7/10+4*123);

bezier( 350+mouseX, 100+mouseY, x+mouseX, 200+mouseY, 700-x+mouseX, 500+mouseY, 350+mouseX, 600+mouseY);

}

for( int y=50; y<=300; y+=50){
fill( y, y/5, y*7);

bezier( 100+mouseX, 350+mouseY, 200+mouseX, y+mouseY, 500+mouseX, 700-y+mouseY, 600+mouseX, 350+mouseY);

}
}








