
boolean [] numbers;

void setup() {
  background(255);
  size(600, 600);
  numbers = new boolean[360000];
 
  for (int i=2; i<360000; i++) {

    if (isPrime(i)) {
      rect(i%600, i/600,1,1);
      numbers[i]=true;
    }
    else
          numbers[i]=false;

  }
} 



void draw() {

  println("this number stands for: "+ ( mouseX%600 + mouseY*600));

  
  println(frameRate);
}
boolean isPrime(int n) {
  for (int i=2; i<n; i++) {
    if (n%i==0) {
      stroke(0,0,0);
      return false;
    }
  }
  return true;
}

void keyPressed() {
  saveFrame();
}




