
/*A minha melhor experiência deste ano foi a ida ao Rio de Janeiro
para a Jornada Mundial da Juventude. representei através de Jesus
Sacramentado, exposto no ostensório, porque o ápice do encontro
se deu na adoração na última noite, a qual marcou a unidade e
a força da minha Igreja.*/
void ostensorio() {
  int meio=width/2;
  strokeWeight(20);
  stroke(255,160,60);
  fill(255,160,60);
  triangle(meio,meio,145,340,155,340);
  stroke(230,140,0);
  strokeWeight(6);
  line(meio, 5, meio, 300);
  line(5, meio, 300, meio);
  line(90,12,206,280);
  line(205,10,95,285);
  line(45,45,250,250);
  line(253,44,44,253);
  line(10,210,290,90);
  line(12,92,286,205);
  strokeWeight(20);
  stroke(255,160,60);
  fill(250);
  ellipse(meio,meio,100,100);
  fill(255,160,60);
  triangle(meio,348,100,480,200,480);
  ellipse(meio,480,120,30);
  stroke(140);
  ellipse(meio,340,30,10);
  strokeWeight(2);
  stroke(0);
  for(int i=0;i<=25;i+=5){
    line(138+i,332,138+i,348);
  }
 }

String jesusCristo(){
  return("JHC");
}

void raios(int transp1, int transp2){
  int c=150;
  noStroke();
  fill(255,transp1);
  triangle(c,c,250,-60,340,40);
  triangle(c,c,300,420,300,365);
  triangle(c,c,20,-40,-40,100);
  triangle(c,c,-20,500,5,560);
  fill(255,transp2);
  triangle(c,c,300,c+20,300,240);
  triangle(c,c,100,-10,180,-10);
  triangle(c,c,0,230,0,350);
}

void setup(){
  size(300,530);
  background(200);
  smooth();
  textSize(30);
}
int y=250;
int x=0;
void draw(){
  background(200);
  raios(x,y);
  ostensorio();
  fill(0);
  text(jesusCristo(), 122,162);
  y-=5;
  x+=5;
  if(y==0){
    y=250;
    x=0;
  }
}
