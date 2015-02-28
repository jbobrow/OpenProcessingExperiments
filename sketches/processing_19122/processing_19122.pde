
void setup() {
  size(300,500);
  smooth();
}
void draw() {
  background(40);
  int p=450;
  int g=10;
  while((p>=450)&&(p<height)){
    noStroke();
    fill(0,g,g);
    rect(width/2,p,width,5);
    p+=5;
    g+=5;
  }
  //MONO
  //cuerpo
  noStroke();
  fill(0);
  rectMode(CENTER);
  quad(120,165,185,165,200,295,100,295);
  //brazos y piernas
  strokeWeight(1);
  stroke(0);
  line(125,210,20,90);
  line(185,200,290,90);
  //MANGAS
  strokeWeight(3);
  stroke(160);
  line(115,197,83,162);
  line(190,195,225,158);
  //piernas
  stroke(0);
  line(110,377,90,460);
  line(190,377,210,460);
  //ZAPATOS
  noStroke();  
  quad(95,460,87,460,60,480,95,480);
  quad(207,460,213,460,243,480,209,480);
  //ROPA
  //CUELLO
  fill(160);
  triangle(120,175,185,175,width/2,220);
  fill(256,80,90);
  ellipse(width/2,220,10,10);
  ellipse(width/2,height/2,10,10);
  ellipse(width/2,275,10,10);
  //FALDA
  int l=105;
  int lv=298;
  fill(0);
  rect(width/2,335,100,83);
  //DISENIO
  while((l>=100)&&(l<200)) {
    float R=constrain(mouseX,20,80);
    fill(255,80,90,R);
    rect(l,335,7,83);
    l+=15;
    while((lv>=298)&&(lv<375)) {
      rect(width/2,lv,100,7);
      lv+=15;
    }
  }
  //BOLSAS
  fill(255,90,100);
  rect(120,width,20,15);
  rect(180,width,20,15);
  
    //CABEZA
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(width/2,100,140,180);
  //CHONGOS
  ellipse(width/4,50,50,50);
  ellipse(width/2+75,50,50,50);
  //ojos
  fill(255);
  ellipse(115,80,25,15);
  ellipse(185,80,25,15);
  //iris
  fill(54,23,2);
  ellipse(115,80,15,16);
  ellipse(185,80,15,16);
  //pupila
  fill(0,125);
  ellipse(116,79,7,8);
  ellipse(186,79,7,8);
  //brillo
  fill(255,35);
  ellipse(113,78,5,5);
  ellipse(183,78,5,5);
  //nariz
  fill(35);
  ellipse(width/2,115,15,3);
  //CHAPETES
  int c=constrain(30,3,30);
  while((c<=30)&&(c>3)) {
    fill(256,width/2,width/2,15);
    ellipse(105,115,c,c);
    ellipse(195,115,c,c);
    c-=4;
  }
  fill(255,100,100,80);
  triangle(width/2,160,width/2+15,145,width/2-15,145);
  triangle(width/2,160,width/2+7,151,width/2-7,151);
}


