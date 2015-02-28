
void setup(){
  size(400,400);
  background(200, 200, 0);
}

void draw(){
//while loop
//int i=0; //initialize
//while (i< height/2){ //test
//  line(50, i, 100, 1); 
//  rect(i, i, 30, 30);
  
//  i = i + 10;

//the same...?

for (int i = 0; i < height/2; i+=10){ //initialize and test in one line
  line(50, i, 100, 1);
  rect(i, i, 30, 30);

}
//}
}

//These produce the same image. Important difference is where the variable i is declared.
//If i is called outside the forloop it will not be found.
