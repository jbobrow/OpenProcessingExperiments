
/*
Jenny McCarthy (2/25/14)
Using an array to print something
*/

float[] potatoes = new float [70];

void setup(){
  size(100,100);
  noLoop();
}

void draw(){
  for (int i = 0; i < 70; i++){
    potatoes [i] = random(0,25);
    println("dinner = " + potatoes [i] + " yummy potatoes");
  } 
}



