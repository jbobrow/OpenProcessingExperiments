
size (800, 400);
background(#C9FFFC);

int resolution=300;  //in quanti punti vogliamo dividere la circonferenza -->più aumentiamo più viene smooth
float radius=100; 
float circleX= width/2; //per mettere la circonferenza al centro
float circleY= height/2;

int resolutionDec=15;

//gambo
strokeWeight(6);
stroke(#77B906);
line(circleX,circleY, circleX, height);


//corolla grande
beginShape();

//stroke(0, 50);
//strokeWeight(0);
noStroke();
fill(#FF76E9);
for (int i=0; i< resolution; i++){
  
  float waveAngle= map(i,0, resolution, 0 , TWO_PI*15); //combiando il fattore moltiplicativo modifico il numero di onde
  float waveOffset= sin (waveAngle)*30;//lo moltiplico per 30 altrimenti l'offset sarebbe solo di un pixel e quindi lo scalo
  
  float angle= map(i,0, resolution, 0, TWO_PI);
  float circleOffX= cos(angle)*(radius+waveOffset); //trova la distanza dei punti sulla circonferenza sull'asse x
  float circleOffY= sin(angle)*(radius+waveOffset);
  
  float x= circleX+circleOffX ;
  float y=circleY+circleOffY;
  vertex(x,y);  
}
endShape(CLOSE);

//corolla piccola
radius=60;
noStroke();
beginShape();
fill(255);
for (int i=0; i< resolution; i++){
  
  float waveAngle= map(i,0, resolution, 0 , TWO_PI*15); //combiando il fattore moltiplicativo modifico il numero di onde
  float waveOffset= sin (waveAngle)*30;//lo moltiplico per 30 altrimenti l'offset sarebbe solo di un pixel e quindi lo scalo
  
  
  float angle= map(i,0, resolution, 0, TWO_PI);
  float circleOffX= cos(angle)*(radius+waveOffset); //trova la distanza dei punti sulla circonferenza sull'asse x
  float circleOffY= sin(angle)*(radius+waveOffset);
  
  float x= circleX+circleOffX ;
  float y=circleY+circleOffY;
  
  vertex(x,y);

  //println(angle);
  
}
endShape(CLOSE);
stroke(0, 50);
strokeWeight(2);
fill(#FFEA00);
ellipse(circleX,circleY,34,34);

float radius1= 15;

for (int i=0; i< resolutionDec; i++){
  float angle=( map(i,0, resolutionDec, 0, TWO_PI))-radians(18);
  float circleOffX= cos(angle)*radius1; //trova la distanza dei punti sulla circonferenza sull'asse x
  float circleOffY= sin(angle)*radius1;
  float x= circleX+circleOffX; //posiziona tale distanza a partire dal centro
  float y=circleY+circleOffY;

  ellipse(x, y, 5, 5);
}

float radius2= 10;

for (int i=0; i< resolutionDec; i++){
  float angle=( map(i,0, resolutionDec, 0, TWO_PI))-radians(18);
  float circleOffX= cos(angle)*radius2; //trova la distanza dei punti sulla circonferenza sull'asse x
  float circleOffY= sin(angle)*radius2;
  float x= circleX+circleOffX; //posiziona tale distanza a partire dal centro
  float y=circleY+circleOffY;

  ellipse(x, y, 5, 5);
}

/*for (int i=0; i< resolutionDec; i++){
  float angle=( map(i,0, resolutionDec, 0, TWO_PI))-radians(5);
  float circleOffX= cos(angle)*radius; //trova la distanza dei punti sulla circonferenza sull'asse x
  float circleOffY= sin(angle)*radius;
  float x1= circleX+circleOffX; //posiziona tale distanza a partire dal centro
  float y1=circleY+circleOffY;

  line(x1, y1, 5, 5);
}*/

