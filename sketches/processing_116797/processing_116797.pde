
PFont font1;
String[] s1 = { "I am", "You are"};
int random1 = int(random(s1.length)); 
String[] s2 = { "not", " "};
int random2 = int(random(s2.length));  
String[] s3 = { "ugly", "happy","upset","bad person","sad" };
int random3 = int(random(s3.length));


  // Prints one of the four words

int card = 0; 
float ra = random(255);
float ga = random(255);
float ba = random(255);
void setup() {
  size(720, 720);
font1 = loadFont("ACaslonPro-Bold-48.vlw");
  frameRate(30);
}
void draw() {

  background(0);


  float qwe = mouseX;
  float asd = map(qwe, 0, 720, 300, 0);
  float radius = asd;
  for (int deg = 0; deg < 360; deg += 15) {
    float angle = radians(deg);
    float x = 360 + (cos(angle) * radius);
    float y = 360 + (sin(angle) * radius);
    noStroke();
    fill(0);
    ellipse(x, y, 10, 10);

    for (int a = 0; a< 360; a += 15) {
      float b = radians(a);
      float z = 360 + (cos(b) * radius);
      float v = 360 + (sin(b) * radius);
      smooth();
      if (card == 0) {
        stroke(ra, ga, ba);
        fill(255);
        textFont(font1); 
    text(s1[random1], width/2 - 100, height/2);
        
      }
      else if (card ==1) {
        fill(255);
        stroke(ra, ba, ga);
        text(s2[random2], width/2 , height/2);
           
      } 
      else if (card ==2) {
        fill(255);
        stroke(ga, ra, ba);
         text(s3[random3], width/2 + 100, height/2);
      } 
     
  

      strokeWeight(0.5);
      line(x, y, z, v);
      smooth();
      stroke(0);
    }
  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 0;
  }
}



