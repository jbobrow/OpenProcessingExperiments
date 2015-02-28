
void setup(){
size(600,600);
background(255);
frameRate(10);
}


void draw()
{
  face();
  float d= dist(mouseX, mouseY, width/2, height/2);
  if (d<=150)
  {   
    background(255);
    face();
    generated();
  }
  else{
    bg();
    face();
  }
}

void face(){
  int r=220;
  noStroke();
  
  fill(#ffb361);
  stroke(#ff8400);
  ellipse(width/2, height/2, r, r+10);
  fill(0);
  noStroke();
  ellipse(width/2-50, height/2-50, 10, 10);
  ellipse(width/2+50, height/2-50, 10, 10);
  fill(255);
  arc(width/2, height/2+30, 100, 100, 0, PI);
  fill(#ff8400);
  triangle(width/2, height/2-15, width/2+5, height/2, width/2-5, height/2);
  textSize(26); fill(0);
  text("CLICK",width/2-30,height/2+150);
}

void bg(){
  float x=random(600), y=random(600), d=random(80,150);
  float r=random(255), g=random(255), b=random(255);
  fill(r,g,b,180);
  noStroke();
  ellipse(x,y,d,d);
}



void generated(){
  fill(255,0,0);
  translate(width/2, height/2);
  for (int m = 0; m<3; m++) {
   pushMatrix();
    for (int n = 0; n<100; n++) {
      float angle = random(-10, 10);
      rotate(radians(angle));
      float size = map(n, 0, 100, 1, 30);
      ellipse(0, 0, size, size);
      translate(0, 2);
    }
  popMatrix();
  }
} 

void mouseClicked(){
 background(255);
}


