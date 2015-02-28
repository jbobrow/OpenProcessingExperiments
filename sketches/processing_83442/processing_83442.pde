
size (500,500);
background(240);

//esfera
fill(32,178,170);
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
for (int e =-30; e<600; e = e + 50) {
  for(int f=-30; f<600; f = f+50){
    beginShape();{
    vertex(0+e,-10+f);
    vertex(70+e,90+f);
    vertex(-50+e,40+f);
    endShape(CLOSE);
  }
  }
}
