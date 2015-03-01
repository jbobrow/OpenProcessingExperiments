
int x = -15;
int speedx=int(random(3));
int speedy=int(random(3));
int punkte;
int y=100;

void setup () {
  size(500, 500);
}

void draw () {
  


  // Ball
  background (#D1FFE3);
  ellipse(x, y, 30, 30); 
  x=x + speedx;
  y=y+speedy;


  //Punktestand
  fill(0);
  textSize(20);
  text(punkte, 250, 50);

  //Fadenkreuz
  line(mouseX, mouseY-5, mouseX, mouseY+5);
  line(mouseX-5, mouseY, mouseX+5, mouseY);

  //Abprallen an der Wand
  if (x<-15 || x>width+15) {
    speedx=-speedx;
  }

  if (y<=-15 || y>=height+15) {
    speedy=-speedy;
  }

  //rote Färbung bei Mauskontakt
  if (mouseX>=x-15 && mouseX <=x+15 && mouseY>=y-15 && mouseY<=y+15) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }

} 

// Punkte bekommen
void mousePressed()
{ 
  if (mouseX>=x-15 && mouseX <=x+15 && mouseY>=y-15 && mouseY<=y+15)
  {
    punkte++;
  }

  if (speedx<0) {
    speedx--;
  } else {
    speedx++;
  }
  if (speedy<0) {
    speedy--;
  } else {
    speedy++;
  }
  
}



