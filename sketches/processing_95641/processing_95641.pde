
size(600,600);
smooth();
background(147,237,74);


//cara
noStroke();
fill(149,83,41);
ellipse(300,300,230,300);

//ojos blancos
noStroke();
fill(255,255,255);
ellipse(280,250,40,60);
fill(255,255,255);
ellipse(320,250,40,50);

//nariz
fill(250,142,0);
ellipse(300,280,40,50);
noStroke();
fill(255,170,60);
ellipse(300,277,38,39);

//ojos negros
noStroke();
fill(0,0,0);
ellipse(285,250,15,20);
ellipse(315,250,15,20);

//flor
pushMatrix();

translate(250,180);
for(int i=0; i<30; i++){
    
    rotate(PI/8);
    fill(255,0,0);
    noStroke();
    ellipse(0,15,10,20);
}
popMatrix();


//huevo
fill(255,246,167);
beginShape();
vertex(165,315);
bezierVertex(165,315,300,650,430,315);
endShape(CLOSE);

fill(149,83,41);
triangle(300,315,320,350,340,315);
triangle(265,315,285,350,305,315);
triangle(335,315,355,350,375,315);


//grano
noStroke();
fill(255,246,167);
ellipse(250,180,12,12);

//huevo2
ellipse(120,410,100,130);


fill(149,83,41);
ellipse(300,140,15,70);
ellipse(311,140,10,40);





