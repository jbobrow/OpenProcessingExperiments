
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioInput input;
float centX;
float centY;
float x, y, x2, y2;
float valInput;
float mx, my,malph;
float sposty,spostx;
float valoreleft;
float valoreright;
int alphaPlayer1,alphaPlayer2;
float alph;
float angle=0.0;
float radiusNoise;
float radius;
float coloreH,coloreB,coloreS;

void setup() {
  size(800, 500);
  frameRate(24);
  colorMode(RGB, 255);
  background(0);
  colorMode(HSB, 100);
  strokeWeight(0.5);   
  smooth();
  minim = new Minim(this);
  input = minim.getLineIn();
  player = minim.loadFile("11 Look In Your Eyes.mp3",512);


}

void draw(){
  /*
   if(mousePressed){
    if(mouseButton==LEFT){
      player.play();
      input.close();
  }
else if(mouseButton==RIGHT){
      player.pause();
      input=minim.getLineIn();
  }}*/
    waweInput();
   //wawePlayer();
   //se premuto il tasto P si effettua uno screenshot
    Ppressed();

}




void waweInput() {
  colorMode(RGB,255);
  fill(0,100);
rect(0,0,width,height);  
noFill();
//hue,saturation,brightness
colorMode(HSB,100);

  for (int i = 0; i<100; i++) {
     //creo variabile valore input audio
    float valInput=input.mix.get(i)*5000;
    //rimappo i valori di valInput e creo due variabili che andranno aggiunte alle coordinate delle forme
    mx=map(valInput, 0, 100, 0, (random(0, 100)));
    my=map(valInput, 0, 100, 0, (random(0, 100)));
    //variabile valore angolo
    float sinval=sin(angle);
    //rimappo i valori dell'angolo e creo 2 variabili che andranno aggiunte alle coordinate
    spostx=map(sinval,-1,1,(random(-100,0)),(random(0,100)));
    sposty=map(sinval,-1,1,(random(-50,0)),(random(0,50)));
    //incremento l'angolo
    angle+=0.05;
    float valorerandX=random(0,width);
    float valorerandY=random(0,height);
    //creo variabili posizionamento
    float centY=height/2+sposty;
    float centX=0+width/10+input.left.get(i)*3000+spostx;
    float centY2=height/2+sposty;
    float centX2=width-width/10-input.right.get(i)*3000-spostx;
    //creo variabili colore e metto come valori l'input audio rimappato
    float coloreH= my;
    float coloreS= mx;
    float coloreB= mx;
    float alph=30;
    //variabili necessarie per la creazione della spirale(successivamente ho riassegnato i valori x,y,x2)
    float lastx = -999;
    float lasty = -999;
    float lastx2 = -999;
    float lasty2 = -999;
    //variabile disturbo del raggio
    float radiusNoise = random(10);
    float radius = 10;
    
    stroke( coloreH, coloreS, coloreB, alph); 
   
    strokeWeight(1);
    //creo angolo di partenza, di fine e il suo incremento
    int startangle = int(random(360)); 
    int endangle =  1440 + int(random(1440)); 
    int anglestep =  5 + int(random(3)); 
    
  
   
   println(coloreH);
    //creo ciclo for(inizio angolo,fine angolo e incremento angolo per ogni giro) e trasformo cos in radianti.
    for (float ang = startangle; ang <= 1440 + random(1440); ang += anglestep) {    
      radiusNoise += 0.05;
      //aggiungo al raggio il valore d'entrata audio e lo moltiplico per visualizzarne meglio l'effetto
      radius += 0.1+input.mix.get(i)*((width/100)*2);
      //creo disturbo del raggio con noise per avere un effetto più naturale
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang)+input.mix.get(i)*3000;
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      x2 = centX2 + (thisRadius * cos(rad));
      
      if (lastx > -999) {
        line(x, y+input.mix.get(i)*500, lastx, lasty);
        line(x2, y+input.mix.get(i)*500, lastx2, lasty);
        
     if(keyPressed &&(key==CODED)){ if (keyCode==LEFT){
     alph=+random(50,150);
     radiusNoise=+random(30,100);
   }
     else if(keyCode==RIGHT){
     centX=valorerandX+input.left.get(i)*3000+spostx ;
     centX2=valorerandX-input.right.get(i)*3000-spostx   ;
     centY=valorerandY+sposty;
     centY2=valorerandY+sposty;
     thisRadius=0;
     rad=0;


     } else if(keyCode==UP){
     centX=input.mix.get(i)*30000;
     centY=-input.mix.get(i)*40000;  
     centY2=input.mix.get(i)*40000;  

     centX2=input.mix.get(i)*60000;
     
     }
     
     }
        }
       
      
      lastx = x;
      lastx2=x2;
      lasty = y;
    }
  }}

  
  
/*  void wawePlayer() {
//background(0,0,0);
 

  for (int i = 0; i<100; i++) {
    float valInput=player.mix.get(i)*5000;
    mx=map(valInput, 0, 100, 0, (random(0, 100)));
    my=map(valInput, 0, 100, 0, (random(0, 100)));
    malph=map(valInput,0,100,0,7);

    float centY=height/2;
    float centX=0+width/10+player.left.get(i)*2000;
    float centY2=height/2;
    float centX2=width-width/10-player.right.get(i)*2000;
    float coloreH= my;
    float coloreS= mx;
    float coloreB= mx;
    float alph=malph;
   

    float lastx = -999;
    float lasty = -999;
    float lastx2 = -999;
    float lasty2 = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke( coloreH, coloreS, coloreB, alph); 
   
    strokeWeight(1);
    int startangle = int(random(360)); 
    int endangle =  1440 + int(random(1440)); 
    int anglestep =  5 + int(random(3)); 
    for (float ang = startangle; ang <= 1440 + random(1440); ang += anglestep) {    
      radiusNoise += 0.05;
      radius += 0.1+player.mix.get(i)*6;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang)+player.mix.get(i)* 1000;
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      x2 = centX2 + (thisRadius * cos(rad));
      
      if (lastx > -999) {
        line(x, y+player.mix.get(i)*300, lastx, lasty);
        line(x2, y+player.mix.get(i)*300, lastx2, lasty);
        }
       
      lastx = x;
      lastx2=x2;
      lasty = y;
    }
  }
}
  */
  //permetto il prinscreen premendo il tasto P
  
  void Ppressed(){
    if(keyPressed){if((key =='p')||(key=='P')){
         saveFrame("frame-####");
       
   }
 }
}

  

void stop(){
  player.close();
  input.close();
  minim.stop();
  super.stop();
}



