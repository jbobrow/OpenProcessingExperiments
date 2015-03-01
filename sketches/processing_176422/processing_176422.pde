
float x1, y1, rad1;
int deg = 0;
PImage img;
boolean click = false;

int numberProverb=0;
String[] prov = {"Relax, nothing is under control.",
"O problema é que você pensa que tem tempo.",
"Aprendre a perdre el temps conscientment.",
"Let go or be dragged.",
"Must to learn to waste time conscientiously.",
"Algunes coses porten el seu temps.",
"Knock on the sky and listen to the sound.",
"Golpea no ceo e escoita o som.",
"Cuando vives en el momento presente, cualquier lugar es tu hogar.",
"The trouble is you think you have time.",
"O infinito esta no finito de cada instante.",
"Some things take time.",
"Be patient. Everything comes to you in the right moment.",
"The time you enjoy wasting is not wasted time.",
"Te paciència, tot ve a tu en el moment adequat.",
"Quan vius en el moment present, qualsevol lloc és la teva llar.",
"The infinite is in the finite of every instant."};

String randomProverb = prov[int(random(prov.length))];
String randomProverb2 = prov[int(random(prov.length))];
String randomProverb3 = prov[int(random(prov.length))];
String randomProverb4 = prov[int(random(prov.length))];
String randomProverb5 = prov[int(random(prov.length))];

boolean mClicked; 

int timer;

void setup(){
  size(640, 360);
  smooth();
  frameRate(12);
  img = loadImage("play.png");
  background (0);
  textAlign(CENTER);
  textSize(15);
  image(img, width/2-5, height/2-10);
  timer = 0;

}

void draw(){
  if (mClicked){
    fill(0, 60);
    rect(0, 0, width, height);
    loading();
  }
  
for (int i=0;i<prov.length;i++) {
   if (mClicked){
      if (millis() - timer >= 30000) {
        text(randomProverb, width/2, height/2+130);
      }
      
      if (millis() - timer >= 70000) {
        fill(0);
        stroke(0);
        rect(0,250,width, 250);
      }
      if (millis() - timer >= 85000) {
        fill(255);
        text(randomProverb2, width/2, height/2+130);
      }
      
      if (millis() - timer >= 150000) {
        fill(0);
        stroke(0);
        rect(0,250,width, 250);
      }

      if (millis() - timer >= 165000) {
        fill(255);
        text(randomProverb3, width/2, height/2+130);
      }
      
      if (millis() - timer >= 230000) {
        fill(0);
        stroke(0);
        rect(0,250,width, 250);
      }

      if (millis() - timer >= 255000) {
        fill(255);
        text(randomProverb4, width/2, height/2+130);
      }
      
      if (millis() - timer >= 280000) {
        fill(0);
        stroke(0);
        rect(0,250,width, 250);
      }

      if (millis() - timer >= 300000) {
        fill(255);
        text(randomProverb5, width/2, height/2+130);
      }
      
      if (millis() - timer >= 320000) {
        fill(0);
        stroke(0);
        rect(50,250,width, 250);
      }

    timer = millis();
  }
  timer = 0;
  }
}

void loading(){
    deg = deg + 40;
    rad1 = (PI/160)*deg;
    x1 = sin(rad1)*11 + (width/2);
    y1 = cos(rad1)*11 + (height/2);
    stroke(255,100);
    fill(255);
    ellipse(x1, y1, 7, 7);
}

 void mouseClicked() {
      mClicked = true;
}

void mouseReleased() {
      mClicked = false;
} 

