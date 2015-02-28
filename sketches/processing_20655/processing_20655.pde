
float y = 0.0;
void setup(){
size(600,600);
background(159);


for(int i=0; i<600; i+=10){
ellipse(i,10,10,10);

for (int j=0; j<height;j+=10)
  ellipse(i,j,3,3);
}
}
void draw(){
  


 
//2 fleshy circles
smooth();
noStroke();
fill(#fbcfcf);
println("x: " + mouseX);
println("y: " + mouseY);
ellipse(216,y*3,120,153);
ellipse(370,mouseY+20,120,43);
fill(#f78684);
ellipse(mouseX-50,y,180,120);
fill(#c56faa);
ellipse(140,mouseY-50,120,143);
ellipse(514,mouseY-10,120,143);

    ///large black circle
   float x = mouseX;
   float y = mouseY;
   float iy = height-mouseY;
   fill(#f489ac );
   ellipse(x,height/2,iy,iy);
float ix = width-mouseX;
fill(0,159);
ellipse(ix,height/2,600,600);
 y+= 3.0;
if( y > 600) {
  y = -50.0;

 

}
}

