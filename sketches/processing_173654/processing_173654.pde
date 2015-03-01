
void setup(){
size (800,800);
background (50);
smooth();
}
void draw (){
for (int i=100; i < height-100; i= i+30){
 for (int x=50; x < width-100; x= x+30){
stroke(0);
 fill (160, 20,40,11 );
rect (i,x,50,50);
ellipse(i,x,100,80);
stroke(255,50,0);
strokeWeight (1);
point (i,x);
}
}
}

