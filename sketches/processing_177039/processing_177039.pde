
size(480,120);
smooth();

beginShape();
fill(255,200,200)
vertex(50,120);
vertex(100,90);
vertex(110,60)
vertex(80,20);
vertex(210,60);
vertex(160,80);
vertex(200,90);
vertex(140,100);
vertex(130,120);
endShape();
fill(255);
ellipse(155,60,8,8);

void draw(){
 if(mousePressed) {
 fil(0);
}else{
 fill(255,0,128);

}

ellipse(mouseX,mouseY,40,40);

}

