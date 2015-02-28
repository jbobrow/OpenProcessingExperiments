
//Kim Sipkens, Wed. Class
//PS1, Question 5
//Checker Board

void setup()  {
size (280, 280);
  smooth();
}

void draw () {
  for(int i=0; i < 280; i += 35) {
    for (int x = 0; x < 280; x += 35)
    {
      if((i+x)%2==0) {
        fill(0);
      }else {
        fill(255);
      }
      rect(i, x, 50,50);
    }
  }
} 


