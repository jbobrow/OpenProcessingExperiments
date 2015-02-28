
//Ana Vlajnic
//Period 5

Square [] [] matrix; 
int [] myNumbers = new int [100];  
PFont font;
int temp;
int col = 10; 
int row = 10; 
int insert; 
int num = 1; 

void setup () {
  size (400, 500); 
  font = createFont("Arial", 20, true);
  matrix = new Square [col] [row];
  
  for (int k = 0; k < col; k++) {
    for (int l = 0; l < row; l++) {
      matrix [k][l]= new Square (k*40, l*40, 40, 40, 30); 
    }
  }
  
  for (int i = 0; i < 100; i++) {
    myNumbers[i] = i;
  }
  shuffle(myNumbers);
} 
 
void draw () {
  frameRate(20); 
  background (0);
  
  fill(255, 255, 255);
  textFont(font, 24);
  text("Insertion Sort: Color Edition", 55, 450);
  
  fill(205, 205, 205);
  textFont(font, 16);
  text("Ana Vlajnic", 155, 475);
  
  for (int k = 0; k < col; k++) {
    for (int l = 0; l < row; l++) {
      matrix [k][l].setColor(myNumbers[l + k*row]*2); 
      matrix [k][l].display();
    }
  }
 
  if (num < myNumbers.length) {
    int moveItem = num;  
    int insert = myNumbers[num]; 
    
    while (moveItem > 0 && myNumbers[moveItem - 1] > insert) {
      myNumbers[moveItem] = myNumbers[moveItem - 1]; 
      moveItem=moveItem - 1;
    } 
 
    myNumbers[moveItem] = insert;  
    num++;
  } 
}


class Square {
  float x, y;  
  float w, h;  
  color c;
 
  Square (float xpos, float ypos, float tempw, float temph, color tempc) {
    x=xpos;
    y=ypos;
    w=tempw;
    h=temph;
    c=tempc;
  } 
  
  void setColor( int col)  {
    c = col; 
  } 
   
  void display () { 
    stroke (0);  
    strokeWeight (1); 
    fill (c);  
    rect (x, y, w, h); 
  } 
} 
 
void shuffle(int[] a) {
  int temp; 
  int pick; 
  for (int i = 0; i < a.length; i++) { 
    pick  = (int)random(a.length); 
    temp = a[i]; 
    a[i] = a[pick]; 
    a[pick]= temp; 
  }
}
 


