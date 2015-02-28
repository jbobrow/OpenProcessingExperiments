
int num;
Module[] mods;
Ball  ball_1;
Ball  ball_2;
Ball  ball_3;
Ball  ball_4;

void setup() //----------------------die spiegel 0-7 werden ins leben gerufen und die vier bälle
{
  size(800, 800);
  background(180,80,40);
  strokeWeight (4.0);
  ball_1 = new Ball(300,200,4,0,240,20,0);
  ball_2 = new Ball(10,600,-4,0,40,220,0);
  ball_3= new Ball(500,790,0,-4,0,180,120);
  ball_4 = new Ball(700,600,4,0,190,0,120);
  num = 8 ;
  mods = new Module[num];
  for (int i = 0; i < 8; i=i+2) {
    for (int j=0; j<2;j=j+1){
      int index = i+j;
      int t_x=100+100*i;
      int t_y=200+j*400;
      int t_flip=int(pow(-1,int(random(0,4))));
      mods[index] = new Module(t_x, t_y,t_flip); 
    }
  }
}

void draw(){ //----------------------------die methode mods[].display wird für alle Spiegel aufgerufen
  background(90,40,20);
  fill(0);
  stroke(0);
  rect(0,190,800,20);//-----------zeichnet die "straßen"
  rect(0,590,800,20);
  rect(90,0,20,800);
  rect(290,0,20,800);
  rect(490,0,20,800);
  rect(690,0,20,800);

  for (int i = 0; i < num; i++) {
    mods[i].check();
    mods[i].display();
  }
  ball_1.move();
  ball_1.display();
  ball_2.move();
  ball_2.display();
  ball_3.move();
  ball_3.display();
  ball_4.move();
  ball_4.display();
}

class Module {//------------------------die Spiegelklasse wird definiert
  int mx, my,flip;
  Module(int imx, int imy, int iflip) {

    mx = imx;
    my = imy;
    flip=iflip;

  }//---------------eigenschaften zu ende
  void check(){//-------------------fragt ab, ob spiegel gedreht werden soll

    if(dist(mouseX,mouseY,mx,my)<15){
      flip=(-1)*flip;
      delay(300); //umschalten bei vorbeifahren der maus


    }
  }//------------check zu Ende
  void display(){//-----------------die display-methode
    stroke (60+flip*60,120-flip*20,220);//farbe anders nach umklappen
    if(flip==1){
      line(mx-15,my-15,mx+15,my+15);
    }
    else
    {
      line (mx-15,my+15,mx+15,my-15);  
    }

  }//-------------module.display zu Ende


}//-------module zu Ende


class Ball{
  float ballx, bally,speedx,speedy,speedx_alt;
  int c1, c2, c3;

  Ball(float t_ballx, float t_bally, float t_speedx, float t_speedy, int t_c1, int t_c2, int t_c3){
    ballx=t_ballx;
    bally=t_bally;
    speedx= t_speedx;
    speedy=t_speedy;
    c1= t_c1;
    c2=t_c2;
    c3= t_c3;
  }

  void move(){
    ballx=ballx+speedx;
    bally=bally+speedy;
    if(ballx>800){
      ballx=0;
    }
    if (bally>800){
      bally=0;
    }
    if (ballx<0){
      ballx=800;
    }
    if (bally<0){
      bally=800;
    }

    for (int i=0;i<8;i++){//-------berührt die kugel einen der spiegel?

      if (dist(mods[i].mx,mods[i].my,ballx,bally)<5){
        speedx_alt=speedx;     
        speedx=speedy*mods[i].flip;
        speedy=speedx_alt*mods[i].flip;//die erste speedangabe muss zwischengespeichert werden, da sie hier schon verändert erscheint
        ballx=speedx+10*round(ballx/10);  
        bally=speedy+10*round(bally/10);//die kugel wird wieder auf "glatte" position gebracht, damit sie straßenmitte nicht verlässt
      }
    }
  }//-----------------------------ball.move zu ende
  void display(){
    stroke(c1,c2,c3);
    fill(c1,c2,c3);
    ellipse(ballx,bally,15,15);
  }
}//----------------------ball.display zu ende






