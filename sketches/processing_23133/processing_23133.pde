


void setup (){
  size (800,400);
background (129,129,129);
}
void draw(){
  for (int b = 0; b<=width; b=b+20){
smooth ();
stroke (100,b,b,25);
rect (0,b,b,300);

stroke (b,129,b,20);
line (800,400,b,0);
line (300,0,0,b);
strokeWeight (2);
stroke (100,129,b,20);
line (100,b,b,300);

}
for (int v=0 ; v<height; v+=80) {
 fill (v,140,150); 
 smooth ();
 strokeWeight (20);
 stroke (255,25);
 ellipse (v,v,v,80);
 ellipseMode (CORNER);
 ellipse (v,0,30,30);
 fill (50,0,50,40);
 rect (400,v, width,50);
 strokeWeight (1);
// line (0,v,v,800);
 //line (v,0,0,800);
}

}

