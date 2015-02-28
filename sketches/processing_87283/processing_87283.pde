
String [ ] test1 = new String [5];
String [ ] test2 = new String [5];

void setup() {
  background(255);
}

void make() {
  for (int i;i < 5;i ++) {
    test1[i] = int(random(100)) + "";
  }
  saveStrings("deta.txt",test1);
}

void keyPressed() {
  if (key == ' ') {
    make();
  }
}

void draw() {
  background(255);
  test2 = loadStrings("deta.txt");
  fill(0);
  text(test2[0]+","+test2[1]+"\n"+test2[2]+","+test2[3]+"\n"+test2[4],10,10);
}
