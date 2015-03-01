
size(1000,700) 
smooth();
background(0,0,255,160);

beginShape();
vertex(220,240);
vertex(400,240);
vertex(380,340);
vertex(340,300);
vertex(300,320);
endShape(CLOSE);
fill(0); 

beginShape();
vertex(440,360);
vertex(520,240);
vertex(580,360);
endShape(CLOSE);
fill(0);

beginShape();
vertex(600,240);
vertex(660,260);
vertex(700,240);
vertex(680,280);
vertex(660,340);
endShape(CLOSE);
fill(0); 

void setup(){
smooth();
}

void draw(){
if(mousePressed){
fill(0);
}else{
fill(255);
}
line(mouseX,mouseY,80,80);
}



