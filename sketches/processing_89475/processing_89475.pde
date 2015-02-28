
//Ethan Kaplan
//I borrowed code of the "Noob Help" post in /r/processing. 
//I edited it a bunch
int a = int(random(255));
int b = int(random(255));
int d = int(random(255));
color c = color(0, 0, 0, 255); 
int h = 200; 
int w = 200; 
int w2 = 0; 
int h2 = 0; 
int t = 0;
float x = random(169); 
float y = random(189); 
float speed = 1; 
float fly = -1;

void setup() { 
  size(h, w);
}

void draw() { 
  background(255); 
  if(t%10==0){
  a = int(random(255));
  b = int(random(255));
  d = int(random(255));
  }
  t++;
  keyPressed(); 
 
  display();
  keyReleased();
  
}
void keyPressed(){
  if (keyCode == RIGHT) { 
    x = x + speed; 
    if (x+31 > w) { 
      x = 169;
    }
  }
    if (keyCode == LEFT) { 
    x = x - speed; 
    x = x; 
    if (x < w2) { 
      x = 0;
    }
  }
    if (keyCode == UP) { 
    y = y + fly; 
    if (y < h2) { 
      y = 0;
    }
  }
    if (keyCode == DOWN) { 
    y = y - fly; 
    if (y+11 > h) { 
      y = 189;
    }
  }

}
void keyReleased() {
  if(keyCode == RIGHT){
    x = x-speed;
  }
  if(keyCode==LEFT){
    x = x+speed;
  }
  if(keyCode==UP){
    y=y-fly;
  }
  if(keyCode==DOWN){
    y=y+fly;
  }
}

 



void display() { 
  fill(a, b, d, 255); 
  rect(x, y, 8, 10, 2);
  ellipse(x+25,y+5,8,10);
  arc(x+15,y+11,8,10,PI,2*PI);
}


