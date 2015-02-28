
/*Informàtica GEDI 2013-14
 Seminari 1_Elsa Casanova Sampé*/

float r; //colors RGB
float g;
float b;
float diam; //diàmetre

float midax = 300;
float miday = 300; 
float xmov;
float ymov;

float x, y;
int vx = 2;
int vy= 2; //posicions i velocitat (x i y)

//////VARIABLES RANDOM WALKER
int fr = 25; //número de walkers 
int A = 20;
int B = 20;
int C = 20;
int D = 20;
//////MATRIUS RANDOM WALKER
float[] fx = new float[fr];
float[] fy = new float[fr];
float[] fvx = new float[fr];
float[] fvy = new float[fr];
 
 
void setup() { //fix
  size(600, 600);
  background(255);
  cursor(CROSS);
  
  for (int i = 0; i<fr; i++) {
    fx[i] = width/2;
    fy[i] = height/2;

    fvx[i] = random(-A,B);
    fvy[i] = random (-C,D);
  }
  }
 
void draw(){
background(255);
  //dibuixGespa();
  dibuixFlors();
  dibuixAbelles();
 
  
  /////SI APRETEM EL MOUSE... 
  if (mousePressed) {
    background(1); //fons negre
    
    //confeti 
    r = random(255); //variables random color esferes
    g = random(255);
    b = random(255);
    diam = 20;
    xmov = random(width);
    ymov = random(height);
    noStroke();
    fill(r,g,b);
    ellipse(xmov,ymov,diam,diam);
    }
   /////
   
  dibuixReno();
 }
  

 

void dibuixAbelles(){
//////LOOP
  translate(mouseX-300, mouseY-375);
   for (int i = 0; i<fr; i++) { 
    fx[i] += fvx[i];
    fy[i] += fvy[i];
    
  if(((fx[i]+50) >= width) || ((fx[i]-50) <=0)) {
    fvx[i] = -fvx[i];  }
  else{
     fvx[i]= random(-A,B);    }
  if(((fy[i]+50) > height) || ((fy[i]-100) < 0)) {
    fvy[i] = -fvy[i];   }
  else{
     fvy[i]= random(-C,D);    }
    
/////ABELLES
  stroke(50);
  line(fx[i]+20,fy[i]+40,fx[i]+20,fy[i]+45);
  noStroke();
  fill(255,246,62);
  triangle(fx[i]+10,fy[i]+25,fx[i]+20,fy[i]+10,fx[i]+30,fy[i]+25);
  triangle(fx[i]+10,fy[i]+25,fx[i]+20,fy[i]+40,fx[i]+30,fy[i]+25);
  fill(150);
  quad(fx[i]+10,fy[i]+25,fx[i]+20,fy[i]+10,fx[i]+5,fy[i]+15,fx[i]+1,fy[i]+30);
  quad(fx[i]+30,fy[i]+25,fx[i]+20,fy[i]+10,fx[i]+35,fy[i]+14,fx[i]+41,fy[i]+30);
  stroke(1);
  line(fx[i]+11,fy[i]+25,fx[i]+28,fy[i]+25); }}

/////FLORS ❃
  void dibuixFlors(){
  //actualitzar posicions
  x = x+vx;
  y = y+vy;
  //limits?
  if (x > width ||x < 0) {
    vx=-vx;  }
  if (y > height||y < 0) {
    vy=-vy;  }
  int d = 15;
  strokeWeight(10);
  stroke(#65C19F);
  strokeCap(ROUND);
  line(x,y,x+d,y+d);
  line(x,y,x-d,y-d);
  line(x,y,x+d,y-d);
  line(x,y,x-d,y+d);
  line(x,y,x+d+5,y);
  line(x,y,x,y+d+5);
  line(x,y,x-d-5,y);
  line(x,y,x,y-d-5);
  strokeWeight(1);
  fill(255,255,0); 
  noStroke(); 
  ellipse(x,y,d-5,d-5);
  }
  

/*void dibuixGespa() {
  //gespa
  stroke(102, 160, 74);
  strokeWeight(1);
  for (int i = 1; i < 600; i = i+4) {
    line(i, 10, i, 600);  }
   }*/
   
void dibuixReno() {
  noStroke();
  //coll
  fill(131, 96, 40);
  quad(200, 550, 400, 550, 350, 300, 250, 300);
  //cap
  fill(149, 114, 57);
  quad(270, 450, 330, 450, 375, 300, 225, 300);
  triangle(270, 450, 330, 450, 300, 460);
  //superior cap
  fill(103, 78, 37);
  quad(225, 300, 210, 250, 300, 225, 300, 325);
  quad(375, 300, 390, 250, 300, 225, 300, 325);
  //nas
  fill(72, 61, 34);
  quad(300, 420, 300, 400, 280, 400, 290, 420);
  quad(300, 420, 300, 400, 320, 400, 310, 420);
  fill(149, 114, 57);
  triangle(310, 390, 270, 410, 270, 400);
  fill(149, 114, 57);
  triangle(290, 390, 330, 410, 330, 400);
  fill(33);
  ellipse(293, 407, 4, 4);
  translate(15, 0);
  ellipse(292, 407, 4, 4);
  translate(-15, 0);

  //banyes esquerra
  stroke(250, 230, 76);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(210, 246, 160, 221);
  strokeCap(SQUARE);
  line(162, 223, 140, 100);
  noStroke();
  fill(250, 230, 76);
  triangle(136, 101, 200, 70, 140, 115);
  stroke(250, 230, 76);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(162, 223, 180, 150);
  noStroke();
  triangle(176, 151, 250, 130, 180, 162);

  //banyes dreta
  stroke(250, 230, 76);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(390, 246, 440, 221);
  strokeCap(SQUARE);
  line(438, 219, 460, 100);
  noStroke();
  fill(250, 230, 76);
  triangle(464, 101, 400, 70, 460, 115);
  stroke(250, 230, 76);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(438, 223, 420, 150);
  noStroke();
  triangle(424, 151, 350, 130, 420, 162);

  //boles banyes
  int div=15;
  fill(234, 24, 41, 100);
  ellipse(350, 130, mouseX/div, mouseX/div);
  ellipse(250, 130, mouseX/div, mouseX/div);
  ellipse(400, 70, mouseX/div, mouseX/div);
  ellipse(200, 70, mouseX/div, mouseX/div);
  fill(234, 24, 41);
  ellipse(350, 130, 15, 15);
  ellipse(250, 130, 15, 15);
  ellipse(400, 70, 15, 15);
  ellipse(200, 70, 15, 15);

  //orella esquerra inferior
  fill(222, 128, 110);
  triangle(211, 250, 130, 275, 100, 230);
  //orella esquerra superior
  fill(193, 114, 98);
  triangle(210, 250, 160, 225, 100, 230);
  //orella dreta inferior
  fill(222, 128, 110);
  triangle(389, 250, 470, 275, 500, 230);
  //orella dreta superior
  fill(193, 114, 98);
  triangle(390, 250, 440, 225, 500, 230);

  //ulls
  fill(255);
  ellipse(260, 340, 15, 15);
  ellipse(340, 340, 15, 15);
  fill(25);
  ellipse(260, 341, 8, 8);
  ellipse(340, 341, 8, 8);
  //pestanyes
  noFill();
  stroke(30);
  strokeWeight(2);
  arc(259, 330, 20, 10, PI, TWO_PI);
  arc(341, 330, 20, 10, PI, TWO_PI);

  //text
  println("||the brown nosed reindeer||");

}


