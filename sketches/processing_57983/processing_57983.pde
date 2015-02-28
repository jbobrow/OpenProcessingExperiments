
void setup(){
  size(550,475);
  int[] circlex = new int[6];
  int[] circley = new int[5];
  println("hello");
  for(int x = 0; x < 7; x++){
    println("hello2");
    for(int y = 0; y < 6; y++){
      println("hello3");
      circlex[x] = (x+1)*75-25;
      circley[y] = (y+1)*75-25;
      fill(255);
      ellipse(circlex[x],circley[y],50,50);
      println(circlex[x]);
      println(circley[y]);
    }
  }
  
  
  
}
