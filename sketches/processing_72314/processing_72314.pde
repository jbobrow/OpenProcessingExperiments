
int flowerNum = 10;

float[] xn = new float [flowerNum];  //create x axis array
float[] yn = new float [flowerNum];  //create y axis array
float[] s= new float [flowerNum];    //create s array for size

void setup() {
  size(500, 500);

  int i = 0;
  while (i<flowerNum) {
    xn[i] = random(500);
    yn[i] = random(500);

    s[i] = random(50); 
    i++;
  }
}

void draw() {

  background(255);
  int i = 0;
  while (i<flowerNum) {
    line(xn[i], yn[i], xn[i]+0, yn[i]+100);
    fill(100, 80, 255); //colour circle blue
    ellipse(xn[i], yn[i], s[i], s[i]);
    fill(255, 0, 0);                        //add a red centre to flower
    ellipse(xn[i], yn[i], s[i]/3, s[i]/3);     //add a red centre to flower
    if (s[i] <100) {
      s[i] = s[i] + 0.2;
    }
//    else {
//     s[i] = 0;
//    }               // add these lines of code to repeat the growing process



    i++;
  }
}
