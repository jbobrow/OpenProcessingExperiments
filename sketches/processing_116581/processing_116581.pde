
void setup(){

size (600,600);
background(148,118,92);

}

void draw(){

strokeWeight(1);
  
//raton marcando puntos  
//println(mouseX+","+mouseY);

//cabeza
noStroke();
fill(80,80,80);
ellipse(260,356,380,270);

//orejas
ellipse(70,320,80,120);
ellipse(450,320,80,120);

//cabello
fill(218,28,205);
beginShape();
noStroke();
vertex(240,240);
vertex(275,240);
vertex(323,75);
vertex(295,96);
vertex(279,75);
vertex(269,96);
vertex(259,75);
vertex(244,96);
vertex(224,75);
endShape(CLOSE);

//ojos
smooth();
fill(0,0,0);
arc(190,285,100,100,0,PI);
 
smooth();
fill(0,0,0);
arc(340,285,100,100,0,PI);
 
smooth();
fill(255,255,255);
arc(190,280,100,100,0,PI);
 
smooth();
fill(255,255,255);
arc(340,280,100,100,0,PI);
 
smooth();
fill(45,240,120);
arc(360,280,25,25,0,PI);
 
smooth();
fill(45,240,120);
arc(210,280,25,25,0,PI);

//boca
stroke(0);
strokeWeight(15);
line(210,415,310,415);
fill(255,255,255);
beginShape();
strokeWeight(1);
vertex(245,415);
vertex(245,440);
vertex(260,440);
vertex(260,415);
endShape(CLOSE);
beginShape();
vertex(260,415);
vertex(260,440);
vertex(275,440);
vertex(275,415);
endShape(CLOSE);

line(265,305,300,380);
line(300,380,265,370);

//perilla
noStroke();
fill(218,28,205);
triangle(240,465,265,520,285,465);
}


