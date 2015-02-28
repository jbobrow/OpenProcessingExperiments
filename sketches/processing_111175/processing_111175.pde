
PImage img; // poder usar imagem (background)
float t;

void setup (){
  size (1000, 600); //define o tamanho
  img = loadImage("ceu-claro-wallpaper-25361.jpg"); //utiliza a imagem como fundo
  smooth();
}

void draw (){
  background (0);
  image(img,0,0);
  t = millis()/25; //variável para o giro das hélices
  noStroke (); // retira os contornos
  fill (255, 247, 247);
  rect (600, 300, 200, 250); //tamanho e preenchimento de paredes
  fill (93, 84, 84);
  triangle (600, 300, 800, 300, 700, 200); // tamanho e preenchimento do telhado
  fill (155, 155, 155);
  rect (680, 340, 40, 60);
  fill (205, 239, 242);
  rect (685, 345, 30, 50);//tamanho e preenchimento da janela
  

  for (float c=345; c<395; c=c+0.001) {
    stroke(c/12,c/3,c/2);
      line (685, c, 715, c);
      
  }
 
 //define a pá
 pushMatrix();
 
 translate(700, 285);
 rotate(t/1000); //giro das pás
 
 strokeWeight(2);
 stroke(map(49,0,99,0,255), map(16,0,99,0,255), 0);
 fill(255,246,165,120);
 line(0,0,60,0);
 line(0,0,0,60);
 line(0,0,-60,0);
 line(0,0,0,-60); //define a cruz no meio das pás (sustentação)
 
 rect(0, 60, -60, 175); //formato da pá
 for(int i = 95; i < 235; i = i+35) {
   line(0, i, -60, i);
 } // linhas de corte da pá
 line(-30,60,-30,235); //linha dividindo a pá em duas metades
 
 rect(60, 0, 175, 60); //formato da pá
 line(60, 30, 235, 30); ///linha dividindo a pá em duas metades
 for(int j = 95; j < 235; j = j+35) {
   line(j, 0, j, 60); //linhas de corte da pá
 }
 
 rect(0, -60, 60, -175); //formato da pá  
 line(30, -60, 30, -235); //linha dividindo a pá em duas metades
  for(int i = 95; i < 235; i = i+35) {
   line(0, -i, 60, -i); //linhas de corte da pá
 }
 
 rect(-60, 0, -175, -60); //formato da pá  
 line(-60, -30, -235, -30); //linha dividindo a pá em duas metades
 for(int i = 95; i < 235; i = i+35) {
   line(-i,0,-i,-60); //linhas de corte da pá
 }
 
 ellipseMode(CENTER);
 ellipse(0,0,20,20); //centro de giro das pás "suporte"
 
 popMatrix(); //fecha o grupo q foi inciado pelo pushma
 
}
