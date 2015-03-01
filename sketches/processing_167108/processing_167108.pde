
//Triying straight lines. I embedded a for loop inside the 
//other to get the number of repetitions were multiplied
void setup(){
  size(800, 200);
  background(0);
}


void draw(){
 
  for( int a= 0; a<=width; a+= 10){
    for( int b= 100; b<= height; b+= 10){
       strokeWeight(2);
       stroke(6, 160, 151);
       line(a,0, a, height);
       stroke(232, 14, 156, 20);
       line(0, b, width, b);
  } 
  }
}



