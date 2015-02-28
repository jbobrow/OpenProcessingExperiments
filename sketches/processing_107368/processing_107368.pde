
float a;
int luz = 0;
float x;
void setup(){
  size(500, 650);
frameRate(7);
}


void draw (){
  
  background(#03021F); 
  
  for(int a = 0; a <= 500; a = a+100){
    for(int b = 0; b <+ 500; b = b+50){
      stroke (random(0, 255));
      point(random(a), random(b));
    }
  }
  
  noStroke();
beginShape();{ //rua
  vertex(0,500);
    vertex(0, 650);
  vertex(500, 650);
  vertex(500, 500);
  }
  endShape();
fill(250);
rect(80, 40, 160, 520);//torre marrom


fill(luz);
for(int j = 120; j<400; j = j+30){
rect(100, j, 100, 20);//janelas da torre
}


fill(150);

for(int a=130; a<370; a = a+110){
rect(a, 420, 20, 150);//pilares da base


}

fill(x, HSB, random(x));
beginShape();{//tronco de pirâmide do prédio
  
vertex(400, 450);
vertex(100,450);
vertex(200, 100);
vertex(300, 100);

}
endShape();

fill(100);
beginShape();{//trapézio da base
  vertex(400, 450);
  vertex(100, 450);
vertex(130, 480);
vertex(370, 480);

}
endShape();


}

void mouseReleased(){
  if (mouseX >200){
  x= RGB;
  } if (mouseX<300){
  x=(#907C7C);
} else{
    x=random(HSB, 255);
  }
}


void mouseClicked(){
  if (luz== 0){
    luz=255;
  } else {
    luz=0;
  }
}
