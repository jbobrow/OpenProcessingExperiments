
int tri1 = 0;
int tri2 = 20;
int tri3 = 40;
PFont font; //this creates a font variable we can use to plug in a font
int timer = 10;
int timeLast = 0;
int MC=0;
int MN=0;
int EN = 0;
int EC = 0;
int hit = 0;
int score = 0;
int give = 20;
int [] projx = new int [1000];
int [] projy = new int [1000];
int [] enex = new int [1000];
int [] eney = new int [1000];
void setup(){
  timeLast=second();
  size (1000,600);
  background (0,0,0);
  font = loadFont("Serif-48.vlw"); //this plugs a serif font into our font variable
  textFont(font, 32); //this designates our font as the font any text will use
}
void draw(){
   if (timer>0) { //this runs the game as long as the timer hasn't run out
    game(); //this runs a method we created called "game()"
  }
}
void game(){
  background (0,0,0);
   if (second()!=timeLast) { //this sees if a second has passed
    ES();
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }
  
  text("Timer: "+timer, 520, 50); //this draws the timer text and the timer variable
  text("Score: "+score, 320, 50); //this draws the score text and the score variable
  triangle(0,tri1,20,tri2,0, tri3);
  IM();
  IF();
  EM();
  EF();
}


void keyPressed() {
  if (key == 'w') {
    tri1-=5;
    tri2-=5;
    tri3-=5;
  }
  else if (key == 's') {
   tri1+=5;
   tri2+=5;
   tri3+=5;
  }
  else if (key == 'e') {
    FIRE();
  }
}
void ES(){
  int g = int(random(0,600));
  eney[EN] = g;
  enex[EN] = 1000;
  fill(255,255,255);
  ellipse (enex[EN],eney[EN],20,20);
  EN+=1;
}
void EM(){
 for (int j = 0; j<EN; j++){
  int gm = 0;
  while(gm<EN){
   ellipse (enex[gm],eney[gm],20,20); 
   gm+=1;
  }
 } 
} 
void FIRE(){
  projx [MC] = 20;
  projy [MC] = tri2;
  MC +=1;
  MN +=1;
}
void IM(){
  for (int i = 0; i < MN; i++){
    int hm = 0;
    while (hm<MC){
   ellipse (projx[hm],projy[hm],8,8);
   hm+=1;
    } 
}
}
void IF(){
  for (int j = 0; j< MN; j++){
   projx[j]+=5;
   hit = j;
   hitcheck();
}
}
void EF(){
  for (int g = 0; g<EN; g++){
   enex[g]-=5; 
   
  }
}
void hitcheck(){
  for (int h = 0; h<EN; h++){
 if (projx[hit] < enex[h]+give && projy[hit] >enex[h]-give){
   if(projy[hit]<enex[h]+give && projy[hit]>enex[h]-give)
   {
    score +=1;
   }
 }
}
}
