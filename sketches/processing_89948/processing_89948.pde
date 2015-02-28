
/*Super Collider
 by Alex Pilkevych
 */
 Atom [] atom = new Atom[100];
 
void setup() {
  size(700, 500);
  smooth();
  for(int i=0; i<atom.length; i++){
  atom[i] = new Atom();
  }
}

void draw() {
  background(#FFC4C4);
  int i=0;
    for(int time = 0; millis()>time; time+=3000){
  
  atom[i].atomR();
  atom[i].atomL();
  
  i++;
  }
  
      for(i = 0; i<atom.length; i++){
  atom[i].collider();
  atom[i].score(i);
  }
}


class Atom {
//General 
float score;
float skipScore = 0;
float colWid = 40;
float r = 10;
float trans = 300;
//AR
float ARxloc = 700+r;
float ARyloc = random(r, 500-r);
int ARcolor = int(random(6));
float block1 = 350;
//AL
float ALxloc = r*-1;
float ALyloc = random(r, 500-r);
int ALcolor = int(random(6));
float block2 = 350;
int i;



void collider() {
  stroke(0);
  line(width/2, 0, width/2, height);
  fill(252, 97, 0);
  stroke(0);
  rectMode(CENTER);
  rect(width/2, mouseY, colWid, colWid);
}


void atomL() {
stroke(0,trans);
//ARcolor

  switch (ALcolor) {
  case 7: 
    fill(255, 0, 0,trans); 
    break;
  case 8: 
    fill(0, 255, 0,trans); 
    break;
  case 0: 
    fill(0, 0, 255,trans); 
    break;
  case 1: 
    fill(255, 255, 0,trans); 
    break;
  case 2: 
    fill(0, 255, 255,trans); 
    break;
  case 3: 
    fill(255, 0, 255,trans); 
    break;
  case 4: 
    fill(255, 255, 255,trans); 
    break;
  case 5: 
    fill(0, 0, 0,trans); 
    break;
  case 6: 
    fill(100, 100, 50,trans); 
    break;
  }  
  //ALcatch
    boolean state2 = false;
  if (ALxloc<width/2 && mousePressed && ALyloc<mouseY+colWid/2 && ALyloc>mouseY-colWid/2 && mouseX < width/2) {
    state2 = true;
  } else { state2 = false;}
  
  if (ALxloc<block2) {
    if (state2 == false) {
      ALxloc++;
    } 
    else if (state2 == true) {
      ALxloc=width/2-colWid/2; 
      block2 = width/2-colWid/2;
    }
  }
  
  if(block2 == width/2-colWid/2){
    ALyloc = mouseY;
  }
  
  if(ALxloc==width/2){
    ALxloc = -20;
    score--;
  }
  ellipse(ALxloc, ALyloc, r*2, r*2);
}

void atomR() {
stroke(0,trans);
//ARcolor

  switch (ARcolor) {
  case 7: 
    fill(255, 0, 0,trans); 
    break;
  case 8: 
    fill(0, 255, 0,trans); 
    break;
  case 0: 
    fill(0, 0, 255,trans); 
    break;
  case 1: 
    fill(255, 255, 0,trans); 
    break;
  case 2: 
    fill(0, 255, 255,trans); 
    break;
  case 3: 
    fill(255, 0, 255,trans); 
    break;
  case 4: 
    fill(255, 255, 255,trans); 
    break;
  case 5: 
    fill(0, 0, 0,trans); 
    break;
  case 6: 
    fill(100, 100, 50,trans); 
    break;
  }
  
  //ARcatch
    boolean stat = false;
  if (ARxloc>width/2 && mousePressed && ARyloc<mouseY+colWid/2 && ARyloc>mouseY-colWid/2 && mouseX > width/2) {
    stat = true;
  } else { stat = false;}
  
  if (ARxloc>block1) {
    if (stat == false) {
      ARxloc--;
    } 
    else if (stat == true) {
      ARxloc=width/2+colWid/2; 
      block1 = width/2+colWid/2;
    }
  }
  
  if(block1 == width/2+colWid/2){
    ARyloc = mouseY;
  }
  
  if(ARxloc==width/2){
    ARxloc = -20;
    score--;
  }
  
  ellipse(ARxloc, ARyloc, r*2, r*2);
}


//////////////////////////////
void score(int tempI){

 if(ALyloc == ARyloc && ALyloc == mouseY && skipScore == 0 && ALcolor == ARcolor){
   ALcolor = 8;
   ARcolor = 8;
  score++;
  skipScore = 1;
 } else if(ALyloc == ARyloc && ALyloc == mouseY && skipScore == 0 && ALcolor != ARcolor){
      ALcolor = 7;
   ARcolor = 7;
  score--;
  skipScore = 1;
 }
   i = tempI;
  if(ALyloc == ARyloc || mousePressed && mouseButton == RIGHT && (ALyloc == mouseY || ARyloc == mouseY)){
   atom[i].animateL();
   atom[i].animateR(); 
  text("works",60,60);
  }
 fill(0);
 text(score,50,50);
}


void animateL(){
 ALxloc+=-9; 
 trans-=10;
}
void animateR(){
 ARxloc+=9; 
 trans-=10;
}
}
