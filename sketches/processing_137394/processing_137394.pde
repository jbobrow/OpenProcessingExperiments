
String word = "confused";
char[] letters;
PFont helvetica;
float angle;
float speed;

void setup(){
  size(1000,800);
  helvetica = createFont("Helvetica", 100); 
  letters = word.toCharArray();
}

void draw(){
  background(255);
  fill(0,0,0);
  textAlign(CENTER);
  translate(width/2,height/2);
  textFont(helvetica);
  float newa = map(mouseX, 0, width, -radians(25), radians(25));
  speed += newa * 0.05;
  speed *= 0.7;
  angle += speed;
  
  for(int i = 0; i < letters.length; i++){
    rotate(angle);
    text(letters[i], 0, 0);
    translate(textWidth(letters[i]),0);
  }
}


