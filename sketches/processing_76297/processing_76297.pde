
float Arr[] = new float[5];
int si = 50;

void setup() {
  size(600, 200);
  for(int i = 0; i < 5; i++) {
    float randomf = (int)random(255);
    Arr[i] = randomf;
  }
  noStroke();
}

void draw() {  
  background(255);
  for(int i = 0; i < 5; i++) {
    fill(Arr[i]);
    ellipse(i*100 + 100, 100, 50*sin(si*0.03) + 100, 
    50*sin(si*0.03) + 100);
    if (Arr[i] < 256) {
      Arr[i] = Arr[i] + 1;
    }
    else Arr[i] = 0;
  }
  si++;
}
