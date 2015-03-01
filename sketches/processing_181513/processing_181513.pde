
String s = " SAVE WORD ";
String a = " Type a word, end with a 0 (zero) to save the word and type another one on a clean canvas ";

int kleur;
int nummer;

// int[][] myArray = { {sizee,sizet,sizeh,sizeq}, {3,2,1,0}, {3,5,6,1}, {3,8,3,4} };
int sizee;
int sizet;
int sizeh;
int sizeq;
int sizeu;
int sizei;
int sizec;
int sizek;
int sizeb;
int sizer;
int sizeo;
int sizew;
int sizen;
int sizef;
int sizex;
int sizej;
int sizem;
int sizep;
int sizes;
int sizev;
int sizel;
int sizea;
int sizez;
int sizey;
int sized;
int sizeg;
int size1;
int sizevraagt;

void setup(){
  size(750,150);
  background(255);
}

void draw() {

   noStroke();
 

//frameRate(20);
}

  void keyReleased() {
     
    if (key == 't' || key == 'T') {
      fill(kleur);
      sizet+=25;
      rect(25, 25, sizet, sizet);
    }
    
      if (key == 'h' || key == 'H') {
       fill(kleur);
   sizeh+=25;
      rect(75, 25, sizeh, sizeh);
      }
      
         if (key == 'e' || key == 'E') {
       fill(kleur);
        sizee+=25;
      rect(125, 25, sizee, sizee);
      }
      
         if (key == 'q' || key == 'Q') {
      fill(kleur);
      sizeq+=25;
      rect(175, 25, sizeq, sizeq);
      }
      
         if (key == 'u' || key == 'U') {
      fill(kleur);
        sizeu+=25;
      rect(225, 25, sizeu, sizeu);
      }
      
         if (key == 'i' || key == 'I') {
      fill(kleur);
      sizei+=25;
      rect(275, 25, sizei, sizei);
      }
      
         if (key == 'c' || key == 'C') {
      fill(kleur);
      sizec+=25;
      rect(325, 25, sizec, sizec);
      }
      
         if (key == 'k' || key == 'K') {
      fill(kleur);
      sizek+=25;
      rect(375, 25, sizek, sizek);
      }
      
         if (key == 'b' || key == 'B') {
      fill(kleur);
      sizeb+=25;
      rect(425, 25, sizeb, sizeb);
      }
      
         if (key == 'r' || key == 'R') {
      fill(kleur);
      sizer+=25;
      rect(475, 25, sizer, sizer);
      }
      
         if (key == 'o' || key == 'O') {
      fill(kleur);
      sizeo+=25;
      rect(525, 25, sizeo, sizeo);
      }
      
         if (key == 'w' || key == 'W') {
      fill(kleur);
      sizew+=25;
      rect(575, 25, sizew, sizew);
      }
      
         if (key == 'n' || key == 'N') {
      fill(kleur);
      sizen+=25;
      rect(625, 25, sizen, sizen);
      }
      
         if (key == 'f' || key == 'F') {
      fill(kleur);
      sizef+=25;
      rect(675, 25, sizef, sizef);
      }
      
         if (key == 'x' || key == 'X') {
      fill(kleur);
      sizex+=25;
      rect(25, 75, sizex, sizex);
      }
      
         if (key == 'j' || key == 'J') {
      fill(kleur);
      sizej+=25;
      rect(75, 75, sizej, sizej);
      }
      
      
         if (key == 'm' || key == 'M') {
      fill(kleur);
      sizem+=25;
      rect(175, 75, sizem, sizem);
      }
      
         if (key == 'p' || key == 'P') {
      fill(kleur);
      sizep+=25;
      rect(225, 75, sizep, sizep);
  
      }
      
         if (key == 's' || key == 'S') {
      fill(kleur);
      sizes+=25;
      rect(275, 75, sizes, sizes);
      }
      
           if (key == 'v' || key == 'V') {
      fill(kleur);
      sizev+=25;
      rect(325, 75, sizev, sizev);
      }
      
         if (key == 'l' || key == 'L') {
      fill(kleur);
      sizel+=25;
      rect(375, 75, sizel, sizel);
      }
      
         if (key == 'a' || key == 'A') {
      fill(kleur);
      sizea+=25;
      rect(425, 75, sizea, sizea);
      }
      
           if (key == 'z' || key == 'Z') {
      fill(kleur);
      sizez+=25;
      rect(475, 75, sizez, sizez);
      }
      
         if (key == 'y' || key == 'Y') {
      fill(kleur);
      sizey+=25;
      rect(525, 75, sizey, sizey);
      }
      
         if (key == 'd' || key == 'D') {
      fill(kleur);
      sized+=25;
      rect(575, 75, sized, sized);
      }
      
           if (key == 'g' || key == 'G') {
      fill(kleur);
      sizeg+=25;
      rect(625, 75, sizeg, sizeg);
      }
      
           if (key == '/' || key == '?') {
      fill(kleur);
      sizevraagt+=25;
      rect(675, 75, sizevraagt, sizevraagt);
      }
      
              if (key == '1' || key == '!') {
      fill(kleur);
      size1+=25;
      rect(125, 75, size1, size1);
      }
      
       
     
        if (key == '0' || key == '0') {
      fill(255);
            println(a); 
       saveFrame("Word"+ nummer + ".tif");
       nummer+=1;
       rect(0,0, 750, 150);
       noStroke();
       kleur = 0;   //...set the color to black
       
       sizee = 0;
  sizet = 0;
sizeh = 0;
sizeq = 0;
sizeu = 0;
sizei = 0;
sizec = 0;
sizek = 0;
sizeb = 0;
sizer = 0;
sizeo = 0;
sizew = 0;
sizen = 0;
sizef = 0;
sizex = 0;
sizej = 0;
sizem = 0;
sizep= 0;
sizes= 0;
sizev= 0;
sizel= 0;
sizea= 0;
sizez= 0;
sizey= 0;
sized= 0;
sizeg= 0;
size1= 0;
sizevraagt= 0;
       
      println(s+nummer); 
  
   } 
   
    kleur+=20;
    
    if (kleur > 240) {  // When 'kleur' is > than 255...
   kleur = 0;   //...set the color to blk
   }
   

   
} 
   


