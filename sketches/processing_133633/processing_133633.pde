
ArrayList <Heart> hearts;

int acc = 1;
int speed = 1;
int h = 0;
int score, time;
boolean shoot;
boolean go = true;
float hits;
float shots;
PFont f;

void setup() {
  PFont.list();
  f = createFont("AvenirNext-Regular",24);  
  textFont(f);
  size(600,600);
  hearts = new ArrayList<Heart>(); 
  noCursor(); 
}

void draw() {
  background(204);
  stroke(0,0,0,0); //stroke(v1, v2, v3, alpha)
  frameRate(30);
  
  if(go) {
    prodH(); //generatore di cuori
    fallH(); // caduta dei cuori
    attack();  //attacco cuori
    display();  //disegna cuori
    outH(); //controllo uscita canvas cuori
    levelUp(); //funzione sali di livello

    textFont(f, 15);
    text("Broken hearts: "+ score, 10, 30);
    text("Love power: " + h, 10, 50);

    time++;
    
  } else {
    textFont(f,40);
    text("Love wins",10,40);
    textFont(f,20);
    text("Broken hearts: " + score,10,70);
  }
 shoot = false;
}

void mousePressed() {
  shoot = true;
  shots ++;
}

void prodH() {     
  if(time == 30) { 
    time = 0;
    Heart hh = new Heart(int(random(100,width-80)), int (15), speed, h);
    hearts.add(hh);
    hh = null;
    acc++;
  }
}

void fallH() {
    for(int i = 0; i < hearts.size(); i++) {
    Heart hh = (Heart)hearts.get(i);
    hh.fall();
    hh = null;
  }

}
  
void display(){
  for(int i = 0; i < hearts.size(); i++){
    Heart hh = (Heart)hearts.get(i);
    hh.display();
    hh = null;
  }
  fill(60);
  rect(mouseX-20,height-20,40,height); //navicella
  
  if(shoot){
    stroke(60);
    for(int i = 1; i < height; i++) {
      ellipse(mouseX, height-(height/i*5),3,3);

      }    

  }
  }


void attack() {
  if(shoot) {
    for(int i = 0; i < hearts.size(); i++) {
      Heart hh = (Heart) hearts.get(i);
      if(mouseX < hh.x + hh.r && mouseX > hh.x - hh.r) {
        hh.h -= 1;
        if(hh.h <= 0) {
          hh = null;
          hearts.remove(i); 
        }
        score ++;
      }
    }   
  } 
}

void outH(){
  for(int i = 0; i < hearts.size(); i++) {
    Heart hh = (Heart) hearts.get(i);
    if(hh.y > height) {

    go = false;  
  }
}
}


void levelUp() {
  if(speed < 8 && acc >= 10) speed = acc/10;
  if(h < 4 && acc >= 10)h = int(acc/10); 
  

}

//__________________________________________________________

class Heart {
  int x, y, r, hmax, h;
  float speed;
  
  Heart(int x, int r, float speed, int h) {
    this.x = x;
    this.r = r;
    this.speed = speed;
    this.hmax = hmax;
    this.h = h;
  }
  
  void fall(){
    y += speed;
  }
  
  void display(){
 
    fill(255,(100-255/height)*h*0.7,(100-255/height)*h*0.7);

    beginShape();
    vertex(x, y); 
    bezierVertex(x, y-20, x+40, y-10, x, y+25); 
    vertex(x, y); 
    bezierVertex(x, y-20, x-40, y-10, x, y+25); 
    endShape();

  }
}
