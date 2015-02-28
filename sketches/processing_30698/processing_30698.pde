
size (400, 650); //define o tamanho da janela  
background(0,124,123);//define a cor do background
smooth();//aplica anti-alias
  
   
  for ( int i = 0; i < 10000; i = i +1)
  {  
    float x = random (5,10);//define variável x; número de loop aleatório
    //define as características do objecto
    noStroke(); 
    fill (random(35), random(44), random(44), random(60));
    rect ( random(30,100), random(height),x,x);
  }
  for ( int i = 0; i < 10000; i = i +1)
  {  
    float x = random (5,10);//define variável x; número de loop aleatório
    //define as características do objecto
    noStroke(); 
    fill (random(35), random(44), random(44), random(60));
    rect ( random(50,200), random(height),x,x);
  }
  for ( int i = 0; i < 10000; i = i +1)
  {  
    float x = random (5,10);//define variável x; número de loop aleatório
     //define as características do objecto
    noStroke(); 
    fill (random(35), random(44), random(44), random(60));
    rect ( random(50,300), random(height),x,x);
  }
  for ( int i = 0; i < 10000; i = i +1)
  {  
    float x = random (5,10);//define variável x; número de loop aleatório
     //define as características do objecto
    noStroke(); 
    fill (random(35), random(44), random(44), random(60));
    rect ( random(50,400), random(height),x,x);
  }
  saveFrame("ex3.png");//salva uma imagem

