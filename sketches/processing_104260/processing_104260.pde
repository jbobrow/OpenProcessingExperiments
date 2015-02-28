
float a;
void setup(){
 size(400,430);
 frameRate(10);
 background(255);}
 
//(#1603FF)azul
//(#FF0000)vermelho
//(#FFF300)amarelo

void draw() { //variação das cores dos retângulos
  noStroke();
  if (mouseX<200){
    fill(#1603FF);
  }
  else if(mouseX>200){
    fill(#FF0000);
  }
  rect(15,25,80,40); //retângulo superior esquerdo
  
  if (mouseY<200){
    fill(#FF0000);
  }
  else if(mouseX>200){
    fill(#FFF300);
  }
rect (100,120,150,85);//retângulo central

 if (mouseX<200){
    fill(#FFF300);
  }
  else if(mouseX>200){
    fill(#1603FF);
    }
rect (250,300, 125, 85); //retângulo inferior direito

if (mouseX<200){
    fill(#FF0000);
  }
  else if(mouseY>200){
    fill(#1603FF);
  }
rect (9,384,90,20); //retângulo inferior esquerdo

if (mouseY<200){
    fill(#FFF300);
  }
  else if(mouseY>200){
    fill(#FF0000);
  }

rect (250,0,125, 15); //retângulo superior direito



  //rect(380, 75, 20, 230);
  
 int x=10;
 stroke(0);
  strokeWeight(10); //retas verticais
  line(x,0,x,x*40);
  line(x*x,0,x*x,x*40);
  line(x*38,0,x*38,x*40);
  line(x*25,0,x*25,x*40);
  
  
  line(0,x*2,x*40,x*2);//retas horizontais
  line(0,x*7,x*40,x*7);
  line(0,x*30,x*40,x*30);
  line(0,x*38,x*40,x*38);
  line(x*x,x*20,245,x*20);
  line(x*x,x*12,245,x*12);
  
  noStroke(); //faixa preta do texto
  fill(0);
  rect(0,400,430,400);

/*int a=255;
int b=0;

if (mouseX<200){ //variação da cor do texto
    fill(a);
  }
  else if(mouseY>200){
    fill(b);
  }*/
  
  fill(random(255)); //cintilação do texto
PFont font; //texto
font = loadFont("Corbel-48.vlw");
textFont(font, 22);
text("Piet Mondrian - Arte Abistrata", 60, 420);
}
