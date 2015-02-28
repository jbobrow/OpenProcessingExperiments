
//Wave

void setup() {
  size(500, 500); //サイズ指定
  colorMode(HSB, 100); //カラーモードをHSBに指定
  background(99); //背景を白に
  fill(99); //塗りを白に
  smooth(); //線を滑らかに
  strokeWeight(7); //線の太さを７に
}

void draw() {
  
  for(int i = 0; i < 4; i++) {
    //波(上)1
    stroke(55, 100, 100);
    arc(0 + 165 * i, 160, 160, 165, 0, PI);
    arc(0 + 165 * i, 160, 130, 135, 0, PI);
    arc(0 + 165 * i, 160, 100, 105, 0, PI);
    arc(0 + 165 * i, 160, 70, 75, 0, PI);
    arc(0 + 165 * i, 160, 40, 45, 0, PI);
}
  
  for(int i = 0; i < 3; i++) {
    //波(上)2
    stroke(60, 100, 100);
    arc(85 + 165 * i, 120, 160, 165, 0, PI);
    arc(85 + 165 * i, 120, 130, 135, 0, PI);
    arc(85 + 165 * i, 120, 100, 105, 0, PI);
    arc(85 + 165 * i, 120, 70, 75, 0, PI);
    arc(85 + 165 * i, 120, 40, 45, 0, PI);
}
  
  for(int i = 0; i < 4; i++) {
    //波(上)3
    stroke(65, 100, 100);
    arc(0 + 165 * i, 80, 160, 165, 0, PI);
    arc(0 + 165 * i, 80, 130, 135, 0, PI);
    arc(0 + 165 * i, 80, 100, 105, 0, PI);
    arc(0 + 165 * i, 80, 70, 75, 0, PI);
    arc(0 + 165 * i, 80, 40, 45, 0, PI);
}
  
  for(int i = 0; i < 3; i++) {
    //波(上)4
    stroke(55, 100, 100);
    arc(85 + 165 * i, 40, 160, 165, 0, PI);
    arc(85 + 165 * i, 40, 130, 135, 0, PI);
    arc(85 + 165 * i, 40, 100, 105, 0, PI);
    arc(85 + 165 * i, 40, 70, 75, 0, PI);
    arc(85 + 165 * i, 40, 40, 45, 0, PI);
}
  
  for(int i = 0; i < 4; i++) {
    //波(上)5
    stroke(60, 100, 100);
    arc(0 + 165 * i, 0, 160, 165, 0, PI);
    arc(0 + 165 * i, 0, 130, 135, 0, PI);
    arc(0 + 165 * i, 0, 100, 105, 0, PI);
    arc(0 + 165 * i, 0, 70, 75, 0, PI);
    arc(0 + 165 * i, 0, 40, 45, 0, PI);
}
  
  for(int i = 0; i < 3; i++) {
    //波(下)1
    stroke(65, 100, 100);
    arc(85 + 165 * i, 260, 160, 165, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 260, 130, 135, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 260, 100, 105, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 260, 70, 75, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 260, 40, 45, TWO_PI-PI, TWO_PI);
}
  
  for(int i = 0; i < 4; i++) {
    //波(下)2
    stroke(55, 100, 100);
    arc(0 + 165 * i, 300, 160, 165, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 300, 130, 135, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 300, 100, 105, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 300, 70, 75, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 300, 40, 45, TWO_PI-PI, TWO_PI);
}

  for(int i = 0; i < 3; i++) {
    //波(下)3
    stroke(60, 100, 100);
    arc(85 + 165 * i, 340, 160, 165, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 340, 130, 135, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 340, 100, 105, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 340, 70, 75, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 340, 40, 45, TWO_PI-PI, TWO_PI);
}

  for(int i = 0; i < 4; i++) {
    //波(下)4
    stroke(65, 100, 100);
    arc(0 + 165 * i, 377, 160, 165, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 377, 130, 135, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 377, 100, 105, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 377, 70, 75, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 377, 40, 45, TWO_PI-PI, TWO_PI);
}

  for(int i = 0; i < 3; i++) {
    //波(下)5
    stroke(55, 100, 100);
    arc(85 + 165 * i, 420, 160, 165, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 420, 130, 135, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 420, 100, 105, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 420, 70, 75, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 420, 40, 45, TWO_PI-PI, TWO_PI);
}

  for(int i = 0; i < 4; i++) {
    //波(下)6
    stroke(60, 100, 100);
    arc(0 + 165 * i, 470, 160, 165, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 470, 130, 135, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 470, 100, 105, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 470, 70, 75, TWO_PI-PI, TWO_PI);
    arc(0 + 165 * i, 470, 40, 45, TWO_PI-PI, TWO_PI);
}

  for(int i = 0; i < 3; i++) {
    //波(下)7
    stroke(65, 100, 100);
    arc(85 + 165 * i, 500, 160, 165, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 500, 130, 135, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 500, 100, 105, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 500, 70, 75, TWO_PI-PI, TWO_PI);
    arc(85 + 165 * i, 500, 40, 45, TWO_PI-PI, TWO_PI);
}

    save("0812034.png");
}

