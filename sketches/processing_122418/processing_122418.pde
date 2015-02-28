
int num_bolas;
int fps=24;

Ovni[] bola;

void setup()
{
  size(600,600);
  frameRate(fps);
  noStroke();
  
  float min_escala=height/100*0.5;
  num_bolas=round(width/100*2);
  bola=new Ovni[num_bolas];
  
  for (int i=0;i<num_bolas;i++){bola[i]= new Ovni(random(3,num_bolas/2),fps);}

//  println(min_escala, num_bolas, num_bolas/2);
}

void draw()
{
  background(230);
  for (int i=0;i< num_bolas;i++)
  {
    bola[i].update();
    bola[i].render();
  }
}

void mouseMoved()
{
  for (int i=0; i<num_bolas;i++)
  {bola[i].fuga();}
}


/*
CLASS Ovni
*/
class Ovni
{
  float posx,posy, desvioX, desvioY;
  float targetX, targetY;
  float vel, ang, v_arma;
  boolean foge;
  float e;
  
  Ovni(float escala, float velocidade)
  {
    posx=width/2;
    posy=height/2;

    targetX=random(0,width);
    targetY=random(0,height);
    desvioX=posx+(targetX-posx)/2;
    desvioY=posy+(targetY-posy)/2;
    vel=velocidade;
    foge=false;
    e=escala;
    ang=random(-1.5, 1.5);
    
    do
    {
      v_arma=random(-0.2, 0.2);
    }while(v_arma==0);
  }
  
  void update()
  {
    posx+=(desvioX-posx)/vel;
    posy+=(desvioY-posy)/vel;
    
    if (foge==false)
    {
      desvioX+=(targetX-desvioX)/vel;
      desvioY+=(targetY-desvioY)/vel;
    }else
      {
        desvioX+=-(targetX-desvioX)/vel*1.5;
        desvioY+=-(targetY-desvioY)/vel*1.5;
        if(desvioX<0 || desvioX>width || desvioY<0 || desvioY>height)
        {
          foge=false;
          targetX=random(0,width);
          targetY=random(0,height);
        }
      }
    
    if (posx>targetX-2*e && posx<targetX+2*e)
    {
      if (posy>targetY-2*e && posy<targetY+2*e)
      {
        targetX=random(0,width);
        targetY=random(0,height);
      }
    }
    
    ang+=v_arma;
    if (ang<-1.5 || ang>1.5) v_arma+=-2*v_arma;
  }
  
  void fuga()
  {
    if (posx>mouseX-10*e && posx<mouseX+10*e)
    {
      if (posy>mouseY-10*e && posy<mouseY+10*e) foge=true;
    }
  }
  
  void render()
  {
    pushMatrix();
      float posx2=3*e/2*sin(ang); //posx= centro + raio* sin(angulo)
      float posy2=1.4*e+1.5*e/2*cos(ang);  //posy= centro + raio* cos(angulo)

      translate(posx,posy);
      smooth();
      strokeWeight(1);fill(200,0,0);
      arc(0,1.4*e,3*e,1.5*e, TWO_PI, PI+TWO_PI);  //fundo

      fill(100);
      ellipse(posx2,posy2, 0.7*e, 0.3*e); //movimento ao fundo da arma
      ellipse(posx2+0.7*e/2*sin(ang), posy2+0.3*e/2*cos(ang), 0.5*e, 0.2*e);
      ellipse(posx2+1.2*e/2*sin(ang), posy2+0.5*e/2*cos(ang), 0.3*e, 0.2*e);
      fill(100,0,0,150);noStroke();
      ellipse(posx2+5*e/2*sin(ang), posy2+5*e/2*cos(ang), e, e);

      strokeWeight(1);
      fill(0,0,0,150);
      bezier(-1.5*e,1.4*e, -1.5*e,2*e, 1.5*e,2*e, 1.5*e,1.4*e); //sombra

      fill(150);stroke(0);
      bezier(-5*e,0, -3*e,-2*e, 3*e,-2*e, 5*e,0); //cima disco
      fill(100);
      bezier(-5*e,0, -3*e,2*e, 3*e,2*e, 5*e,0);  //baixo disco
      fill(150);
      bezier(-5*e,0, -3*e,1.5*e, 3*e,1.5*e, 5*e,0);  //baixo disco

      fill(170);
      arc(0,0,6*e,4*e, PI, TWO_PI);  //desenha a cúpula
      bezier(-3*e,0, -1.5*e,0.7*e, 1.5*e,0.7*e, 3*e,0);
  
      fill(255);noStroke();  //efeitos de reflexão de luz
      ellipse(e,-e, 1.5*e,e/2);  //cupula
      fill(200);
      bezier(0,0.8*e,  4*e,e,  4.5*e,-0.2*e,      4*e,0);
    popMatrix();
  }
}
