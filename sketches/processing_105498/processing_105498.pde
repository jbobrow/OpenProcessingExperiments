
// sopa de letras
String myText = "Type a letter";
String myTextReset = "Reset";
char input;
int[] check;
int Try=0;
int sum=0;
int sum2=0;

String filename = "listaPalabras.txt";
String[] list;
String word;
int randomline;
int numberLetters;
char[] letters;

int circleX,circleY,circleSize;
color circleColor, circleHighlight;
boolean circleOver = false;

void setup() {
  
  size(400,400);
  background(255);
  colorMode(RGB);
  background(100,100,100);
  circleColor = color(255); 
  circleHighlight = color(204);
  circleX = width/2+circleSize/2;
  circleY = height-height/4;
  circleSize = 55;
  
 list = loadStrings(filename);
 randomline = int(random(0,list.length));
 word=list[randomline];
 numberLetters = int(word.length());
 letters = new char[numberLetters];
 check = new int[numberLetters];
 
 for (int i = 0; i<numberLetters; i++){
   check[i] = 0;
 }

 for (int i = 0; i < numberLetters; i++) {
  letters[i] = word.charAt(i);
  //println(letters[i]); 
  }
 

}


void draw() {
  
    update(mouseX, mouseY);
    background(100,100,100);
    textSize(23);
    fill(255, 255, 255);
    textAlign(CENTER, BOTTOM);
    text(myText,width/2,height);
    text(input,width/2,height/2);
    
    for (int i = 0; i < numberLetters; i++) {
    //text(letters[i],width/3+(i*23),height/4);
    strokeWeight(3);
    line(width/3+(i*23)-(textWidth(letters[i])/2), height/2-90, width/3+(i*22)+(textWidth(letters[i])/2),height/2-90 ); 
    }
    
    for (int i=0; i<numberLetters; i++){
      if (check[i]==1){
          textSize(23);
          fill(255, 255, 0);
          text(letters[i],width/3+(i*23),height/4); 
      } else {
        }
    }
   
    mouseOverCircle();
    circleReset();
    gameOver();
    youWin();
    

}



void keyPressed() {
  
if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode!= BACKSPACE) {
    input = key;
    
      for (int i =0; i<numberLetters; i++) {
     if(input==letters[i]) {
         check[i]=1;
        }
      }
  
      for (int i=0; i<numberLetters-1; i++) {
        if (i==0){
          sum = check[i]+check[i+1];
        } else {
          sum = sum + check[i+1];
        }
       
      }
         
    if (sum==sum2){
       Try++;
    }   

    sum2=sum;
    
  }
  
    
}

void mousePressed() {
  if (circleOver) {
    randomline = int(random(0,list.length));
    word=list[randomline];
    numberLetters = int(word.length());
    letters = new char[numberLetters];
    check = new int[numberLetters];
    sum=0;
    sum2=0;
    Try=0;
    for (int i = 0; i < numberLetters; i++) {
    letters[i] = word.charAt(i);
    }
   for (int i = 0; i<numberLetters; i++){
     check[i] = 0;
    }

  }
}


void gameOver(){
      if (Try==15) {
     textSize(60);
     fill(30,200,125);
     text("YOU LOSE",width/2,height/2);
    }
}

void youWin(){
   if (sum==numberLetters){
     textSize(60);
     fill(30,200,125);
     text("YOU WIN",width/2,height/2);
   } 
}

void mouseOverCircle(){
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  }  else {
    circleOver = false;
  }
}

void circleReset(){
    stroke(0);
    strokeWeight(1);
    ellipse(circleX, circleY, circleSize, circleSize);
    textSize(12);
    textAlign(CENTER);
    fill(0, 0, 0);
    text(myTextReset,circleX,circleY+5);

}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}




