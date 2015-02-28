
//Reforço5
//Giovanna DallaCruz
//Não consegui fazer com que as linhas terminassem dentro do limite do quadrado, achei que poderia controlar o limite pelo i<200;
size(200, 200);
background(0);
for (int i=10;i<200;i+=i) {
  stroke(0, 255, 0);
  line(10, 10, 90, i*i/9);
  stroke(0, 0, 255);
  line(190, 10, 110, i*i/9);
}
