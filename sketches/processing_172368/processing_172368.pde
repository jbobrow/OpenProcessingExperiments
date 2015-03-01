
void setup(){
  size(600,600);
  background(0,0,255);
}
void draw(){
   if (mouseX <= width/2){
    background(255);}
    else background(0,100,180);
    strokeWeight(3);
    if (mouseY<= height/2){
      fill(0,255,0);
      ellipse(300,300,150,150);
      fill(0,255,0);
}
      else background(255,0,0);
  line(300,0,300,600);
  line(0,300,600,300);
  strokeWeight(10);}


int [] sea = new int [100];
void setup(){
  size(1200,700);
}
void draw(){
  for (int i = 0; i < 100; i ++){
    sea[i] = i;
    fill(mouseX*1.5,mouseY*1.5,mouseX+mouseY);
    ellipse(i*mouseX/2,i*mouseY/2,sea[i],sea[i]);
    rect(i*mouseX/2,i*mouseY/2,sea[i],sea[i]);
  }
}
