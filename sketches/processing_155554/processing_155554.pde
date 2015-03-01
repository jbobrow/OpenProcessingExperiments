
//Ciaran Carrick-C12548143

//Some printed examples below, letter function in its asssigned tab.
//I did without the draw as writing the code each frame kept command line printing repeatedly.
void setup() {
  size(600, 200);
  word("V", 20, 40, 0,0, 50);
  word("ABCDEFGHIJKLMN", 5, 160, 0, 0,44);
  //word("OPQRSTUVWXYZ", 5, 80, 0, 0,50); 
}
void word(String a, int x, int y, int letterWidth, int letterHeight, int gap) {
  for (int i = 0; i < a.length(); i++) { //a.length counts indexs held in array depending on char amount.
    print("Char: " + a.charAt(i) + "\n");// prints to dos box
    letter(a.charAt(i),x+((gap + letterWidth) * i), y, letterWidth, letterHeight);
  }//gap(0) is added to LW first then cycled through for loop using Alist[i] counting through char array. 
  
}

//Once arguement a is set to == corresponding letter, it print lines to create letter.
//Each line was given a default size, I found an easier way half way through but continued after the work had been done.
//LetterW and LetterH were assigned to letters to change size while those left as x or y were left to be starting points
//Letterheight/2 uses half the int variable to maintain Middle-line accuracy e.g A B F Y as to maintain letter shape
//Letterwidth*2 was used for M and V to maintain shape on x axis

