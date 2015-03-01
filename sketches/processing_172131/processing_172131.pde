
Log [] logs = new Log[9];

Car [] cars = new Car[10];
Frog charlie;
void setup() {
  size(400, 600);
  
    cars[0] = new Car(50,325);
    cars[1]= new Car(225,325);
    cars[2] = new Car(400,325);
    
    cars[3] = new Car(67,365);
    cars[4] = new Car(393,365);
    
    cars[5] = new Car(1,405);
    cars[6] = new Car(400,405);
    cars[7] = new Car(100,445);
    
    cars[8]= new Car(200,485);
    cars[9]= new Car(393,485);
    

  charlie = new Frog(173, 530);

 logs[0] = new Log(120,125);
 logs[1] = new Log(220,125);
 logs[2] = new Log(250,205);
 logs[3]= new Log(500, 85);
 logs[4]= new Log(256,85);
 logs[5]= new Log(141,245);
 logs[6]= new Log(542, 245);
 logs[7]= new Log(123, 165);
 logs[8] = new Log(499, 165);

}
void draw() {
  _drawBackground();
 



  for (int i = 0; i < logs.length; i++) {
    logs[i].move();
    logs[i].display();
  }
  
 if (charlie.y < 280){
    boolean alive = false;
    for(int i = 0; i < logs.length; i++) {
      if(logs[i].didHitFrog(charlie.x,charlie.y)){
        charlie.x += logs[i].speed;
        alive = true;
        break;
      }
    }
    if (!alive){
      println("BLOOP");
      charlie.x = 173;
      charlie.y = 290;
  }
  }
    charlie.display();
 
    
 for (int i = 0; i <  cars.length; i++) {
    cars[i].move();
    cars[i].display();


    if (cars[i].didHitFrog(charlie.x, charlie.y)) {
      println("Squish");
      // Reset the Frog to the bottom of the screen!
      charlie.x = 170;
      charlie.y = 530;
    }
  }
}
void keyPressed() {
  if (key == 'w') {
    charlie.y -= 40;
  }
  if (key == 'd') {
    charlie.x += 40;
  }
  if (key == 's') {
    charlie.y += 40;
  }
  if (key == 'a') {
    charlie.x -= 40;
  }
}


void _drawBackground() {
  fill(#05B424);
  rect(0, 0, width, 80);
  fill(#165FF7);
  rect(0, 80, width, 280);
  fill(#C1BFC9);
  rect(0, 280, width, 320);
  fill(#A0A0A0);
  rect(0, 320, width, 520);
  for (int x = 10; x < width; x += 80) {
    for (int y= 360; y < 520; y += 40) {
      stroke(255, 255, 0);
      line(x, y, x+20, y);
    }
  }
  stroke(255);
  fill(#C1BFC9);
  rect(0, 520, width, 560);
  fill(0); 
  rect(0, 560, width, 600);
  fill(255);
  text("Score:", 40, 580);
}

class Car {
  float x, y;
  color c;
  float speed;
  Car(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(random(255), random(255), random(255)); 
    speed = 2;
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
  }
  
  boolean didHitFrog(float fx, float fy){
    if(dist(x,y,fx,fy) < 25){
      return true;
    }
    else return false;
  }
  
  
  
  void display() {
    fill(c, 300);
    rect(x, y, 80, 30);
stroke(#050000);
    fill(c);
    rect(x+20, y+5, 40, 20);
    fill(0);
    rect(x+70, y-3,10,3);
    rect(x, y-3,10,3);
    rect(x+70, y+30,10,3);
    rect(x, y+30,10,3);




  }
}

class Frog {
  float x, y;
  color c;
  Frog(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(#BC0404); 
  }

  void display() {
    fill(c);
    stroke(c);
    rect(x, y, 20, 20,5);
    fill(c);
    stroke(c);
    
    line(x+3,y,x-5,y);
    line(x-5,y,x-5,y-5);
    
    line(x+25,y,x+18,y); // front right leg
    line(x+25,y,x+25,y-5); //front right leg
    
    line(x+3,y+20,x-5,y+20);//back left leg
    line(x-5,y+20,x-5,y+25);
    
    line(x+15,y+20,x+25,y+20);//back right leg
    line(x+25,y+20,x+25,y+25);
  }
}

class Log {
  float x, y;
  color c;
  float speed;
  Log(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(#B26009); 
    speed = int(random(1,4));
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
  }
 boolean didHitFrog(float fx, float fy){
   if(dist(x,y,fx,fy) < 40){
      return true;
    }
    else return false;
  }
  
  
  void display() {
    fill(c, 300);
    rect(x, y, 90, 30, 10);
  }
}



