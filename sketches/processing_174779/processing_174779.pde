
//array
ball[] balls = new ball[5000];
int allballs = 0;

//kitty
boolean leftarm =false;
boolean rightarm=false;
boolean leftear=false;
boolean tail=false;
boolean rightear=false;
boolean stomach=false;
boolean head=false;
boolean mouse=false;
float mx;
float my;
float easing = 0.05;
float esize = 4.5;
int box = 10;
float leftearpos=430;
float rightearpos=565;
float lspeed=1;
float rspeed=1;
  float mousepos1 = 100;
  float mousepos2 = 210;
  float mousepos3 = 120;
float mspeed=1;
color c;

void setup() {
  size(1000, 800);
  smooth();
}
void draw() {
  background(255);
  
  
  
  fill(219, 216, 255);
  rect(0, 0, 1000, 800);
  fill(255, 226, 162);
  rect(0, 400, 1000, 400);
  
  balls[allballs] = new ball();

  
  allballs++ ;

  
  if (allballs >= balls.length) {
    allballs = 0; 
  }



  for (int i = 0; i < allballs; i++ ) { 
    balls[i].move();
    balls[i].display();
    balls[i].mousetouch();
  }
  //head
  fill(252, 194, 225); //kitty pink
  noStroke();
  ellipseMode(CENTER);
  ellipse(500, 200, 200, 150);
  noStroke();
  //body
  triangle(350, 600, 500, 200, 650, 600);
  //tail
  fill(0, 0, 0);
  //face
  ellipse(500, 210, 20, 10);
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }

  float distance = esize * 2;

  float mx1 = constrain(mx, 430, 450); // eye 1
  float my1 = constrain(my, 180, 200);  // eye 1
  float mx2 = constrain(mx, 550, 570); // eye 2
  float my2 = constrain(my, 180, 200);  // eye 2

  fill(0);
  ellipse(mx1, my1, 10, 20);
  ellipse(mx2, my2, 10, 20);

  //ARMS
  stroke(250, 159, 208);//dark kitty pink
  fill(252, 194, 225);
  //left arm
  if (mouseX > 420 && mouseX < 420+40 && mouseY > 430 && mouseY < 430+200 && mousePressed) {
    leftarm = true;
  } else {
    leftarm =false;
  }
  if (leftarm) {
    rect(420, 400, 40, 200, 30);
    fill(0, 0, 0);
    textSize(30);
    text("Meow!", 660, 150);
  } else {
    fill(252, 194, 225);
    rect(420, 430, 40, 200, 30);
  }

  //rightarm
  if (mouseX > 540 && mouseX < 540+40 && mouseY > 430 && mouseY < 430+200 && mousePressed) {
    rightarm = true;
  } else {
    rightarm =false;
  }
  if (rightarm) {
    rect(540, 400, 40, 200, 30);
    fill(0, 0, 0);
    textSize(30);
    text("Meow!", 660, 150);
  } else {
    fill(252, 194, 225);
    rect(540, 430, 40, 200, 30);
  }

  //tail
  noStroke();
  if (mouseX > 600 && mouseX < 600+70 && mouseY > 400 && mouseY < 400+200 && mousePressed) {
    tail = true;
  } else {
    tail =false;
  }
  if (tail) {
    c= color(0, 0, 0);
    quad(650, 600, 650, 380, 720, 430, 580, 600);
    fill(255, 3, 3);
    textSize(30);
    text("HISS", 660, 150);
    ellipse(mx1, my1, 10, 20);
    ellipse(mx2, my2, 10, 20);
  } else {
    fill(252, 194, 225);
    quad(600, 600, 650, 380, 670, 400, 620, 600);
  }

  //left ear
  if (mouseX > 405 && mouseX < 405+60 && mouseY > 100 && mouseY < 100+80 && mousePressed) {
    leftear = true;
  } else {
    leftear =false;
  }
  if (leftear) {
    triangle(405, 180, leftearpos, 100, 460, 130);
    leftearpos=leftearpos+lspeed;
    if (leftearpos>435) {
      lspeed=-1;
    }
    if (leftearpos<425) {
      lspeed=1;
    }
  } else {
    fill(252, 194, 225);
    triangle(405, 180, 430, 100, 460, 130);
  }

  //right ear 
  if (mouseX > 550 && mouseX < 550+60 && mouseY > 100 && mouseY < 100+40 && mousePressed) {
    rightear = true;
  } else {
    rightear =false;
  }
  if (rightear) {
    c = color(230, 202, 250, 50);
    triangle(595, 180, rightearpos, 100, 540, 130);
    rightearpos=rightearpos+rspeed;
    if (rightearpos>575) {
      rspeed=-1;
    }
    if (rightearpos<555) {
      rspeed=1;
    }
  } else {
    fill(252, 194, 225);
    triangle(595, 180, 565, 100, 540, 130);
  }

  //stomach
  noStroke();
  if (mouseX > 480 && mouseX < 480+40 && mouseY > 350 && mouseY < 350+200 && mousePressed) {
    stomach = true;
  } else {
    stomach =false;
  }
  if (stomach) {
    ellipseMode(CENTER);
    fill(250, 159, 208, 90); //dark kitty pink
    ellipse(500, 450, 50, 200);
    fill(0, 0, 0);
    textSize(30);
    text("Purrrrrrr", 660, 150);
  } else {
    c= color(255);
  }

  //head
  //ellipse(500, 200, 200, 150);//head
  //ellipse(500, 210, 20, 10); //nose
  noStroke();
  if (mouseX > 400 && mouseX < 400+200 && mouseY > 130 && mouseY < 130+150 && mousePressed) {
    head = true;
  } else {
    head =false;
  }
  if (head) {
    c = color(255, 162, 195, 50);
    fill(250, 159, 208, 140);
    ellipse(450, 210, 40, 20);
    ellipse(550, 210, 40, 20);
    fill(255, 3, 3);
  } else {
    c= color(255);
  }

}
class ball {

  float x, y;   
  float speed; 
  color c;
  float r;    


  ball() {
    r = random(20, 80);                 
    y = random(width);    
    x = random(10000);              
    speed = random(-2, 2);   
    c = color(171,252,233,160); //light blue bubble color
  }

  
  void move() {
    
    y+=speed;
    x+=speed;
  }

  
  void display() {
   
    fill(c);
    stroke(118,234,206);
    ellipse(x, y, r, r);
  }


  void mousetouch(){
    noStroke();
    if (dist(mouseX, mouseY, x, y)<=20){
    
      c=color(0,0,0,1);
    }
  }
}

