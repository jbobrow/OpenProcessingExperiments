
size(500,500);
background(74,188,172);
noFill();


smooth();
float inc=0.0;
float angle=noise(1);
float i =8;
float w=random(255);

for(float x=angle;x<=width-20; x+=25){
  for(float y=angle;y<=height-20;y+=56){
    float anglex=x+(cos(angle)*i);
    float angley=y+(sin(angle)*i);
    for(float d=angle; d<=random(w);d=d+6){
      float noiseInc=inc*0.25;
      float boja= d/noise(noiseInc);
      stroke(boja,boja,boja);

      strokeWeight(w/boja);

      beginShape();
      vertex(anglex+boja,angley+boja);
      vertex(x+boja,y+boja);
      vertex(anglex+x,angley+y);
      endShape(CLOSE);
    }

  }
  angle=angle+2.5;
}


