
size(600,600);
background(64, 83, 100);
smooth();

strokeWeight(1);
stroke(183,202,219);
noFill();
ellipse(90,540,40,40);

strokeWeight(1);
stroke(183,202,219);
noFill();
ellipse(150,540,40,40);

strokeWeight(1);
stroke(183,202,219);
noFill();
ellipse(210,540,40,40);

noStroke();
fill(75,26,32);
rect(370,100,20,200);

strokeWeight(1.5);
stroke(255);
fill(183,202,219);
rect(550,20,20,20);

noStroke();
fill(197,218,159);
triangle(330,300,430,300,380,380);

noStroke();
fill(0);
rect(370,300,20,10);

strokeWeight(2);
stroke(0);
noFill();
arc(580, 330, 80, 120, PI, PI+HALF_PI);

strokeWeight(2);
stroke(0);
noFill();
arc(500, 330, 80, 120, 0, HALF_PI);

//spiral
translate(width/4,height/4);
strokeWeight(3);
stroke(0);
fill(165, 199, 211);
beginShape();
for(int i=0;i<60;i++)
{
  curveVertex((i*2)*sin(i/3.0),(i*2)*cos(i/3.0));
}
endShape();
