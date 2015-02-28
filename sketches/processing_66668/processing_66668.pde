

int [] myArray;



void setup() {

  size(500, 500);


  myArray = new int [5];

  myArray[0]=50;
  myArray[1]=50;
  myArray[2]=50;
  myArray[3]=50;
  myArray[4]=50;
}


void draw() {
  background(20, 50, 60);

  for (int i=0; i<myArray.length; i++) {
    
    rect(i*70, 100, myArray[i], myArray[i]);



    if (mousePressed && mouseX >i*70 && mouseX < (i*70)+myArray[i] && mouseY>100 && mouseY < 150) {
       rect(i*70, 100, myArray[i]++, myArray[i]);
    }
  }
}


