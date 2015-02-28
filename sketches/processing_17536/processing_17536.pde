
//Asymmetrical balance

void setup(){
size(250,250);
background(255);
smooth();
}

void draw(){
stroke(255);
strokeWeight(5);
fill(0);
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));
rect(random(300),random(300),random(100,125),random(50,125));

stroke(255);
strokeWeight(random(5));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
line(random(300),random(300),random(300),random(300));
}

void keyPressed(){
  if (key=='p'){
    saveFrame("random.png");
  }
}
  

