
void setup(){
size(500,500);
smooth();
noStroke();
colorMode(RGB);
noLoop();
}

void draw(){
//red_suica  
for (int i = 0; i < 4000; i++) {
  fill(255,random(0,150),random(0,100));
  ellipse(random(0,700),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(0,700),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(0,700),random(0,150),30,30);
  }

for (int i = 0; i < 3000; i++) {
  fill(255,random(0,100),random(0,100));
  ellipse(random(0,700),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(0,700),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(0,700),random(0,150),30,30);
  }
  
//white_suica 
 for (int i = 0; i < 100; i++) {
  fill(255,random(150,200),random(150,200),150);
  ellipse(random(450,750),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(450,750),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(450,750),random(0,150),30,30);
  }
  
 for (int i = 0; i < 1000; i++) {
  fill(255,random(200,255),random(200,255),150);
  ellipse(random(600,800),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(600,800),random(0,150),30,30);
  rotate(PI/60);
  ellipse(random(600,800),random(0,150),30,30);
}
//green_suica
for (int i = 0; i < 10; i++) {
  fill(0,random(100,200),0,150);
  ellipse(random(430,500),random(430,500),30,30);
  ellipse(random(400,500),random(480,500),30,30);
  ellipse(random(480,500),random(400,500),30,30);
  
}

 filter(BLUR,1);

//green
  for(int i = 0; i< 50; i++){
  stroke(0,random(100,150),0);
  noFill();
  strokeWeight(1);
  curve(400,300,500,random(400,500),random(400,500),500,300,400);
  }
  
//suica_tane 
  for (int i = 0; i < 10; i++) {
  fill(random(0,30),0,0,random(150,255));
  noStroke();
  rotate(PI/12);
  scale(0.8);
  ellipse(random(300,500),random(-50,0),30,15);
  scale(1.2);
  ellipse(random(300,500),random(-50,0),30,15);
  fill(random(200,255),random(200,255),random(100,200),150);
  ellipse(random(300,500),random(-50,0),20,10);
  }

}


