
/**
*
* Author: Jose Garcia-Uceda Calvo
* This code is OpenSource 
* You can find more code made by me in www.nerd-files.com ;D
*
* Utiliy: Experimentation and share knowledge
*
**/


Text texto = new Text();
puntero mipuntero = new puntero();
escala miescala = new escala();
target Target = new target();

int n=0;
int mousex,mousey;
int auxC=0;
int mx=300, my=200;
int jj=0;

void setup()
{
    // utilizamos size() solo en el PC
    //size(600,400,P2D);
    size(600,400);
    background(255);
    reset();
}

void draw()
{
    background(200);
   
    stroke(0);
    noFill();
    rect(0,0,599,399);  
   
    stroke(190);
    noFill();
    rect(150,100,300,200);
    
    int j=0;
    for(j=10;j<200;j=j+10)
    {
      line(150,100+j,450,100+j);
      
    }
    for(j=10;j<300;j=j+10)
    {
      line(150+j,100,150+j,300);
    }
    
    
    mousex=mouseX;
    mousey=mouseY;
    
    Target.objetivo();
   
    if((mousex>146)&(mousex<442)&(mousey>100)&(mousey<300))
    {
       stroke(50);
       mipuntero.encuadre(mousex,mousey,20,13,0);
       stroke(170);
       mipuntero.subencuadre(mousex,mousey,8,4);
       
       my=mousey;
       mx=mousex;
    }
    else
    {
       stroke(50);
       mipuntero.encuadre(mx,my,20,13,0);
       stroke(170);
       mipuntero.subencuadre(mx,my,8,4);
    
    }
    
    miescala.topEscala();
    miescala.leftEscala();  
    
    texto.statictext();
    texto.info_time(time(), date());
    texto.info_test();
    
    texto.info_objetivo();
        
    
    rect(172,74,252,12);
    int auxX=Target.i;
    int auxY=Target.n;
    int offset=22;
    if((auxX-offset<mousex)&(auxX+offset>mousex)&(auxY+offset>mousey)&(auxY-offset<mousey))
    {
        rect(225,60,145,12);
        texto.vartext("APPROACHING TARGET",228,71,200);
    }
    
    texto.vartext("RESEARCH AND DEVELOPMENT FACILITY",175,85,200);
    
      
}

void reset(){texto.textsetup();}



class Text 
{

        PFont font1, font2, font3, font4;
        int black = 0;              
        int white = 255;
        String milis;
      
        void textsetup() 
        {
              font1 = loadFont("arial.vlw");
              font2 = loadFont("Arial-italic.vlw");
              font3 = loadFont("courier.vlw");
              font4 = loadFont("courier-12.vlw");
        }
      
        void statictext() 
        {
              fill(black);
              textFont(font1);
          
              text("by Jose Garcia-Uceda Calvo", width-170, height-30);
              text("www.nerd-files.com", width-122,height-15);
        }
        
        void vartext(String texto, int x, int y) 
        {
              fill(100);
              textFont(font1);
       
              text(texto, x, y);
              
        }
        
        void vartext(String texto, int x, int y, int tono) 
        {
              fill(tono);
              textFont(font1);
       
              text(texto, x, y);
              
        }
      
        void info_time(String hora, String fecha) 
        {
              fill(black);
              textFont(font1);
              
              text(fecha+" "+hora, width-128, 25);
        }
        
        void info_test() 
        {
              fill(black);
              textFont(font1);
              
              milis=str(millis());
              text("Time in ms [ "+milis+" ]", width-(width-10), height-30);
        }
        
        void info_objetivo()
        {
              int grados=136,minutos=2, segundos=9;   
          
              fill(black);
              textFont(font1);          
              
              rect(width-128,height-311,60,12);
              fill(255);
              text(" CUR LOC",width-128, height-300);
              fill(black);
              //text("  N "+grados+"º  "+minutos+"' "+segundos+"''", width-128, height-285);
              //text("  E "+grados+"º  "+minutos+"' "+segundos+"''", width-128, height-270);
              text("   X   "+mousex, width-128, height-284);
              text("   Y   "+mousey, width-128, height-269);
              
              pushMatrix();
              translate(0, 50);
              rect(width-128,height-311,60,12);
              fill(255);        
              text(" TGT LOC",width-128, height-300);
              fill(black);
              //text("  N "+grados+"º  "+minutos+"' "+segundos+"''", width-128, height-285);
              //text("  E "+grados+"º  "+minutos+"' "+segundos+"''", width-128, height-270);
              text("   X   "+Target.i, width-128, height-284);
              text("   Y   "+Target.n, width-128, height-269);            
              
              popMatrix();
        }
}

// En esta clase tambien utilizo el Objeto Texto. 

class escala
{
     
  
     escala()
     {
          // constructor
     }
     
     void topEscala()
     {
            // horizontal 
            fill(0);
            stroke(0);
            line(200,50,400,50);
            
            int i;
            for(i=0;i<210;i=i+10)
            {
                if(i==0 | i==100 | i==200){line(200+i,50,200+i,40);}
                else
                {
                  line(200+i,50,200+i,45);
                }
            }
            
            int bb=5;
            int cc=mouseX;
            if(cc<200){cc=200;}
            if(cc>400){cc=400;}
            
            positionX(cc,bb);
            
            fill(0);
            stroke(0);
            triangle(cc-bb, 35, cc,40 , cc+bb,35 );
            
     }
   
