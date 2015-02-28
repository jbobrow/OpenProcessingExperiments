
//But, we should use for loops to make things, like the classic grid example
void setup() {
  size(500, 500);
}


void draw() {

  for (int i = 0; i < 10; i = i + 1) { // so here we draw from y = 0 to y = height
    line(i * 50, 0, i * 50, height);   // incrementing along the x axis every 50
    println("i is equal to:  " + i);   // pixels
  }

  for (int i = 0; i < 10; i = i + 1) { // and here we draw from (wi
    line(0, i * 50, width, i * 50);
    println("i is equal to:  " + i);
  }
  
  //notice we can use the iterator variable 'i' over again, as it is declared in
  //the forLoop, it is only local to the specific forLoop it is created in
  
}





