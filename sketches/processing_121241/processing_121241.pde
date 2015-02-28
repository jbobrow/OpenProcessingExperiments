
/***Ett program av Sara Herrlander för delkursen Processing VT13***/

//importerade bibliotek som behövs för själva blommans utritning
import java.util.Timer; 
import java.util.TimerTask;
import java.util.Vector;
import ddf.minim.*; //bibliotek som behövs för ljuduppspelning samt ljudupptagning via mikrofon

//mina variabler för bakgrund och ljuduppspelning
Minim minim;
AudioPlayer player; //variabel för ljuduppspelaren till "Hey Joe"
AudioPlayer player2; //variabel för ljuduppspelaren till "The Winner Is"
AudioPlayer player3; //variabel för ljuduppspelaren till "Trials"
AudioInput input; //variabel för ljudupptagning via mikrofonen
PImage desert;//variabel för importerande av bakgrundsbilden
int del; // en variabel som tillåter mig att fördröja utritningen av blommor
String playingSong = "";

void setup(){
  size(1200, 669); //storleken på fönstret matchar min bakkrundsbilds storlek
  desert = loadImage("desert.jpg"); //importering av min bakgrundsbild
  background (desert); 
  minim = new Minim(this);
  input = minim.getLineIn(); 
  //här laddar jag in mina låtar i programmet
  player = minim.loadFile("Hey Joe.mp3"); 

     
}

void draw(){
  
  println(input.mix.level()); //det här tillåter mig att hämta värden från ljudupptagningen via mikrofonen
  //skapar en ny instans av koden i blommaklassen (ritar ut en blomma)
  if(del > 50 && input.mix.level() > 0.2){ 
    new Flower(); 
    del=0; //genom att skapa en delay-funktion kan jag styra hur tätt inpå varandra mina blommor får växa upp
  }
  del++;
  //if-satser som styr vid vilken frekvens en låt ska börja spelas samt ser till att övriga låtar är pausade och inte stör uppspelningen.
  if(input.mix.level() > 0.1 && input.mix.level() < 0.4){ 
    player.play();
    playingSong = "song1";
  }

}

void stop(){
  
  player.close();
  minim.stop();
  super.stop();
}

 
class Branch extends Thread{ //en klass som skapar små blad på min blomstjälk
  private float posY, posX;
  private int type; 
  
  public void setBranchPos(float y, int t){
    posY = y;    
    type = t;
  }
  
  public void setPosX(float x){
    posX = x;
  }
  
  public void run(){
    try {   
      if (type == 0){   
        for (int i = 0; i<17 ; i++){        
          ellipse(posX+i, posY, i, 7);
          Thread.sleep(10);    
          repaint();
        }
      }else if (type == 1){
        for (int i = 0; i<25 ; i++){        
          ellipse(posX-i, posY, i, 7);
          Thread.sleep(10);    
          repaint();
        }
      }
    }catch (InterruptedException e) {
      e.printStackTrace();
    }catch(NullPointerException e){
      e.printStackTrace();
    }
    
  }
  
}
//Blommaklassen
public class Flower extends Thread {

  // Olika variabler som blomman använder
  float x;
  private float posX;
  private float startX = 50 + (float)Math.random()*1150; //styr var i x-led blomman kan ritas ut
  private float angle = (float)Math.random()*300;
  private float radius = (float)Math.random()*15; //styr hur mycket stjälken kan svänga/hur stora kurvorna blir
  private float frequency = 2; //styr hur ofta kurvorna förekommer
  private float heightDiff = (float)Math.random()*height; // avståndet mellan blommans topp och fönstrets överkant.
  private float maxH = height-heightDiff; 


  Branch br1 = new Branch(); //en variabel som anropar/skapar ny instans av bladklassens kod
  
  
  //Konstruktorn som bl.a. sätter färg på stjälken
  public Flower () {   
    br1.setBranchPos(heightDiff+(float)Math.random()*maxH, 0);
    this.start();
    noStroke();
    fill(20,70,40);
    
}
int getRandomColor(){
  return color(random(120,255), random(255), random(255), 130); //sätter olika random färger på blommorna, ser till att de aldrig kan bli svarta) samt gör dem delvis transparanta 
}

//Själva blommorna
void drawBlomma(float bx, float by, float blommaSize){
  pushStyle(); //jag använder mig av pushStyle för att blommornas kod inte ska störa stjälkens kod
  strokeWeight(0);
  color c = getRandomColor();
  fill(c);
  stroke(c);
  //blomman skapas medhjälp av fyra olika ellipser som relaterar till varandra i storlek och placerar sig ovanpå varandra
  ellipse(bx, by, blommaSize, blommaSize/0.6);
  ellipse(bx, by, blommaSize * 1.7, blommaSize * 1.7);
  ellipse(bx, by, blommaSize * 2.3, blommaSize * 2.3);
  ellipse(bx, by, blommaSize * 3, blommaSize * 3);
  ellipse(bx, by, blommaSize * 4, blommaSize * 4);
 
  popStyle();
}

  //Själva animeringen/utritningen av stjälken och blomman tillsammans
  public void run() {
       
    try {
      int blomx = 0; 
      int blomy = 0;
        for (int i = height-(int)random(160); i> heightDiff; i--){
          posX = startX + sin(radians(angle))*(radius);        
          ellipse(posX, i, 3, 10);
          repaint();
          angle -= frequency;
          //variabler som lokaliserar x och y-värdet för där varje stjälk slutar så att själva blomman kan ritas ut på rätt ställe
          blomx = (int)posX;   
          blomy = (int)i;
          
          //Bladens animering/utritning
          if (i==(int)br1.posY){
            br1.setPosX(posX);
            br1.start();
                     }
        
          
          Thread.sleep(10);
       } 
        //här ritas blomman ut i anknytning till stjälkens slutliga x- och y-värden
        drawBlomma(blomx, blomy, random(10,45));
    
    } 
    
    catch (InterruptedException e) {
      e.printStackTrace();
    } 
    
    catch(NullPointerException e){
      e.printStackTrace();
    }
  }

}


