
void setup() {
  size(300, 300);
  background(0);
  fill(255);
  textSize(18);
  textAlign(CENTER);
  text("Google先生、今何時ですか？", width/2, height/2);
}

void mousePressed() {
  link("http://www.google.co.jp/search?hl=ja&rls=en&q=time", "_new");
}
