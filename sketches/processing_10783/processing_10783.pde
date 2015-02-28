
PFont font;
PImage img;
PImage botao;
PImage fundo;
PImage telainicial;
PImage telafinal;
PImage ganhou;
PImage perdeu;
PImage demo;
void setup () {
  size(652,574);
  smooth ();

background (0);
  img = loadImage ("nave.JPG");
  botao = loadImage ("button.GIF");
  fundo = loadImage ("imagem.jpg");
  telainicial = loadImage ("innerspace2.jpg");
  telafinal = loadImage ("final.jpg");
  ganhou = loadImage  ("ganhou.jpg");
  perdeu = loadImage ("morreu.jpg");
  demo = loadImage ("demo.jpg");

}
int x = 55;
int b = 0;
int gameMode = 0;
int rafa = 80; // vari�vel da �rea
color barra = color (0,250,0);
color vitoria = color (210,170,120);
int vidas = 3;
int r=0;
int s=0;
int p = 0;
void mouseReleased (){
 loop ();
}

       

void draw () {
 int gameMode = 0;
 if (gameMode == 0) {
   image (telainicial,45,-1);
    frameRate (1);
 }
 
  if ((mousePressed ==true) && (mouseX >= 0 && mouseX <= rafa) && (mouseY >= 0 && mouseY <= rafa)) {
    gameMode = 1;
    rafa = 700; // muda area
  }
  if (gameMode == 0) {
   image (botao, 0,0); 
 }
 


 println(gameMode);
  
if (gameMode ==1) {  
image (fundo, 50,5);
fill (0);
stroke (0);
rect (0,0,40,80);
stroke (barra);
strokeWeight (10);
line (50,8,605,8);
line (50,8+10*x,605,8+10*x);
line (605,8,605,500);
line (50,65,50,555);
line (328,340,328,233);
line (222,283,385,283);
line (274,283,274,335);
line (215,8,215,60);
line (215,64,111,64);
line (109,64,109,115);
line (50,228,158,228);
line (163,228,163,334);
line (163,338,215,338);
line (108,284,108,390);
line (108,392,160,392);
line (162,392,162,444);
line (216,392,216,444);
line (216,392,216+x,392);
line (216+2*x,392,216+2*x,444);
line (216+2*x,392+x,216+2*x,444+x);
line (216+x,446+x,216-x,446+x);
line (216-x,446+2*x,216-x,446+x);
line (216+x,446+x,216+x,446);
line (216+2*x,446+x,216+3*x,446+x);
line (216+3*x,392,216+3*x,444);
line (216+3*x,392,216+3*x,392-x);
line (216+3*x,392-x,216+5*x,392-x);
line (216+5*x,392-x,216+5*x,392-2*x);
line (216+4*x,392-2*x,216+4*x,392-3*x);
line (216+4*x,392-3*x,216+3*x,392-3*x);
line (217+2*x,394-3*x,217,394-3*x);
line (216+5*x,392-3*x,216+7*x,392-3*x);
line (216+4*x,392,216+4*x,444);
line (216+4*x,388-4*x,216+4*x,390-6*x);
line (216+6*x,392-4*x,216+6*x,392-6*x);
line (216+6*x,392-3*x,216+6*x,392-2*x);
line (216+6*x,392-x,216+6*x,392);
line (216+6*x,392+x,216+6*x,392+2*x);
line (216+6*x,392+x,216+7*x,392+x);
line (216+4*x,444,216+4*x,444+x);
line (216+5*x,392,216+5*x,444);
line (216+5*x,392-4*x,216+5*x,392-3*x);
line (216+5*x,444,216+5*x,444+2*x);
line (6*x,10+x,9*x,10+x);
line (7*x,10+2*x,10*x,10+2*x);
line (50,8*x+8,50+x,8*x+8);
line (50+7*x,8*x+8,50+8*x,8*x+8);
line (50+3*x,8+2*x,50+2*x,8+2*x);
line (50+4*x,8+2*x,50+5*x,8+2*x);
line (50+4*x,8+2*x,50+4*x,8+x);
line (52+4*x,8+3*x,52+4*x,8+4*x);
line (52+3*x,10+3*x,52+x,10+3*x);
line (52+5*x,10+3*x,52+6*x,10+3*x);
line (52+2*x,10+3*x,52+2*x,10+2*x);
line (52+5*x,10+3*x,52+5*x,10+2*x);
line (54+x,10+3*x,54+x,10+4*x);
line (54+8*x,8+7*x,54+9*x,8+7*x);
stroke (vitoria);
strokeWeight (3);
line (605,500,605,550);
fill (0); 
font = loadFont ("LucidaSans-TypewriterBold-30.vlw");
    textFont (font);
    textSize (30);

    text ("vidas", 450,50);
    fill (0);
    text (vidas,560,50);
 
  
PFont font;
font = loadFont("LucidaSans-TypewriterBold-30.vlw"); 
textFont(font); 
fill(0);
text("Combust�vel", 60, 550);
noFill();

  frameRate (20);
stroke (100,70,150);
  fill(100,70,150);
rect (40,500,105,20);
fill (vitoria);
rect (40,500,s/9,20);
println (s);


 

    
}
//nsnnd
cursor (img,28,28);

   PImage  img;
   //fgtj
  color cp = get (mouseX, mouseY);
   color dp = get (mouseX, mouseY-15);
    color ep = get (mouseX, mouseY-30);
    color fp = get (mouseX-15, mouseY-30);
    color gp = get (mouseX-30, mouseY-30);
     color hp = get (mouseX-30, mouseY-15);
     color ip = get (mouseX-30, mouseY);
  color jp = get (mouseX-15, mouseY);
  if (gameMode == 1){
    
  if ((cp== barra) || (dp== barra) ||(ep== barra) || (fp== barra)||(gp== barra)|| (hp== barra)||(ip== barra)||(jp== barra)) {
     noLoop (); 
    image (telafinal,42,-1);
    rafa = 80;
    
  vidas=vidas-1;
  }
  }
    
  
  else {
   gameMode = 1 ;
  }
  if (vidas == -1) {
    stroke (200);
    rect (0,0,700,700);
    image (perdeu,0,0);
    noLoop ();
  }
  if ((cp== vitoria) || (dp== vitoria) ||(ep== vitoria) || (fp== vitoria)||(gp== vitoria)|| (hp== vitoria)||(ip== vitoria)||(jp== vitoria)) {
     stroke (200);
    rect (0,0,700,700);
      r=r+1;
 
  }
  if (r==1) {
   image (ganhou,0,0);
     noLoop ();
  }
  if (gameMode==1) {
    s+=1;
  }
  if (s==840){
    p=p+1;
  }
if (p==1) {

    image (demo,0,0);
    
}
    }

