
String inputByUser = "aaaaaggagaggagagagactcaagcacgcccctcacaggactgct" + 
"gaggccctgcaggtgtctgcagcatgtgcccaggccggggactctgtaagccactgctggagaccac"+ 
"tcccatcctttctcccatttctctagacctgctgcctatacagtcactttttttttttttttgagacggagtc"+
"tcgctctgtcgcccaggctggagtgcagtggcgggatctcggctcactgcaacgtccgcctcccgggttcacgccattctcctgcctcagcctcccaagtagctggga" 
+ "ccacagcgcccgccactacgcccggctaattttttgtatttttagtagagacggggtttcaccgttttagccgggatggtctcgatctcctgacctcgtgatccgcccgcctcggcctcccaaagtgctgggattacaggcgtgatacagtcacttttatgtggtttcgccaattttattccagctctgaaattctctgagctccccttacaagcagaggtgagctaagggctggagctcaagccattcaaccccctaccagatctgacgaatgtgatggccacatcccggaaatatgaagacctg";
int i=0; 
float j=0;
void setup () {
  size(600, 600);
  background(111);
  frameRate(8);
}
void draw () {
  background(111);
  // rotate(j);
  j+=.01;
  //text(inputByUser.charAt(i), 22, i*17+j);
  doSymbol (inputByUser.charAt(i));
  i++;
  if (i > inputByUser.length()) i=0;
}
void doSymbol(char a) {
  println (a);
  switch (a) {
  case 'c':
    fill(255, 0, 0);
    doRect();
    break;
  case 'a':
    fill(5, 48, 255);
    doRect();
    break;  
  case 'g':
    fill(3, 255, 12);
    doRect();
    break;  
  case 't':
    fill(255, 243, 3);
    doRect();
    break;    
  default:
    fill(255, 2, 255);
    doRect();
    break;
  }
}
void doRect() {
  rect (100, 100, width-200, height-200);
}
//




