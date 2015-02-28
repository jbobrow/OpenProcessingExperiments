
int pX;
int pY;
int cor;

void setup() {
  size(300,300);
  background(#F7EEAA);
     
}

void draw() {
  strokeWeight(0);
  stroke(0);
  
  pX = 85;
  pY = 40;
  //int cor = 

//haste
line(pX + 4,pY - 2,63,40);

    
//body
fill(#560C7C);
ellipse(pX, pY,56,48);

//boca
fill(#E51710);
arc(pX + 5, 55, 25, 8,0,PI/1/2/2);

//branca - globo ocular
fill(255);
ellipse(90,40,15,15);

//branca - globo ocular
fill(255);
ellipse(105,40,15,15);

//haste
line(85,38,63,30);

//preta
fill(0);
ellipse(90,40,6,4);
//preta
fill(0);
ellipse(105,40,6,4);


//braços - esquerda p/ direita
rect(60,51, 3, 18);
rect(74,60, 3, 18);
rect(90,65, 3, 18);
rect(105,55, 3, 18);

//mãos - esquerda p/ direita
ellipse(60,70,12,12);
ellipse(76,80,12,12);
ellipse(93,80,12,12);
ellipse(108,79,12,12);

//cajado 
ellipse(108,75,5,12);
strokeWeight(3);{
line(106,85,68,150);
}

int pm = mouseX;
int pmy = mouseY;
println("mouseX= "+pm+"mouseY= "+pmy);

}








