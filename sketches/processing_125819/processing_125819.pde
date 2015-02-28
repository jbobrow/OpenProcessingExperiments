
size(700,350);
background(0);
for(int x=0; x<=240; x+=20){
  rectMode(CORNERS);
  rect(100,x+20,600,x+40);//define retangulos brancos
}
for(int x=0; x<=260; x+=40){
  rectMode(CORNERS);
  fill(#FF0000);
  rect(100,x+20,600,x+40);//define retangulos vermelhos
}
rectMode(CORNERS);
fill(#0628CB);
rect(100,20,350,160);//define retangulo azul
noStroke();
fill(250);
for(int x=5; x<=205; x+=40){//repete fileira com 6 estrelas
  for(int y=30;y<=150;y+=30){
  beginShape();
  vertex(x+110,y);
  vertex(x+117,y);
  vertex(x+120,y-5);
  vertex(x+123,y);
  vertex(x+130,y);
  vertex(x+123,y+3);
  vertex(x+130,y+10);
  vertex(x+120,y+5);
  vertex(x+110,y+10);
  vertex(x+117,y+3);
  endShape(CLOSE);
  }
}
for(int x=0; x<=160; x+=40){//repete fileira com cinco estrelas
  for(int y=45;y<=135;y+=30){
    beginShape();
  vertex(x+135,y);
  vertex(x+142,y);
  vertex(x+145,y-5);
  vertex(x+148,y);
  vertex(x+155,y);
  vertex(x+148,y+3);
  vertex(x+155,y+10);
  vertex(x+145,y+5);
  vertex(x+135,y+10);
  vertex(x+142,y+3);
  endShape(CLOSE);
  }
}
textSize(30);
fill(250);
textAlign(CENTER);
text("UNITED STATES OF AMERICA",350,320);//escreve o nome da bandeira
