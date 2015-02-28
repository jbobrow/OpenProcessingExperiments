
size(300,600);
smooth();


//Background of circles
for (int e=25; e<300; e+=50){
for (int f=25; f<600; f+=50){
noStroke();
fill(255,120);
ellipse(e,f,50,50);
}
}

//This portion takes advantage of manipulating the control points on
// a bezier vertex curve.


//Left Half of Spindle
for (int x=0; x<=150; x+=5){
stroke(1);
fill();
beginShape();
vertex(150,0);
bezierVertex(x,300, x,301, 150,600);
endShape();
}

//Right Half of Spindle
for (int a=300; a>=150; a-=5){
beginShape();
vertex(150,0);
bezierVertex(a,300, a,301, 150,600); 
endShape();
}
                
                
