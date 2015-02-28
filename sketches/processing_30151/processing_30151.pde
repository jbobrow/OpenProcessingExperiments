
int w=255;
int h=255;
PVector [] a = new PVector [5];
void setup(){
a[0] = new PVector (25,h/2);
a[1] = new PVector (w/2,25);
a[2] = new PVector (w-25,h/2);
a[3] = new PVector (w/2,h-25);
a[4] = a[0];


size(255,255,P2D);
background(255,0,0);
stroke(1);

beginShape();
for (int i =0;i<a.length;i++){
if (i==0 || i == a.length-1){
vertex(a[i].x,a[i].y);
curveVertex(a[i].x,a[i].y);
}
else
{
curveVertex(a[i].x,a[i].y);
}
}
endShape(CLOSE);

}

void draw(){

a[0] = new PVector (25,h/2);
a[1] = new PVector (w/2,25);
a[2] = new PVector (mouseX,mouseY);
a[3] = new PVector (w/2,h-25);
a[4] = a[0];


background(255,0,0);
stroke(1);

beginShape();
for (int i =0;i<a.length;i++){
fill(a[i].x,a[i].y,255);
if (i==0|| i == a.length-1 ){

vertex(a[i].x,a[i].y);
curveVertex(a[i].x,a[i].y);
}
else
{
vertex(a[i].x,a[i].y);
curveVertex(a[i].x,a[i].y);
//vertex(a[i].x,a[i].y);
}
}

endShape(CLOSE);

}
