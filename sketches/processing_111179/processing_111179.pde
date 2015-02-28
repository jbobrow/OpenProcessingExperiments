
float noiseScale=0.02;
int x;

void setup() {
  size(300, 600);
  background(0);
}

void draw() {
  background(14, 33, 139);
  fill(14, 129, 59);
  quad(0, 450, 300, 450, 300, 600, 0, 600);
  noStroke(); 
  fill(255);//lua
  ellipse(mouseX, mouseY, 60, 60);
  fill(14, 33, 139);//lua crescente
  ellipse(mouseX-30, mouseY, 60, 60);

  /*for(int y = 0 ; y < 400 ; y= y+1){
  stroke(2,33,125);
line(0,y,300,y);
  stroke(2+y,33+y,125);
line(0,400+y,300,400+y);
fill(171,229,195);
quad(0,600,300,600,300,480,0,480);
*/
//predio
  fill(162162,162);
  quad(50,525,245,525,240,510,45,510); //chao
  
  fill(255, 242, 3);//amarelo
  ellipse(150, 178, 40, 40);
  fill(103, 71, 250);//azul
  ellipse(190, 250, 35, 35);
  ellipse(150, 290, 35, 35);
  fill(103, 71, 250);//verde
  arc(190, 340, 60, 40, PI+QUARTER_PI, TWO_PI);
  fill(64, 242, 91);
  quad(150, 360, 150, 375, 110, 375, 130, 360);
  fill(250, 41, 83);
  ellipse(190, 390, 24, 24);
  ellipse(190, 415, 35, 35);
  fill(237, 239, 242);
  quad(150, 100, 190, 148, 190, 500, 150, 500);//torre
  quad(70, 515, 240, 515, 225, 500, 100, 500);
  fill(0);
  arc(115, 515, 25, 25, PI, TWO_PI);//entrada 1
  arc(150, 515, 15, 15, PI, TWO_PI);//entrada 2




  for (int x=0; x < width; x++) {// ruido e mato
    float noiseVal = noise((mouseX+x)*noiseScale, 
    mouseY*noiseScale);
    stroke(noiseVal*10, 150, 49);
    line(x, mouseY+400+noiseVal*80, x, 600
      );
  }
}
