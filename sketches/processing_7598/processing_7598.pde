

//setup=configuração
void setup(){
   size(800,600);
   background(250,250,250);
}  

//draw=desenhar=redesenhar=refaz a leitura do código
//randon=sorteia=aleatoriamente("joga dados")
void draw(){
  smooth();//ficar sem pontinhas
  //noStroke();//retirar contorno
  
fill(random(25),230,15);
triangle(random(0,800),random(600),100,100,200,200);

fill(random(220),0,200);
triangle(random(800),random(800),100,100,200,200);


}

