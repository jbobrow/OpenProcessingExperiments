
PFont f, font;                          // f font1, font font2
String s = "";
String words = "";
char c, letter;
color fillVal = color(126);
int A = (int)('A'); // ASCII-Wert von A
int Z = (int)('Z');
ArrayList<Zeichen> myZ = new ArrayList<Zeichen>();
Zeichen[][] myText = new Zeichen[10][10];
Zeichen zz;



void setup() {
  size(800,600);
  f = createFont("Arial", 128, true); // STEP 3 Create Font
  font = createFont("Arial", 128, true); 

/*   
  //Initial Fill of TextArray 
  for (int i = 0; i<myText.length;i++) // line
   for (int k = 0; k<myText.length;k++) // row
    myText[i][k]=new Zeichen(
     ((width/12)*k+(width/10)), //xPos
     ((height/12)*i+(height/10)), //yPos
     0, // x-Richtung
     0, // y-Richtung
     '_', //Buchstabe
     0, //Geschwindigkeit
     0, //Drehrichtung
     0, //R
     0, //G
     0, //B
     32); //Groesse
    */ 
    
}

void draw() {
  background(255);

  textFont(f, 256);                 
  fill(235);
  textAlign(RIGHT);
  text(words, (width),(height/2+75) );

  if (keyPressed) {
       
    textFont(f, 512);                 
    fill(122);
    textAlign(CENTER);
    text(letter, (width/2),(height/2)+100);
    
  }
  
   //delete from ArrayList if groesse = 0
   for(int i=0;i<myZ.size();i++)
    if (myZ.get(i).getGroesse() == 0)
      myZ.remove(i);
   myZ.removeAll(Collections.singleton(null));    
   // shrink size
   for(Zeichen e: myZ)
    e.setGroesse(e.getGroesse()-1);
   
   // draw Zeichen
   for(Zeichen e: myZ)
    e.zeigeZeichen();
   
  

}

void keyPressed() {
  
  int xP = (int)random(width); // new Zeichen x
  int yP = (int)random(height); // new Zeichen y
  int gg = (int)random(128,256); // new Zeichen size
  
  int xMP = (int)(width/2);// Mittelpunkt-X
  int yMP = (int)(height/2);// Mittelpunkt-Y
  
  int xT = (-1)*((int)((xP - xMP)/100)); // X-Richtung Mittelpunkt
  int yT = (-1)*((int)((yP - yMP)/100)); // Y-Richtung Mittelpunkt
  
   
  
  
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
      
    
     zz = new Zeichen(
      xP,//xPos
      yP,//yPos
     xT, // x-Richtung
     yT, // y-Richtung
     letter,//Buchstabe
     random(0.3),//Geschwindigkeit
     (int)random(2),//Drehrichtung
     (int)random(256),//R
     (int)random(256),//G
     (int)random(256),//B
     gg); //Groesse
     //zz.zeigeZeichen();
     myZ.add(zz);
     
     delay(5);
     println("SIZE: " + myZ.size() );
  }
  
  println("pressed " + int(key) + " " + keyCode );
  //s = KeyEvent.getKeyText(int(key));
  
}

void keyTyped() {
  println("typed " + int(key) + " " + keyCode);
  
}

void keyReleased() {
 
  println("released " + int(key) + " " + keyCode);
  
}

class Zeichen{
  
//Feldvariablen
int xPos, yPos, rX, rY, richtung, rot, gruen, blau, groesse;
float winkel, geschwindigkeit;
char zeichen;

// Konstruktor
Zeichen (int x, int y, int rXX, int rYY, char z, float ges, int ri, int r,int g, int b, int gr )
{
  xPos = x;
  yPos = y;
  rX = rXX;
  rY = rYY;
  zeichen = z;
  geschwindigkeit = ges;
  richtung = ri;
  rot = r;
  gruen = g;
  blau = b;
  groesse = gr;
}

void zeigeZeichen()
{
  
if(richtung == 0)
  winkel+= geschwindigkeit;
    else winkel-= geschwindigkeit;
    
fill(rot,gruen,blau);
translate(xPos,yPos);
rotate(winkel);
textFont(font,groesse);
verschiebe( this.getRX(),this.getRY()); // move Zeichen
text(zeichen,0,0);
rotate(-winkel);
translate(-xPos,-yPos);
}

void setGroesse(int g)
{
if (g>=0)
 groesse = g;
}

int getGroesse(){
  return groesse;
}

void verschiebe(int umX, int umY)
{
  xPos += umX;
  yPos += umY;
  
}

int getRX()
{return rX;}

int getRY()
{return rY;}

}

