
int body;
PImage a;  
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;

PFont words;


void setup() {
  size(350, 500);
  body = 0;
 words = loadFont("AmericanTypewriter-48.vlw");
 textFont(words, 14);
  a = loadImage("Scan 4.jpeg"); 
  b = loadImage("Scan 5.jpeg");
  c = loadImage("Scan 6.jpeg");
  d = loadImage("Scan 8.jpeg");
  e = loadImage("Scan 10.jpeg");
  f = loadImage("Scan 11.jpeg");
  g = loadImage("Scan 12.jpeg");
  h = loadImage("Scan 14.jpeg");
  i = loadImage("Scan 15.jpeg");
  j = loadImage("Scan 16.jpeg");  
  
}

void draw() {

fill(0);

  switch(body) {
  case 0:
     image(a, 0, 0);
     
      text("i dont like my body. can you help fix me? press Q to make my boobs bigger", 50, 350, 200, 200);
     break;
  case 1:
     image(b, 0, 0);  
    text("i'm too fat, press W to make me skinny", 50, 350, 200, 200);
     break;
  case 2:
    image(c, 0, 0);
   text("i need to be skinnier, press E please.", 50, 350, 200, 200);
    break;
  case 3:
   image(d, 0, 0);
   text("still too fat!! press R.", 50, 350, 200, 200);
    break;
  case 4:
   image(e, 0, 0);
      text("thanks, thats better. my boobs could use some more work, press T please.", 50, 350, 200, 200);
    break;
  case 5:
   image(f, 0, 0);
       text("my lips are too thin, press Y for lip injections.", 50, 350, 200, 200);
   break;
  case 6:
   image(g, 0, 0);
   text("i need a face lift, press U.", 50, 350, 200, 200);
   break;  
  case 7:
   image(h, 0, 0);
  text("can you fix my nose too? press I for a nose job.", 50, 350, 200, 200);
   break;
  case 8:
   image(i, 0, 0);
   text("i think i could use a browlift too. press O please.", 50, 350, 200, 200);
   break;
  case 9:
   image(j, 0, 0);
 text("thats much better! thanks! (you can press 1 to start from the beginning)", 50, 350, 200, 200);
   break; 
    
  }
}
void keyPressed() {
  switch(key) {
  case 'q':
    body = 1;
    break;
  default:
    body = 0;
    break;
  case'w':
    body = 2;
    break;
  case'e':
    body = 3;
    break;
  case'r':
    body = 4;  
    break;
  case't':
    body = 5;
    break;  
  case'y':
    body = 6;
    break;
  case'u':
    body = 7;
    break;
  case'i':
    body = 8;
    break;
  case'o':
    body = 9;
    break;
  case'1': 
    body = 0;
    break;
  }
}


