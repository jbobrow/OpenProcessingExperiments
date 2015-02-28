

ArrayList primes = new ArrayList();
int current = 5;
int gap = 5;
int skip = 0;
int vert = height;
boolean scroll = true;
int updateRate = 1;
color oneColor = color(0, 0, 0);
color zeroColor = color(255, 255, 255);

void setup(){
  size(900, 400);
  fill(0);
  vert = height;
  background(color(255,255,255));
  primes.add(2);
  primes.add(3);
  PFont font = loadFont("CourierNew-12.vlw");
  textFont(font);
  textSize(12);
  binaryPrint();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      if(vert > 1){
        vert --;
      }
    }
    if(keyCode == DOWN){

      if(vert < height){
        vert++;
      }
    }
    if(keyCode == LEFT){
      gap --;
    }
    if(keyCode == RIGHT){
      gap++;
    }
  }
  if(key == 'm'){
    if(skip + 1 < primes.size()){
      skip ++;
    }
  }
  if(key == 'M'){
    if(skip > 0){
      skip--;
    }
  }
  if(key == 'u'){
    if(updateRate > 1){
      updateRate--;
    }
  }
  if(key == 'U'){
    updateRate ++;
  }
  if(key == ' '){
    scroll = !scroll;
  }
  if(key == 'c'){
    oneColor = color((int)random(256), (int)random(256), (int)random(256));
    zeroColor = color((int)random(256), (int)random(256), (int)random(256));
  }
  if(key == 'C'){
    oneColor = color(0, 0, 0);
    zeroColor = color(255, 255, 255);
  }
  binaryPrint();
}

void draw(){
  if(isPrime(current)){
    primes.add(current);
    current += 2;
    if(primes.size() % updateRate == 0){
      binaryPrint();
    }
    if(isPrime(current)){
      primes.add(current);
      current += 4;
      if(primes.size() % updateRate == 0){
        binaryPrint();
      }
    }
    else{
      current += 2;
    }
  }
  else{
    current += 2;
  }
}

void drawWords(){
  String[] words = new String[]{
    "Auto-Scroll: " + scroll,
    "Update Rate: " + updateRate,
    "Separation: " + gap,
    "Skip first: " + skip,
    "Height: " + vert,
  };
  for(int i=0; i<words.length; i++){
    text(words[i], width - (words[i].length() * 8), height - (12*(i+1)));
  }
}

boolean isPrime(int x){
  for(int i=0; i<primes.size() && ((Integer)(primes.get(i))) <= sqrt(current); i++){
    if(current % ((Integer)(primes.get(i))) == 0){
      return false;
    }
  }
  return true;
}

void binaryPrint(){
  background(255, 255, 255);
  int x = 0;
  int y = 0;
  int base = 0;
  int temp = (Integer)(primes.get(primes.size() - 1));
  while(temp > 0){
    base++;
    temp/=2;
  }
  if(scroll){
    skip = max(0, primes.size() - (vert * (width/(base + gap))));
  }
  for(int i=skip; i<primes.size(); i++){
    temp = (Integer)(primes.get(i));
    String bin = "";
    for(int j=1; j<=base; j++){
      bin = (temp % 2) + bin;
      temp /= 2;
    }
    for(int j=0; j<bin.length(); j++){
      if(bin.charAt(j) == '1'){
        stroke(oneColor);
      }else{
        stroke(zeroColor);
      }
      point(x + j, y);
    }
    y++;
    if(y >= vert){
      y = 0;
      x += base + gap;
    }
  }
  drawWords();
}