//int x/y is position on x/y axis, letterwidth/height control dimentions of letter
void letter(char a, int x, int y, int letterWidth, int letterHeight) {// Start Letter Function
  if (a == 'A') {
    line(15+x+letterWidth, y, x, y);
    line(x, y, x, 30+y+letterHeight);
    line(15+x+letterWidth, 30+y+letterHeight, 15+x+letterWidth, y); //right
    line(x, 15+y+letterHeight/2, 15+x+letterWidth, 15+y+letterHeight/2); //middle
  }
  else if (a == 'B') {    
    line(x+15+letterWidth, y+15+letterHeight/2, x, 15+y+letterHeight/2);
    line(x, y+30+letterHeight, x, y);
    line(15+x+letterWidth, y, x, y);
    line(15+x+letterWidth, 30+y+letterHeight, 15+x+letterWidth, y);
    line(15+x+letterWidth, 30+y+letterHeight, x, 30+y+letterHeight);
  }
  else if (a == 'C') {
    line(15+x+letterWidth, y, x, y);
    line(x, 30+y+letterHeight, x, y);
    line(15+x+letterWidth, 30+y+letterHeight, x, 30+y+letterHeight);
  }

  else if (a == 'D') { 
    line(x, y+30+letterHeight, x, y);
    line(x+20+letterWidth, y, x, y);
    line(x+20+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
    line(x+20+letterWidth, y+30+letterHeight, x+20+letterWidth, y);
  }
  else if (a == 'E') {
    line(x, y+30+letterHeight, x, y);
    line(x+15+letterWidth, y, x, y);
    line(x+15+letterWidth, y+15+letterHeight/2, x, y+15+letterHeight/2);
    line(x+15+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
  }
  else if (a == 'F') {
    line(x, y+30+letterHeight, x, y);
    line(x+15+letterWidth, y, x, y);
    line(x+15+letterWidth, y+15+letterHeight/2, x, y+15+letterHeight/2);
  }
  else if (a == 'G') {
    line(x, y+30+letterHeight, x, y);
    line(x+20+letterWidth, y, x, y);
    line(x+20+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
    line(x+20+letterWidth, y+15+letterHeight/2, x+20+letterWidth, y+30+letterHeight);
    line(x+10+letterWidth/2, y+15+letterHeight/2, x+20+letterWidth, y+15+letterHeight/2);
  }
  else if (a == 'H') {
    line(x, y+30+letterHeight, x, y);
    line(x+20+letterWidth, y+15+letterHeight/2, x, y+15+letterHeight/2);
    line(x+20+letterWidth, y+30+letterHeight, x+20+letterWidth, y);
  }
  else if (a == 'I') {
    line(x+5+letterWidth/2, y+30+letterHeight, x+5+letterWidth/2, y);
    line(x+10+letterWidth, y, x, y);
    line(x+10+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
  }
  else if (a == 'J') {
    line(x+15+letterWidth, y+30+letterHeight, x+15+letterWidth, y);
    line(x+15+letterWidth, y, x+5+letterWidth/2, y);
    line(x+15+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
  }
  else if (a == 'K') {
    line(x, y+30+letterHeight, x, y);
    line(x, y+15+letterHeight, x+15+letterWidth, y);
    line(x, y+15+letterHeight, x+15+letterWidth, y+30+letterHeight);
  }
  else if (a == 'L') {
    line(x, y+30+letterHeight, x, y);
    line(x, y+30+letterHeight, 20+x+letterWidth, y+30+letterHeight);
  }
  else if (a == 'M') {
    line(x, y+30+letterHeight, x, y);
    line(x, y, x+10+letterWidth, y+30+letterHeight);
    line(x+20+letterWidth*2, y, x+10+letterWidth, y+30+letterHeight);
    line(x+20+letterWidth*2, y+30+letterHeight, x+20+letterWidth*2, y);
  }
  else if (a == 'N') {
    line(x, y, x, 30+y+letterHeight);
    line(15+x+letterWidth, 30+y+letterHeight, 15+x+letterWidth, y);
    line(15+x+letterWidth, 30+y+letterHeight, x, y);
  }
  else if (a == 'O') {
    line(x, y, x, 30+y+letterHeight);
    line(20+x+letterWidth, 30+y+letterHeight, 20+x+letterWidth, y);
    line(20+x+letterWidth, y, x, y);
    line(20+x+letterWidth, 30+y+letterHeight, x, y+30+letterHeight);
  }
  else if (a == 'P') {
    line(x, y, x, 30+y+letterHeight);
    line(20+x+letterWidth, y+15+letterHeight, 20+x+letterWidth, y);
    line(20+x+letterWidth, y, x, y);
    line(20+x+letterWidth, 15+y+letterHeight, x, y+15+letterHeight);
  }
  else if (a == 'Q') {
    line(x, y, x, 30+y+letterHeight);
    line(20+x+letterWidth, 30+y+letterHeight, 20+x+letterWidth, y);
    line(20+x+letterWidth, y, x, y);
    line(20+x+letterWidth, 30+y+letterHeight, x, y+30+letterHeight);
    line(15+x+letterWidth/2, y+20+letterHeight, 20+x+letterWidth, 35+y+letterHeight);
  }
  else if (a == 'R') {
    line(x, y, x, 30+y+letterHeight);
    line(15+x+letterWidth, y+15+letterHeight, 15+x+letterWidth, y);
    line(15+x+letterWidth, y, x, y);
    line(15+x+letterWidth, 15+y+letterHeight, x, 15+y+letterHeight);
    line(15+x+letterWidth, 30+y+letterHeight, x, 15+y+letterHeight);
  }
  else if (a == 'S') {
    line(20+x+letterWidth, y, x, y);
    line(x, 15+y+letterHeight/2, x, y);
    line(20+x+letterWidth, y+15+letterHeight/2, x, y+15+letterHeight/2);
    line(20+x+letterWidth, 15+y+letterHeight/2, 20+x+letterWidth, 30+y+letterHeight);
    line(20+x+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
  }
  else if (a == 'T') {
    line(30+x+letterWidth, y, x, y);
    line(15+x+letterWidth/2, 30+y+letterHeight, 15+x+letterWidth/2, y);
  }
  else if (a == 'U') {
    line(x, 30+y+letterHeight, x, y);
    line(20+x+letterWidth, 30+y+letterHeight, 20+x+letterWidth, y);
    line(20+x+letterWidth, 30+y+letterHeight, 20+x+letterWidth, y);
    line(x, 30+y+letterHeight, 20+x+letterWidth, 30+y+letterHeight);
  }
  else if (a == 'V') {
    line(x+15+letterWidth, 30+y+letterHeight, x, y);
    line(x+15+letterWidth, 30+y+letterHeight, x+30+letterWidth*2, y);
  }
  else if (a == 'W') {
    line(x+15+letterWidth, 30+y+letterHeight, x, y);
    line(x+15+letterWidth, 30+y+letterHeight, x+30+letterWidth*2, y);
    line(x+45+letterWidth*3, 30+y+letterHeight, x+60+letterWidth*4, y);
    line(x+45+letterWidth*3, 30+y+letterHeight, x+30+letterWidth*2, y);
  }
  else if (a == 'X') {
    line(x+20+letterWidth, 30+y+letterHeight, x, y);
    line(x, 30+y+letterHeight, x+20+letterWidth, y);
  }
  else if (a == 'Y') {
    line(x+15+letterWidth, 15+y+letterHeight/2, x, y);
    line(x+15+letterWidth, 15+y+letterHeight/2, x+30+letterWidth*2, y);
    line(x+15+letterWidth, 30+y+letterHeight, x+15+letterWidth, y+15+letterHeight/2); //y+15+letterHeight/2 Keeps y2 point together with other y points
  }
  else if (a == 'Z') {
    line(x+20+letterWidth, y, x, y);
    line(x+letterWidth, 30+y+letterHeight, x+20+letterWidth, y);
    line(x+20+letterWidth, y+30+letterHeight, x, y+30+letterHeight);
  }
}//End Letter Function



