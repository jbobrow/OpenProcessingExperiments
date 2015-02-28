
/* Law Grid By Marcos Frankowicz */
/* Pseudo 
/*      12/01/2010               */

/*         
           A B C
           D E F
           G H I

 Valids:
AB  BA  CB  DA  EA  FB  GD  HD  IE
AD  BC  CE  DB  EB  FC  GE  HE  IF
AE  BD  CF  DE  EC  FE  GH  HF  IH
    BE      DG  ED  FH      HG  
    BF      DH  EF  FI      HI  
                EG        
                EH        
                EI  

examples: ABD, EAB , FCE, HFI.

  Eu comecei por aqui, poderia dizer isso como um Pseudo algaritimo de visinhança?
  I start here, could I say this a pseudo-neighborhood algorithm?
(press any key to acces the random sequence of that letter (a - i), or any other key for random).
*/

char[][] First = {{'A','B','C'},
                  {'D','E','F'},
                  {'G','H','I'}};
                  
char[][] Second = {{'A','B','C'},
                   {'D','E','F'},
                   {'G','H','I'}};
  
char[][] Third = {{'A','B','C'},
                   {'D','E','F'},
                   {'G','H','I'}};
int a = 0;
int b = 100;
int c = 200;
                 
int[][] spotPos = { {a,a},{b,a},{c,a},
                      {a,b},{b,b},{c,b},
                      {a,c},{b,c},{c,c} };
                     
int space = b;

int randomNumber1;
int randomNumber2;
int randomNumber3;

PFont font;

void setup(){
  size(300,300,P2D);
  font = loadFont("Tahoma-20.vlw");
}

void draw(){
   background(0);
   
   for(int x = 0; x<width; x+=c+b){
     for(int y = 0; y<height; y+=c+b){
       drawSpots(x,y);
     }
   }
 }

void keyPressed(){
  FirstNum();
  SecondNum();
  ThirdNum();
  randomNumber1 = FirstNum();
  randomNumber2 = SecondNum();
  randomNumber3 = ThirdNum();
}

