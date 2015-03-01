
float px=80;
void setup (){size(900,900);background(135,227,198);}
 

void draw() {{
  float x = random(900);
  float y = random(900);
  float distancia = dist(width/600, height/900, 60, 90);
  if (distancia<50) {
   fill(206,69,0);
  }else{
    fill(50,10);
  }
   line(900,900,900,5);
}

{ if (mousePressed)rect(mouseX, 40, mouseX, 850);stroke(255);
line(mouseX-48, mouseY+300, mouseX +80, mouseY-300);stroke(49,97,65,5);} }

