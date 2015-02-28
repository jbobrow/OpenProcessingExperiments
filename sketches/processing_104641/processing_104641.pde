
int x;


void setup() {
  smooth();
  size(600, 400);
  ;
  frameRate (10);
}

void draw () {

  if (mouseY>200) // grama
  {
    background(100, 200, 10);
  }
  else {
    background(50, 100, 10);
  }

  noStroke ();

  if (mouseY>200) //céu
  { 
    fill (158, 195, 246);
  }
  else {
    fill (100, 100, 255);
  }
  rect (0, 0, 600, 300);

  if ( mouseY>200)
  {
    fill(255, 249, 45);
  }
  else {
    fill(255);
  }
  ellipse(400, 100, 90, 90);

  x++;
  fill (255, 200);
  ellipse (x-500, 30, 200, 45);
  ellipse (x+175, 120, 150, 50); 
  ellipse (x+150, 100, 150, 50);
  ellipse (x-100, 70, 300, 60);
  ellipse (x-175, 190, 150, 50); 
  ellipse (x-120, 180, 150, 50);
  ellipse (x-400, 170, 200, 45); //nuvens



  stroke( 255);
  strokeWeight(5);
  for (int a=1; a<600; a=a+100) {
    line(a, 270, a, 330);
  }
  line(0, 280, 600, 280);
  line(0, 310, 600, 310);

  strokeWeight(20);
  stroke(0);
  fill(0);
  line(130, 290, 120, 350);//rabo
  line(350, 245, 200, 270);//crina

  strokeWeight(5);
  stroke(150, 100, 50);
  fill(150, 100, 50);
  ellipse(200, 280, 150, 50);//corpo
  strokeWeight(25);
  line(350, 255, 200, 280);//pescoço
  strokeWeight(25);
  ellipse(340, 260, 20, 20);//cabeça
  line(350, 260, 365, 280);//focinho
  line(150, 300, 150, 370);//patas
  line(250, 300, 250, 370);
  strokeWeight(8);
  line(355, 230, 350, 255);
  stroke(0);
  strokeWeight(4);
  point(353, 257);
}
