
float x = 0.0;
float y = 0.0;
float angle = 0.0;
float speed = 1;
boolean down = true;
float l=100;
float h=1;
float r=2;
int s=1;
int k=0;
int bildzahl = 000;
float u=0;




void setup()
{

  size (1000, 600);
  colorMode(HSB);
  background(0);
  smooth();
  noFill();
  stroke(random(0, 360), 255, 255, 50);
  //stroke(random(0, 360), 255, 255, random(20, 50));
  x = random(50, width);
}




void draw() {

  
  //Text innerhalb von canvas
  if (k==0){
PFont font; //erstellt ein Pfont-Objekt mit dem Namen
font = loadFont("LucidaSansUnicode-12.vlw"); //weist dem Objekt font die Grafiken für die einzelnen Buchstaben zu
textFont(font); //estellt ein Objekt textFont mit dem Parameter font
text("possible key's:", width/2+width/4,height/2-height/3); //gibt text auf dem Schirm aus
text("+ & - for speed", width/2+width/4,height/2-height/3+25); //gibt text auf dem Schirm aus
text("f & d lineWeight", width/2+width/4,height/2-height/3+50); //gibt text auf dem Schirm aus
text("u & i = outfading", width/2+width/4,height/2-height/3+75); //gibt text auf dem Schirm aus
text("1,2,3 different Modes", width/2+width/4,height/2-height/3+100); //gibt text auf dem Schirm aus
text("n = new picture!", width/2+width/4,height/2-height/3+125); //gibt text auf dem Schirm aus
text("h & w = stop and go", width/2+width/4,height/2-height/3+150); //gibt text auf dem Schirm aus
text("l & o for length (line and radius ellipse)", width/2+width/4,height/2-height/3+175); //gibt text auf dem Schirm aus
text("to delete this text, press k and n", width/2+width/4,height/2-height/3+200); //gibt text auf dem Schirm aus
text("to get text back, press t", width/2+width/4,height/2-height/3+225); //gibt text auf dem Schirm aus
text("u & i = outfading", width/2+width/4,height/2-height/3+250); //gibt text auf dem Schirm aus
textSize(11); 
  }
  
  //outfading durch sekündliches zeichnen von rechtecken mit hohem alpha
  if (u==1) {
  int time = second();  // Values from 0 - 59
    if ( time < 59) {
      rect (0, 0, width, height);
      fill (0, 5);
    }
    
    if ( time ==20) {
      k=1;}
  }

  
  
  if (s==1) {


    angle += random(-0.5, 0.5);

    // Startet einen neuen lauf, wenn der Boden erreicht wurde
    if (y > height) {
      down = true;
      y = 0.0;
      x=random (0, width);
      stroke(random(0, 360), 255, 255, 150);
    }

    //Beschränkt die Geschwindigkeit auf 7
    if ( speed >= 7) {
      speed = 7;
      println("to fast");
    }

    //Damit die geschwindigkeit nicht negativ werden kann, da sonst nach oben zeichnet und programm beendet wird      
    if ( speed < 0) {
      speed = 0;
      println("to slow");
    }

    //Sicherung damit Strichstärke nicht negativ wird und programm sonst abstürzt
    if (h<=0) {
      h=0.5;
      println("zudünn");
    }




   //eigenschaften während der fahrt nach unten
    if (down) {
      x += cos(angle) * speed;
      y += speed;
    } 


    float noiseScale=220.02;
    translate(x, y);
    rotate((angle*2)*noise(mouseX*500));
    strokeWeight(h); 

//die verschiedenen Modes Dreieck, Ellipse und Linie
    if (r==1) {
      triangle(0, random(-150, -10), 0, 0, random(5, 20), random(-150, -50));
   
      println("dreieck");
    }

    if (r==2) {
      ellipse (0, l, random (20, 100), 2);
      println("kreis");
    }
    if (r==3) {
      line(0, 0, l/2, l/2);
      println("linie");
    }


  }

}






void 
keyPressed () {

  // Taste K 
  if (key == 'k') {
    k++;
    println("hallo Welt");
  }

//Informationstext einblenden
if (key == 't') {
    k=0;
    println("hallo Welt");
  }

  //Taste "f" erhöht die Strichstärke (FETTER)
  if (key =='f') {
    h ++;
    println("hallo");
  }

  // Taste "d" verringert die Strichstärke (DÜNNER)
  if (key =='d') {
    h --;
    println("strichstarke");
  }

  //Taste "+" beschleunigt die Zeichnung  
  if (key =='+') {
    speed ++;
    println("hallotest");
  }

  //Taste "-" verringert die Geschwindigkeit der Zeichnung
  if (key =='-') {
    speed --;
    println("hallotest");
  }

  //Taste h verringert die Geschwindigkeit der Zeichnung (HALT)
  if (key =='h') {
    s=0;
    println("hallotest");
  }
  
  // Taste w setzt zeichnung fort "(WETIER)
  if (key =='w') {
    s=1;
    println("weiter");
  }
  //Taste l vergrößert die Länger der Striche
  if (key =='l') {
    l++;
    println("hallo");
  }

  //Taste o verringert die Länge der Striche
  if (key =='o') {
    l--;
    println("hallo");
  }
  //Taste "eins" Stellt den Mode auf Dreieck
  if (key =='1') {
    r=1;
    println("hallo");
  }

  //Taste "zwei" stellt den Mode auf Kreise
  if (key =='2') {
    r=2;
    println("hallo");
  }

  //Taste "drei" stellt auf Linien um.
  if (key =='3') {
    r=3;
    println("hallo");
  }




  //Taste n zeichnet einen neuen Hintergrund in schwarz
  if (key =='n') {
    background(0);
    println("hallo");
  }

  //bei druck der Taste u wird der Hintergrund jede sekunde mit alpha drüber gemalt, entsteht ein verschwindungseffekt
  if (key =='u') {
    u=1;
    println("hallo");
  }

  //taste i lässt den verschwindeeffekt ausschalten
  if (key =='i') {
    u=0;
    println("hallo");
  }

 /* // taste v speichert ein jpg bild mit zahl der frame heraus
  if (key == 's') {
    //pdf = true;
    saveFrame ("Export-#####'.jpg");
    println("save");
  }*/
}



//Koordinaten werden bei Mouseclick dahin verlegt.
void mouseClicked () {
  if (mouseButton == LEFT) {
   stroke(random(0, 360), 255, 255, 50);
    x=mouseX;
    y=mouseY;

  }
}


