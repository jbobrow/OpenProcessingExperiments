
PFont f;
String message = "Hello to a world where each character is written individually.  ";
int maxH=100, minH=12, l=0, baseline = 0;

void setup() {
  size(450, 150);
  f = createFont("Arial",20,true);
  l = message.length(); 
  baseline = height - 20;
}

void draw() {
  int c = 0; 
  if (l>0) c = (int)( mouseX * l / width ); 
  //System.out.println("MouseX "+mouseX+" <"+c+"> "+ message.charAt(c)); 
  background(255);
  fill(0);
  textFont(f);         
  int x = 5;
  int cHoch = minH; 
  for (int i = 0; i < message.length(); i++) {
    cHoch = (int)(maxH/(abs(i-c)+1));
    // System.out.println(i+" "+ message.charAt(i) + " "+ cHoch); 
    textSize( max( minH, cHoch));
    text(message.charAt(i), x, baseline);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
  }
  
}


