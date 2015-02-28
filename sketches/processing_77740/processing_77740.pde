
PFont fuente;
String[] fontList =PFont.list();
PImage conejo;
PImage zanahoria,explot;
PImage fondo;
PImage foot;
int[] coordenadasXinvasor={int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
float[] coordenadasYinvasor={10,10,10,10,10};
int diametroInvasor=10;
int score,nivel;
float speed;
void setup()
{
  size(600,700);
  conejo=loadImage("conejo.png");
  zanahoria=loadImage("zanahoria2.png");
  explot=loadImage("zanahoria.png");
  fondo=loadImage("fondo3.png");
  foot=loadImage("foot.jpg");
  score=0;
  speed=0.5;
  nivel=1;
  //frameRate(4);
}


void draw()
{
  fuente= createFont("SansSerif.bold",30);
  textFont(fuente);
  background(255);
  image(fondo,0,0);
  arma();
  invasores();

  fill(255);
  text("SCORE: "+score,380,640);
  text("NIVEL "+nivel,20,640);
    finJuego();
}

void mousePressed()
{
 proyectil(mouseX); 
}

void arma()
{
  
  fill(0,255,0);
  stroke(color(0,255,0));
  //triangle(mouseX-8,580,mouseX,565,mouseX+8,580);
  image(conejo,mouseX-14,487);
  image(foot,0,600);
}

void invasores()
{
  
  stroke(0);
  fill(0);
  for(int i=0;i<5;i++)
  {
    //ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);
    image(zanahoria,coordenadasXinvasor[i]-30,coordenadasYinvasor[i]+=speed);
  }   
}

void proyectil(int disparoX)
{
    boolean acertar=false;
    for(int i=0;i<5;i++)
      if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2))&&(disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2)))
      {
        acertar=true;
        line(mouseX,565,mouseX,coordenadasYinvasor[i]);
        //ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor+25,diametroInvasor+25);
        image(explot,coordenadasXinvasor[i]-39,coordenadasYinvasor[i]++);
        coordenadasXinvasor[i]=int(random(600));
        coordenadasYinvasor[i]=0;
        if(score!=0)
        if((score%20)==0)
        {
          speed+=0.25;
          nivel++;
        }  
        score++;
    }
    line(mouseX,565,mouseX,0);
}


void finJuego()
{  
  for(int i=0;i<5;i++)
    if(coordenadasYinvasor[i]==540)
    {
      noLoop();
      fuente= createFont("SansSerif.bold",30);
      textFont(fuente);
      fill(100);
      text("¡¡GAME OVER!!",200,300);
    }
    
    
}






