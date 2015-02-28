
int numPessoas = 100;
Pessoas[] pessoa = new Pessoas[numPessoas];
PFont t = createFont("Georgia Bold", 14);
int validados=0;
int coletados = 0;
void setup()
{
  size(600,600);
  for (int i =0; i<numPessoas;i++)
  {
    pessoa[i] = new Pessoas(random(width), random(height));
  }
  
  
}
void draw()
{
  background(20);
  for (int i =0; i<numPessoas;i++)
  {
    
    pessoa[i].Update();
    if (pessoa[i].coleta.coletou)
    {
      for (int p=0;p<numPessoas;p++)
      {
       if (p==i)
       break;
       
       if (pessoa[p].coleta.coletou)
       {
         if (dist(pessoa[p].coleta.xpos,pessoa[p].coleta.ypos,
         pessoa[i].coleta.xpos,pessoa[i].coleta.ypos)<pessoa[i].coleta.rR)
         {
          // validados++
          if (!pessoa[i].coleta.validado)
            pessoa[i].Validar();

          if (!pessoa[p].coleta.validado)            
          pessoa[p].Validar();
         }
      
       
       }
      }
    }
    pessoa[i].SeMove();
    pessoa[i].show();
    
    println("C = "+coletados);
    println("V = "+validados);
  }
  textFont(t);
  fill(78,147,39);
  text("Validados: "+validados,width-130,height-20);
  fill(214,190,54);
  text("Coletados: "+coletados,width-130,height-50);
}
    


class Coleta
{
 float xpos, ypos, r, rR, tam;
 float xtext, ytext;
 PFont f= createFont("Georgia Bold", 14);
 
 String texto="";
 boolean coletou = false, validado = false, valup=false, cresce=true;
 Coleta(float x, float y, float tamanho)
 {
   xpos = x;
   ypos = y;
   tam=tamanho;
   r = tam+(tam/3);
   rR = r+90;
 }
 void preSet(float x, float y)
 {
   coletou = true;
   xpos = x;
   ypos = y;
   r = tam+(tam/3);
   rR = r+90;
   xtext=xpos;
   ytext=ypos;
   
 }
 void updateColeta()
 {
   if (r<=tam)
   cresce=true;
   
   if (r>=2*tam)
   cresce=false;
   
   if (cresce)
   {
   r+=0.25;
   }else
   {
   r-=0.25;
   }
 }
 void updateRange()
 {
   if (rR<=tam)
   {
   this.die();
   }else
   {
     rR-=0.6;
   }
 }
 void updateText()
 {
  if ((ypos-ytext)<=20)
  {
    ytext-=0.4;
  }
  
 }
 void die()
 {
   rR=0;
   r=0;
   coletou = false;
   validado = false;
   texto = "";
   
 }
 void showColeta()
 {
   if (validado)
   {
     fill(78,147,39);
     texto = "Validado";
   }else
   {
     fill(214,190,54);
     texto = "Coletado";
   }
   ellipse(xpos,ypos,r,r);
   this.showText();
   this.showRange();
 }
 void showRange()
 {
   noFill();
   stroke(80);
   ellipse(xpos,ypos,rR,rR);
 }
 void showText()
 {
   textFont(f);
   text(texto,xtext,ytext);
   
 }
}
class Pessoas
{
  float xpos, ypos,xspd=0.8, yspd=0.2;
  int r=15, xdir=1, ydir=1;
  Coleta coleta = new Coleta(xpos,ypos,r);
  Pessoas(float x, float y)
  {
    xpos = x;
    ypos=y;
    
    
  }
  void SeMove()
  {
    xpos+=xspd * xdir;
    ypos+=yspd * ydir;
  }
  void Coletar()
  {
    coletados++;
    this.coleta.preSet(xpos,ypos);
  }
  void Validar()
  {

   this.coleta.validado=true;

     validados++;

  }
  void Update()
  {
   if (xpos > width-r || xpos < r)
   {
    xdir *= -1;
    xspd = random(0,1.2);
   }
   if (ypos > height-r || ypos < r) 
   {
    ydir *= -1;
    yspd = random(0,1);
   }
   if (int(random(1,10000))==8)
     {
       this.Coletar();
       
     }
  }
  void show()
   {
    if (this.coleta.coletou)
     {
      this.coleta.updateColeta();
      this.coleta.updateText();
      this.coleta.updateRange();
      this.coleta.showColeta();
      this.coleta.showText();
      this.coleta.showRange();
     }
    fill(100);
    noStroke();
    ellipse(xpos,ypos, r,r); 
   
   }
}




