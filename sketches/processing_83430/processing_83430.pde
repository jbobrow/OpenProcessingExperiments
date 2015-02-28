
size (500,500);
background(240);


  

 
 //linea
noFill();
strokeWeight(1);
stroke(0,220,255);
for(int i= 10; i<500; i=i+10){
  for(int j= 10; j<500; j=j+10) {
    line(i,j,i,j+1);
  }
}

//esfera
fill(255);
strokeWeight(0.3);
stroke(210);
for ( int c = 10; c < 600; c = c + 20) {
  for(int d = 20; d < 600; d = d + 20) {
    ellipse(c, d, 40, 40);
  }
  
}


  
  
//triangulo cuadrante 3
noFill();
strokeWeight (0.2);
stroke(0,200,20);
for (int e =10; e<500; e = e + 10) {
  for(int f=10; f<500; f = f+10){
    beginShape();{
    vertex(250+e,230+f);
    vertex(265+e,260+f);
    vertex(235+e,260+f);
    endShape(CLOSE);
  }
  }
}

//triangulo cuadrante 1
noFill();
strokeWeight (0.2);
stroke(0,30,200);
for (int e =0; e<250; e = e + 10) {
  for(int f=0; f<250; f = f+10){
    beginShape();{
    vertex(0+e,0+f);
    vertex(15+e,20+f);
    vertex(-15+e,20+f);
    endShape(CLOSE);
  }
  }
}

//circulo central

strokeWeight(0.8);
stroke(255);
fill(255,40,1,30);
for(int k= 500; k>40; k= k-15) {
  ellipse (250,250,k,k);
  }

//circulo centralpequeño
strokeWeight(1);
stroke(255);
fill(255);
ellipse(250,250, 35,35);