     void leftEscala()
     {
            // vertical izquierda
            fill(0);
            stroke(0);
            line(125,100,125,300);
            
            int i;
            for(i=0;i<210;i=i+10)
            {
                if(i==0 | i==100 | i==200){line(115 ,100+i,125,100+i);}
                else
                {
                  line(120,100+i,125,100+i);
                }
            }
            
            int aa=5;
            int ee=mouseY;
            if(ee<100){ee=100;}
            if(ee>300){ee=300;}
            
            positionY(ee,aa);
            
            fill(0);
            stroke(0);
            triangle(110, ee+aa, 110, ee-aa, 115, ee);
        
     }
  
     void positionX(int cc,int bb)
     {
             texto.vartext(str(cc),cc-bb*2,32);
             texto.vartext("200",190,32);
             texto.vartext("400",390,32);
     }
  
     void positionY(int ee, int aa)
     {
             texto.vartext(str(ee),85,ee+aa);
             texto.vartext("100",85,105);
             texto.vartext("300",85,305);
     }   
     

}
class puntero 
{
     int x1,x2,y1,y2;
     int x3,x4,y3,y4;
  
     puntero(){}
     
     // parametros: "a" tiene que ser el doble de "b"
     void encuadre(int x,int y, int a, int b,int tono)
     {
           // esquina izquierda-norte
           x1=x-a;
           y1=y-a;
           x2=x-b;
           y2=y-a;               
           fill(tono);
           line(x1,y1,x2,y2);
           
           x3=x-a;
           y3=y-b;
           x4=x-a;
           y4=y-a;               
           fill(tono);
           line(x3,y3,x4,y4); 
           
           // esquina izquierda-sud
           x1=x-a;
           y1=y+a;
           x2=x-b;
           y2=y+a;               
           fill(tono);
           line(x1,y1,x2,y2);
           
           x3=x-a;
           y3=y+b;
           x4=x-a;
           y4=y+a;               
           fill(tono);
           line(x3,y3,x4,y4);
           
                 
           // esquina derecha-norte
           x1=x+a;
           y1=y-a;
           x2=x+b;
           y2=y-a;               
           fill(tono);
           line(x1,y1,x2,y2);
           
           x3=x+a;
           y3=y-b;
           x4=x+a;
           y4=y-a;               
           fill(tono);
           line(x3,y3,x4,y4);
           
           // esquina derecha-sud
           x1=x+a;
           y1=y+a;
           x2=x+b;
           y2=y+a;               
           fill(tono);
           line(x1,y1,x2,y2);
           
           x3=x+a;
           y3=y+b;
           x4=x+a;
           y4=y+a;               
           fill(tono);
           line(x3,y3,x4,y4);
     }

     
     void subencuadre(int x,int y, int a, int b)
     {
           // esquina izquierda-norte
           x1=x-a;
           y1=y-a;
           x2=x-b;
           y2=y-a;               
           fill(0);
           line(x1,y1,x2,y2);
           
           x3=x-a;
           y3=y-b;
           x4=x-a;
           y4=y-a;               
           fill(0);
           line(x3,y3,x4,y4); 
           
           // esquina izquierda-sud
           x1=x-a;
           y1=y+a;
           x2=x-b;
           y2=y+a;               
           fill(0);
           line(x1,y1,x2,y2);
           
           x3=x-a;
           y3=y+b;
           x4=x-a;
           y4=y+a;               
           fill(0);
           line(x3,y3,x4,y4);
           
                 
           // esquina derecha-norte
           x1=x+a;
           y1=y-a;
           x2=x+b;
           y2=y-a;               
           fill(0);
           line(x1,y1,x2,y2);
           
           x3=x+a;
           y3=y-b;
           x4=x+a;
           y4=y-a;               
           fill(0);
           line(x3,y3,x4,y4);
           
           // esquina derecha-sud
           x1=x+a;
           y1=y+a;
           x2=x+b;
           y2=y+a;               
           fill(0);
           line(x1,y1,x2,y2);
           
           x3=x+a;
           y3=y+b;
           x4=x+a;
           y4=y+a;               
           fill(0);
           line(x3,y3,x4,y4);
     }

}

class target
{
     int i,n;
     int izq,drc,top,bot;
     int flag_izq,flag_drc;
     int flag_bot,flag_top;

     target()
     {
          izq=150;
          drc=445;
          top=100;
          bot=296;
          flag_drc=1;
          flag_izq=0;
          flag_top=1;
          flag_bot=0;
          
          n=bot;
          i=izq;
     }
     
     void objetivo()
     {      
          movimiento();
       
          stroke(0);
          fill(0);
          rect(i,n,5,5);
          
     }
     
     void movimiento()
     {
          
          if(i>=drc){flag_izq=1;flag_drc=0;}
          if(i<=izq){flag_drc=1;flag_izq=0;}

          if(flag_izq==1){i--;}
          if(flag_drc==1){i++;}
          
          if(n>=bot){flag_top=1;flag_bot=0;}
          if(n<=top){flag_bot=1;flag_top=0;}
          
          if(flag_top==1){n--;}
          if(flag_bot==1){n++;}
          
     }
      
}

String time()
{
    String h=str(hour()),m=str(minute()),s=str(second());
    
    h=(h.length()==1)?"0"+h:h;
    m=(m.length()==1)?"0"+m:m;
    s=(s.length()==1)?"0"+s:s;
    
   
    return h+":"+m+":"+s;
}

String date()
{
    String d=str(day()),m=str(month());
  
    d=(d.length()==1)?"0"+d:d;
    m=(m.length()==1)?"0"+m:m;

    return d+"-"+m+"-"+str(year());
}




