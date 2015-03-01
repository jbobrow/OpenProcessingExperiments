
int activator=0;
int varia=0;//
boolean breathin=true;

void setup(){
  size(300,300);
}
//comments are back woohoo
void draw(){
  activator=activator+1;
  if(activator==10)
  {
    activator=0;
    if(varia==10)
      breathin=false;
    if(varia==0)
      breathin=true;
    if(breathin)
    {
      varia=varia+1;
    }
    else varia=varia-1;
  }
  fill(255,255,255);
  rect(0,0,300,300); //1first two correspond to top left corner int varia=like a billion
  line(71+varia, 0, 71+varia, 60);//19
  line(10+varia, 0, 10+varia, 300);//2
  line(40, 0, 40, 300);//3
  line(200, 0, 200, 300);//4
  line(270, 0, 270, 300);//5
  line(283, 0, 283, 300);//6
  line(0, 81+varia, 40, 81+varia);//18
  line(0, 40, 300, 40);//7
  line(0, 60, 300, 60);//8
  line(0, 240+varia, 300, 240+varia);//9
  line(0, 280-varia, 300, 280-varia);//10
  line(283, 0, 283, 300);//11
  line(140-varia, 0, 300, 160+varia);//12
  line(0,60, 100, 0);//12
  fill(#FF6600); 
  triangle(200-varia, 60, 270, 60, 270, 130+varia);//13
  rect(10+varia,81+varia,30-varia,159);//17
  fill(#00FF66); 
  arc(41, 61, 60+(2*varia), 40+(2*varia), 0, PI/2);//15
  ellipse(235, 260, 70, 40-(2*varia));//14
  fill(#6600FF);
  quad(100, 0, 140-varia, 0, 180-varia, 40, 140, 40);//16
  rect(40,280-varia,160,20+varia);//17
  
  
}


