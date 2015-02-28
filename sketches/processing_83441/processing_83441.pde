
size (500,500);
background(240);




//esfera
fill(255,127,0,50);
strokeWeight(0.5);
stroke(210);
for ( int c = -20; c < 600; c = c + 20) {
  for(int d = -20; d < 600; d = d + 20) {
    ellipse(c, d, 40, 40);
  }
  
}


//triangulo cuadrante 1
noFill();
strokeWeight (0.7);
stroke(255);
for (int e =-10; e<600; e = e + 10) {
  for(int f=-10; f<600; f = f+10){
    beginShape();{
    vertex(0+e,0+f);
    vertex(15+e,20+f);
    vertex(-15+e,20+f);
    endShape(CLOSE);
  }
  }
}
