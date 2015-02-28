
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
FFT fft;

boolean indici[]; //segna i rettangoli attivi che si muovono
int v[]; //spostamenti dei vari rettangoli in movimento
int i;
int dim_quad=20;//dimensione quadrati sotto
int r[];//vettori per i colori dei rettangoli
int g[];
int b[];
int velocita=10; //velocità iniziale dei rettangoli
int VELOCITA_MAX=15, VELOCITA_MIN=1; //velocita MAX e MIN dei rettangoli
float taglio=2.0; //ampiezza che la banda deve raggiungere per generare un rettangolo

void setup(){
  size(450, 200, P3D);
  textMode(SCREEN);
  minim = new Minim(this);
  song = minim.loadFile("Tetris.mp3", 1024);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(16);
  indici=new boolean[fft.avgSize()];
  v=new int[fft.avgSize()];
  r= new int [indici.length];//inizializzazione vettori
  g= new int [indici.length];
  b= new int [indici.length];
  for (int x=0;x<indici.length;x++){
     r[x]=(int)random(0,255); 
     g[x]=(int)random(0,255); 
     b[x]=(int)random(0,255); 
  }
  for(int k=0;k<indici.length;k++)
     indici[k]=false;
  for(int k=0;k<v.length;k++)
     v[k]=0;
}

void draw(){
  background(0);
  stroke(255);
  disegnaFondo();
  disegnaComandi();
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);
  for (i = 0; i < fft.avgSize(); i++){
      if(fft.getAvg(i)>=taglio){
        addRettangolo(i);
      }
  }
  disegnaRettangoli();
  fill(255); 
}

void disegnaRettangoli(){
   for (int i = 0; i < indici.length; i++){
    if(indici[i]==true){ //se il rettangolo su quella banda e attivo lo disegno
      if(height-v[i]+40<=0){
        v[i]=0;
        indici[i]=false;
      }else{
       v[i]=v[i]+velocita;
       noStroke();
       fill(r[i],g[i],b[i],200);
       rect(10+i*20,height-v[i],20,40);
      }
    } 
   }
}

void addRettangolo(int val){
  indici[val]=true;
}

void stop()
{
  song.close();
  minim.stop();

  super.stop();
}

void disegnaFondo(){//disegna quadrati sul fondo 
   for (int x=0;x<indici.length;x++){
    pushMatrix();
    translate(x*dim_quad, height-20);
    if (indici[x]==false){      
       fill(0);
    }
    if (indici[x]){     
       fill(r[x],g[x],b[x]);
    }
    rect(10,0,dim_quad,dim_quad);
    popMatrix();
  }
}

void disegnaComandi(){
  fill(255);
  text("Velocità \nRettangoli",width-dim_quad*4,dim_quad*2);
  fill(255);
  stroke(255);
  rect(width-dim_quad*3,dim_quad*3,dim_quad,dim_quad);//quadrato bianco
  fill(0);
  text("+", width-dim_quad*3+dim_quad/2-4, dim_quad*3+dim_quad/2+5); // scrivo il simbolo +
  fill(0);
  stroke(255);
  rect(width-dim_quad*3,dim_quad*4,dim_quad,dim_quad);//quadrato nero
  fill(255);
  text("-", width-dim_quad*3+dim_quad/2-3, dim_quad*4+dim_quad/2+5); // scrivo il simbolo -
  text("Velocità \ncorrente:", width-dim_quad*4,dim_quad*7);
  text(velocita,width-dim_quad*3-dim_quad/2,dim_quad*9);
}
void mousePressed(){
  if (mouseX>width-dim_quad*3&&mouseX<width-dim_quad*2&&mouseY>dim_quad*3&&mouseY<dim_quad*4){//sul quadrato bianco
      if(velocita<VELOCITA_MAX)
       velocita=velocita+1;
  }
  if (mouseX>width-dim_quad*3&&mouseX<width-dim_quad*2&&mouseY>dim_quad*4&&mouseY<dim_quad*5){//sul quadrato nero
     if(velocita>VELOCITA_MIN)
       velocita=velocita-1;
  }
}

