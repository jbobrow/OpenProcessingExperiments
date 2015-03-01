
//forLoop Circles, jeg
//Sandbox #1

/*Variables give us a great deal of flexibility. We try to write 
our code so that by changing the value of one variable we can 
change the output/behaviour of the program. In this example, all 
the code is related to the single variable 'size'
*/

float ellSize = 20; //we can change this variable . . .

void setup(){
  size(500, 500);
}

void draw(){
  for(int i = 0; i < width/ellSize; i++){
    for(int j = 0; j < height/ellSize; j++){
      ellipseMode(CORNER);
      ellipse(ellSize * i, ellSize * j, ellSize, ellSize);
    }
  }
}
