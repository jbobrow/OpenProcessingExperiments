
String inputByUser = "aaaaaggagaggagagagactcaagcacgcccctcacaggactgct" + 
"gaggccctgcaggtgtctgcagcatgtgcccaggccggggactctgtaagccactgctggagaccac"+ 
"tcccatcctttctcccatttctctagacctgctgcctatacagtcactttttttttttttttgagacggagtc"+
"tcgctctgtcgcccaggctggagtgcagtggcgggatctcggctcactgcaacgtccgcctcccgggttcacgccattctcctgcctcagcctcccaagtagctggga"
+ "ccacagcgcccgccactacgcccggctaattttttgtatttttagtagagacggggtttcaccgttttagccgggatggtctcgatctcctgacctcgtgatccgcccgcctcggcctcccaaagtgctgggattacaggcgtgatacagtcacttttatgtggtttcgccaattttattccagctctgaaattctctgagctccccttacaagcagaggtgagctaagggctggagctcaagccattcaaccccctaccagatctgacgaatgtgatggccacatcccggaaatatgaagacctg";
int i=0; 
float j=0;
void setup () {
  size(900, 900);
  frameRate(8);
 
}
void draw () {
  background(111);
  // rotate(j);
  j+=.01;
  //text(inputByUser.charAt(i), 22, i*17+j);
  doSymbol (inputByUser.charAt(i));
 
  // when i goes all the way till string length, reset i 
  // done here by using module operator
 
  i = (i + 1)%inputByUser.length();
 
 
 
  if (i > inputByUser.length()) i=0;
}
void doSymbol(char a) {
  println (a);
  switch (a) {
  case 'c':
    fill(5, 48, 255);
    doRect();
    break;
  case 'a':
    fill(3, 255, 12);
    doRect();
    break;  
  case 'g':
    fill(3, 3, 3);
    doRect();
    break;  
  case 't':
    fill(255, 0, 0);
    doRect();
    break;    
  default:
    fill(255, 2, 255);
    doRect();
    break;
  }
}
void doRect() {
   size(900, 900);
// some data : size
float theWidthHalf = 400;
float theHeight  = 700;
// position 
float theCenterX = width / 2;     // in x-direction, this denotes the middle 
float theTopY    = height - 80;    // the point at the bottom. 
float theBaseY   = theTopY - theHeight;   // the broad side / base 
 
triangle(
theCenterX - theWidthHalf, theBaseY, 
theCenterX,                theTopY, 
theCenterX + theWidthHalf, theBaseY
);
//
}
//

