


Arco[] primer = new Arco[39];
Arco[] segon = new Arco[39];
Arco[] tercer = new Arco[39];
int tama = 0;
int xx = 400;
int yy = 400;
int x = 10;
int y = 10;

void setup(){
size(800,800);
 frameRate(1);
  for (int i =0; i<primer.length; i++){
    primer[i] = new Arco(200,200,xx,yy,0,4,0);
    segon[i] = new Arco(600,200,x,y,0,4,0);
    
    xx = xx-10;
    yy = yy-10;
    x = x +10;
    y = y +10;
    
  }  
  for (int i =0; i<primer.length; i++){
  tercer[i] = new Arco(400,400,xx+500,yy+500,0,4,0);
  xx = xx-15;
    yy = yy-15;
 }
}



void draw(){
  frameRate(15);
  background(255);
  for (int i = 0; i<primer.length && i<tama; i++){
    primer[i].dibuixa();
    primer[i].moure();
    segon[i].dibuixa();
    segon[i].moure2();
    tercer[i].dibuixa2();
    tercer[i].moure2();
    
    
  }
  
  
  if (tama >= 39){
    fill(255);
  ellipse(500,285,60,80);
  ellipse(300,285,60,80);
  fill(0);
  ellipse(400,400,60,40);
  ellipse(500,300,50,50);
  ellipse(300,300,50,50);
  noFill();
  arc(400,420,300,300,0.5,2.5);
  arc(400,421,300,300,0.5,2.5);
  arc(400,422,300,300,0.5,2.5);
  arc(400,423,300,300,0.5,2.5);
  }
}
  void mousePressed(){
   
     tama = tama +1;
  
    
   println(mouseX+","+mouseY);
  }
class Arco{
  float xPos;
  float yPos;
  float xxPos;
  float yyPos;
  float in;
  float fi;
  color c;
  
  Arco(){
    xPos = width/2;
    yPos = height/2;
    xxPos = width/2;
    yyPos = height/2;
    in = 0;
    fi = 4;
    c = color(255,0,255);
  }
  
  Arco(float x, float y, float xx, float yy, float ini, float fin, color col){
    xPos = x;
    yPos = y;
    xxPos = xx;
    yyPos = yy;
    in = ini;
    fi = fin;
    c = col;
  }
  
  void dibuixa(){
    stroke(c);
    noFill();
    arc(xPos, yPos, xxPos, yyPos, in, fi);
    

  }
  void dibuixa2(){
    stroke(100);
    
    arc(xPos, yPos, xxPos, yyPos, in, fi);
  }
  
  void moure(){
    
   in = (in + 1);
   fi = (fi + 1); 
  }
  void moure2(){
    in = in - 1;
    fi = fi - 1;
}
}



