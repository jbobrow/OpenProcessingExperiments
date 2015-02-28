
//execícios de for

void setup() {
  size(900, 700);
  strokeWeight(10);
  smooth();
  strokeCap(SQUARE);
  background(255);
  smooth();
  fill(120);
  text("", width/2,height/2);
}


void draw() {
  
}

void mousePressed() {
  background(255);
  
  //um fundo
  int y=0;
  strokeWeight(.5);
  while(y<height){
    fill(100);
    line(0,y,width,y);
    y+=4;
  }
  
  pushMatrix();
  fill((105),(245),(255));
  translate(width/2, height/2);
  strokeWeight(200);
  int quantos=5;
  for (int i=0; i<quantos; i++) {
    float ang=round(random(1,12)*PI/5);
    arc(0, 0, (i+1)*100, (i+1)*100, ang, ang+round(random(1,10)*PI/5));
    rotate(-PI/quantos);
  }
  popMatrix();
}
