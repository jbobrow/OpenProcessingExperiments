
float inicio=0.0;
float fin=0.0;
float x=0;
int t=0,mov=0,t1=0;

void setup(){
  size(1000,500);
  noFill();
  smooth();
  background(255);
  frameRate(2);
}

void draw(){
  background(0);
  if(t == 0)
  {
    inicio = QUARTER_PI;
    fin = PI+HALF_PI+QUARTER_PI;
    //DIENTES
    fill(250,250,250);
    triangle(110+mov,220,130+mov,200,130+mov,220);
    triangle(110+mov,280,130+mov,300,130+mov,280);
    //LENGUA
    fill(250,0,0);
    arc(80+mov,250,50,50,0,TWO_PI);
    fill(255,255,0);
    arc(130+mov,250,30,30,0,TWO_PI);
    mov +=1;
    t=1;
  }
  else
  {
    inicio = 0;
    fin = TWO_PI-0.02;
    t=0;
  }
  fill(255,255,0);
  arc(80+mov,250,150,150,inicio,fin);
  //OJO
  fill(0,0,0);
  arc(70+mov,220,30,30,0,QUARTER_PI+HALF_PI);
  arc(70+mov,220,30,30,PI+QUARTER_PI,TWO_PI);
  mov +=20;
    
  if(t1 == 0)
  {
    //FANTASMAS ROJO
    //cuerpo
    fill(250,0,0);
    rect(170+mov,230,103,60);
    //cabesa
    arc(222+mov,230,103,103,PI,TWO_PI);
    //colas
    arc(188+mov,290,35,45,0,PI);
    arc(222+mov,290,35,45,0,PI);
    arc(256+mov,290,35,45,0,PI);
    //ojos
    fill(250,250,250);
    ellipse(190+mov,230,30,30);
    ellipse(250+mov,230,30,30);
    fill(0,0,0);
    ellipse(182+mov,230,10,10);
    ellipse(242+mov,230,10,10);
        
    //FANTASMAS AZUL AGUA
    //cuerpo
    fill(0,250,250);
    rect(290+mov,230,103,60);
    //cabesa
    arc(342+mov,230,103,103,PI,TWO_PI);
    //colas
    arc(308+mov,290,35,45,0,PI);
    arc(342+mov,290,35,45,0,PI);
    arc(376+mov,290,35,45,0,PI);
    //ojos
    fill(250,250,250);
    ellipse(310+mov,230,30,30);
    ellipse(370+mov,230,30,30);
    fill(0,0,0);
    ellipse(302+mov,230,10,10);
    ellipse(362+mov,230,10,10); 
    mov +=2; 
    t1 = 1;
  }
  else
  {
    //FANTASMAS AZUL
     //cuerpo
    fill(0,0,250);
    rect(170+mov,230,103,60);
    //cabesa
    arc(222+mov,230,103,103,PI,TWO_PI);
    //colas
    arc(188+mov,290,35,45,0,PI);
    arc(222+mov,290,35,45,0,PI);
    arc(256+mov,290,35,45,0,PI);
    //ojos
    fill(250+mov,250,250);
    rect(180+mov,210,30,30);
    rect(230+mov,210,30,30);
    //boca
    rect(180+mov,270,10,10);
    rect(190+mov,260,15,10);
    rect(206+mov,270,15,10);
    rect(220+mov,260,15,10);
    rect(236+mov,270,15,10);
    rect(250+mov,260,10,10); 
    
    //cuerpo
    fill(0,0,250);
    rect(290+mov,230,103,60);
    //cabesa
    arc(342+mov,230,103,103,PI,TWO_PI);
    //colas
    arc(308+mov,290,35,45,0,PI);
    arc(342+mov,290,35,45,0,PI);
    arc(376+mov,290,35,45,0,PI);
    //ojos
    fill(250+mov,250,250);
    rect(300+mov,210,30,30);
    rect(350+mov,210,30,30);
    //boca
    rect(300+mov,270,10,10);
    rect(310+mov,260,15,10);
    rect(326+mov,270,15,10);
    rect(340+mov,260,15,10);
    rect(356+mov,270,15,10);
    rect(370+mov,260,10,10);
    mov +=2; 
    t1 = 0;
  }
}
