
//umbrella
 
PFont fonte;
int pingos=200;
float [] chuvax;
float [] chuvay;
 
 
void setup() {
  size(700, 300);
  //background(0);
 
 
  //texto
  fonte = createFont("ARBERKLEY", 48);
  textFont(fonte);
   //chuva
  stroke(150);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
  
}
 
int a = 0;
 
 
void draw() {
  stroke(0);
  //chuva

  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+random(-0.1, 0.5);
    chuvax[i]=chuvax[i]+random(-0.1, 0.1);
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = 0;//floor(random(height));
    }
  }
  
  if (mouseX< width/2) {
    background(3, 16, 67);
  }
  if (mouseX> width/2) {
 
    background(194, 250, 246);
  }
 
 
 
  //pub
  fill(234, 136, 14);
  rect(450, 150, 250, 150);
  for (int i = 150; i < 300; i = i+20) {
    line(450, i, 700, i);
  }
  fill(126, 65, 18);
  rect(550, 200, 150, 120);
  strokeWeight(2.0);
  line(650, 200, 650, 300);
 
  //placa
  if (mouseX<width/2)
    fill(random(245+mouseX/4), 12, 12);
  else
    fill(0, 0, 0);
  strokeWeight(1.0);
  rect(520, 100, 180, 50);
 
  //guarda chuva
  strokeWeight(1.0);
  fill(229, 211, 9);
  triangle(a+50, 290, a+150, 240, a+250, 290);
  a=(a+1)%width ;
  for (int i = 50; i < 250; i = i+50) {
    line(a+150, 240, a+i, 290);
  }
  strokeWeight(3.0);
  line(a+150, 290, a+150, 300);
 
 
  //texto
 
  if (mouseX<width/2) {
    textAlign(RIGHT);
    fill (9, 188, 19);
    text("OPEN", width-1, height-155);
  }
  if (mouseX>width/2){
    textAlign(RIGHT);
    fill (255,0,0);
    text("CLOSE", width-1, height-155);
  }
  //chuva
  
  stroke(129,201,245);
  
  for (int i=-0; i<pingos; i++)
  {
     line(chuvax[i], chuvay[i],chuvax[i]-2, chuvay[i]-2);
    chuvay[i]=chuvay[i]+random(0, 2);
    chuvax[i]=chuvax[i]+random(0.2, 0);
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = 0;//floor(random(height));
    }
  }
}

