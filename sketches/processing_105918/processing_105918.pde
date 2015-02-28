
// sopa de letras
String myText = "Type a letter";
String myTextReset = "Reset";
char input;
int[] check;
int Try=0;
int sum=0;
int sum2=0;
boolean win= false;
boolean lose=false;
DeathMan muneco; 

String filename = "listaPalabras.txt";
String[] list;
String word;
int randomline;
int numberLetters;
char[] letters;

int circleX,circleY,circleSize;
color circleColor, circleHighlight;
boolean circleOver = false;
int position;

void setup() {
  
  size(800,400);
  background(255);
  colorMode(RGB);
  background(100,100,100);
  position = width/4;
  circleColor = color(255); 
  circleHighlight = color(204);
  circleX = width/2+circleSize/2;
  circleY = height/2;
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
  
  muneco = new DeathMan();
 
}


void draw() {
  
    update(mouseX, mouseY);
    background(100,100,100);
    textSize(23);
    fill(255, 255, 255);
    textAlign(CENTER, BOTTOM);
    text(myText,width/2,height);
    text(input,width/2,height/2+150);
    
    for (int i = 0; i < numberLetters; i++) {
    //text(letters[i],width/3+(i*23),height/4);
    strokeWeight(3);
    line(width/3+(i*23)-(textWidth(letters[i])/2)-position, height/2, width/3+(i*22)+(textWidth(letters[i])/2)-position,height/2); 
    }
    
    for (int i=0; i<numberLetters; i++){
      if (check[i]==1){
          textSize(23);
          fill(255, 255, 0);
          text(letters[i],width/3+(i*23)-position,height/2-10); 
      } else {
        }
    }

    if (win){
      Try=0;
    }
    
    if (lose){
      sum=0;
    }
    
    mouseOverCircle();
    circleReset();
    gameOver();
    youWin();
    muneco.update(Try,win);
    muneco.display();
    
}



void keyPressed() {
  
  if (lose==false){
  
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
  
  } else if (lose == true) {
    
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
    
    win=false;
    lose=false;

  }
}

void gameOver(){
  
      if (Try==12) {
     textSize(60);
     fill(30,200,125);
     text("YOU LOSE",width/2,height/4);
     lose=true;
     win=false;
    }
    
}

void youWin(){
  
   if (sum==numberLetters){
     textSize(60);
     fill(30,200,125);
     text("YOU WIN",width/2,height/4);
     win=true;
     lose=false;
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












class DeathMan {
  
  int posX = width/2+position+50;
  int posY = height/2-50;
  int bodyParts;
  boolean happyFace;
  
  DeathMan () {
  }
  
  void update(int tempBodyParts,boolean tempHappyFace) {
    bodyParts = tempBodyParts;
    happyFace = tempHappyFace;
  }
  
  void display() {
    
    int parts = bodyParts;
    
    
    if (parts==1) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
    } else if (parts==2) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
    }  else if (parts==3) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
    } else if (parts==4) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
    } else if (parts==5) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
    } else if (parts==6) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
    } else if (parts==7) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
    } else if (parts==8) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
      line(posX,posY+((100-25)/2)+65,posX+25,posY+75+65);  //legs
    } else if (parts==9) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
      line(posX,posY+((100-25)/2)+65,posX+25,posY+75+65);  //legs
      line(posX+100,posY-65,posX+100,posY+160);
    } else if (parts==10) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
      line(posX,posY+((100-25)/2)+65,posX+25,posY+75+65);  //legs
      line(posX+100,posY-65,posX+100,posY+160);
      line(posX+100,posY-65,posX,posY-65);
    } else if (parts==11) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
      line(posX,posY+((100-25)/2)+65,posX+25,posY+75+65);  //legs
      line(posX+100,posY-65,posX+100,posY+160);
      line(posX+100,posY-65,posX,posY-65);
      //arc(posX, posY+5, 25, 25, 0, PI, CHORD);//  happy
      arc(posX, posY+15, 25, 25, PI, 2*PI, CHORD);//  happy
      strokeWeight(2);
    } else if (parts==12) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      line(posX,posY+25,posX,posY+100);    //body
      line(posX,posY+((100-25)/2),posX-25,posY+75);  //arms
      line(posX,posY+((100-25)/2),posX+25,posY+75);  //arms
      line(posX,posY+((100-25)/2)+65,posX-25,posY+75+65);  //legs
      line(posX,posY+((100-25)/2)+65,posX+25,posY+75+65);  //legs
      line(posX+100,posY-65,posX+100,posY+160);
      line(posX+100,posY-65,posX,posY-65);
      //arc(posX, posY+5, 25, 25, 0, PI, CHORD);//  happy
      arc(posX, posY+15, 25, 25, PI, 2*PI, CHORD);//  happy
      strokeWeight(2);
      arc(posX, posY-15, 70, 100, PI+HALF_PI , 2*PI+HALF_PI);
    } else if (happyFace) {
      noFill();
      strokeWeight(3);
      ellipse(posX,posY,50,50);  //Head
      line(posX-10,posY,posX-10,posY-10);  //eyes
      line(posX+10,posY,posX+10,posY-10);  //eyes
      arc(posX, posY+5, 25, 25, 0, PI, CHORD);//  happy
    } 
    
    
  }
  
}


