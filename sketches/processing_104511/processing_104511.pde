
void setup() {
  size(300,470);
}
void draw() {
  background(161,220,222);
  noStroke();
  fill(160);
  rect(0,450,300,20); //chão
  noFill();
  stroke(147);
  strokeWeight(3);
  line(50,450,90,350); //base lat esq
  line(250,450,210,350); //base lat dir
  line(90,350,210,350); //chão mirante 1
  line(90,320,210,320); //topo mirante 1
  for(int x = 90; x <= 210; x += 5) {
    line(x,320,x,350);
   }
  line(80,450,120,350); //base int lat esq
  line(220,450,180,350); //base int lat dir
  line(78,380,222,380); //linha sobre arco
  arc(150,415,110,70,PI,TWO_PI); //arco
  if(mouseY < 140) {
    line(130,140,140,60); //4 lat esq
    line(170,140,160,60); //4 lat dir
    line(150,140,150,60); //linha meio
    rect(140,40,20,20); //mirante 4
    for(int x=140; x<160; x+=4) {
      line(x,40,x,60);
    }
    line(150,40,150,20);
  }
  if(mouseY < 230) {
    line(116,230,130,140); //3 lat esq
    line(184,230,170,140); //3 lat dir
    line(141,230,150,140); //3 int lat esq
    line(159,230,150,140); //3 int lat dir
    line(130,140,170,140); //divisão
  }
  if(mouseY < 320) {
      line(99,320,112,250); //2 lat esq
      line(201,320,188,250); //2 lat dir
      line(126,320,139,250); //2 int lat esq
      line(174,320,161,250); //2 int lat dir
      line(109,265,191,265); // linha abaixo mirante 2
      line(112,250,188,250); //chão mirante 2
      line(112,230,188,230); //topo mitante 2
      for(int x=112; x<=188; x+=4) {
        line(x,250,x,230);
      }
  }
}
