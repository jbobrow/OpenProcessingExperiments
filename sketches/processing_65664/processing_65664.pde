
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
AudioMetaData meta;
FFT fft;
PFont f; 
int r=204,g=102,b=0;//gradienti per definire la variabile colore
color colore;
int s,m; //secondi e minuti per calcolare un dirty timer
boolean HSBattivo; //controllo la modalità di colorazione e visualizzazione

//Istanzio i controlli -/+ per modifcare i valori RGB di colore mediante click
PlusButton Rplus = new PlusButton (720,135); MinusButton Rminus = new MinusButton (668,135);
PlusButton Gplus = new PlusButton (720,155); MinusButton Gminus = new MinusButton (668,155);
PlusButton Bplus = new PlusButton (720,175); MinusButton Bminus = new MinusButton (668,175);

  void setup(){
    size(800,400,P2D);
    f=loadFont("CooperBlack.vlw");
    minim = new Minim(this);
    song = minim.loadFile("Avril Lavigne - What The Hell [2010-Single][MJN].mp3", 1024);
    meta = song.getMetaData();
    song.loop();  
    fft = new FFT(song.bufferSize(), song.sampleRate());
    fft.logAverages(54,3); 
  }

  void draw(){
    //Gradienti RGB
    r = modifica_grad(r, Rplus, Rminus);
    g = modifica_grad(g, Gplus, Gminus);
    b = modifica_grad(b, Bplus, Bminus);
    colore = color(r,g,b);
    //Font
    textFont(f,16);
    textAlign(LEFT);
    s = (song.position()/1000)%60; //conversione in secondi
    m = (song.position()/60000)%60; // conversione in minuti
    if(!HSBattivo){   //visualizzazione in RGB
      colorMode(RGB);
      background(0); 
      fill(colore);  text("Modifica il colore\ncliccando su - / +",600,100);
      fill(255,0,0); text("Red:",600,140); text(r,680,140);
      fill(0,255,0); text("Green:",600,160); text(g,680,160);
      fill(0,0,255); text("Blue:",600,180); text(b,680,180);
      
      //Pulsanti +/-  --> iterazione utente tramite mouse (PRIMO TIPO DI INTERAZIONE UTENTE/ANIMAZIONE)
      Rplus.display(); Rminus.display();
      Gplus.display(); Gminus.display();
      Bplus.display(); Bminus.display();
      
    }else{
      colorMode(HSB,200); //visualizzazione in HSB
      background(0,0,0); 
    }
    
    if (HSBattivo){ fill(0,0,255); 
    }else{ fill(colore);}
    text(meta.title(),600,30); 
    text(": "+s,620,50); text(m,602,50);
    text("Attiva HSB\ncliccando 'H'",600,230);
        
    //Gestisco il cambio di colore di ON/OFF 
    if (HSBattivo){ fill(0,0,255);
    }else{ fill(30,30,30); } 
    text("ON ",610,280); 
    if (HSBattivo){fill(50,50,20);}else{fill(255,255,255);} 
    text("OFF",650,280);
   
    //Animazione
    disegna_Anim(colore,HSBattivo);
  }
  
  void stop(){
    song.close();
    minim.stop();
    super.stop();
  }
  
  //Procedura di controllo livello gradiente
  public int modifica_grad(int grad, PlusButton plus, MinusButton minus){
     if (plus.isClicked(mouseX,mouseY)){
       grad = grad +1; }
     if (minus.isClicked(mouseX,mouseY)){
       grad = grad -1; }
     return constrain(grad,0,255);
  }
  
  //Procedura di controllo input tastiera --> SECONDO TIPO DI INTERAZIONE UTENTE/ANIMAZIONE
  void keyPressed() {
     if (key == 'H' || key == 'h'){
       HSBattivo = !HSBattivo;
       //println(HSBattivo);
     }
  }
  
  //Proc disegno animazione
  public void disegna_Anim(color tinta, boolean hsbmode){
    noStroke();
    fft.forward(song.mix); 
    for (int i = 1; i < fft.avgSize(); i++){
        for(int j=0; j< fft.getAvg(i)/2; j=j+2){
           if(hsbmode){
             fill( map( j, 0, fft.avgSize(), 0, 200), 200, 200);
             }else{
             fill(tinta);
           }
           rect(i*20,(300-j*3),15,4);
        }
    }
    //Riflesso opposto e simmetrico rispetto all'asse-x
    for (int i = 1; i < fft.avgSize(); i++){
        for (int x = 1; x < fft.getAvg(i)/4; x=x+2 ) {
            if(hsbmode){
              fill( map( x, 0, fft.avgSize(), 0, 200), 200, 20);
            }else{
              fill(tinta,30);
            }
            rect(i*20,305+3*x,15,5);
        }
    }
 }

