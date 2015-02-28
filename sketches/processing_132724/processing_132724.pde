
/*@pjs preload="ball.png, balloon.png, boy.png, broc.png, candy.png,
crayon.png, frown.png, monster.png, shot.png, smile.png;*/
PImage[] myimages = new PImage[10];
float bounce = 0.0;
float a = 0.0;
float f = 150.0;
int up = 1;
int down = -1;
boolean broc = false;
boolean candy = false;
boolean crayon = false;
boolean ball = false;
boolean monster = false;
boolean shot = false;
boolean balloon = false;
int r = 192;
int g = 192;
int b = 192;

void setup(){
  size(500,500);
  myimages[0] = loadImage("boy.png");
  myimages[1] = loadImage("smile.png");
  myimages[2] = loadImage("frown.png");
  myimages[3] = loadImage("broc.png");
  myimages[4] = loadImage("candy.png");
  myimages[5] = loadImage("crayon.png");
  myimages[6] = loadImage("ball.png");
  myimages[7] = loadImage("monster.png");
  myimages[8] = loadImage("shot.png");
  myimages[9] = loadImage("balloon.png");
}

void draw(){
  background(r, g, b);
  image(myimages[0], width/3, height/2);
  
  if(keyPressed){
    if(key == '1'){
      broc = true;
      candy = false;
      crayon = false;
      ball = false;
      shot = false;
      balloon = false;
      monster = false;
    }
    if(key == '2'){
      candy = true;
      broc = false; 
      crayon = false; 
      ball = false;
      shot = false;
      balloon = false;
      monster = false;
    }
    if(key == '3'){
      crayon = true;
      candy = false;
      broc = false;
      shot = false;
      balloon = false;
      ball = false;
      monster = false;
    }
    if(key == '4'){
      ball = true;
      candy = false;
      crayon = false;
      shot = false;
      balloon = false;
      broc = false;  
      monster = false;
    }
    if(key == '5'){
      monster = true;
      ball = false;
      candy = false;
      shot = false;
      balloon = false;
      crayon = false;
      broc = false;  
    }
    
     if(key == '6'){
      shot = true;
      balloon = false;
      monster = false;
      ball = false;
      candy = false;
      crayon = false;
      broc = false;  
    }
     if(key == '7'){
      balloon = true;
      shot = false;
      monster = false;
      ball = false;
      candy = false;
      crayon = false;
      broc = false;  
    }
  }
  
  if(broc){
    image(myimages[2], 228, 350);
    image(myimages[3], mouseX, mouseY);
    r = 153;
    g = 0;
    b = 0;
  }
  
  if(candy){
    image(myimages[1], 228, 350);
    image(myimages[4], mouseX, mouseY);
    r = 255;
    g = 255;
    b = 204;
  }
  
  if(crayon){
    image(myimages[1], 228, 350);
    image(myimages[5], 285, 400);
    stroke(30,144,255);
    strokeWeight(3);
    float ly = 410;
    float lx = 305;
    while(lx < height){
      float nextX = lx + random(50);
      float nextY = ly + random(50);
      line(lx, ly, nextX, nextY);    
      ly = nextY;
      lx = nextX;
    }
    r = 255;
    g = 255;
    b = 204;
  }
  
  if(ball){
    a++;
    bounce = 330 + sin(a) * 40.0;
    image(myimages[1], 228, 350);
    image(myimages[6], mouseX, bounce);
    r = 255;
    g = 255;
    b = 204;
  }
  
  if(monster){
    image(myimages[2], 228, 350);
    for(int i = 0; i< 5; i++){
      image(myimages[7], i*100, mouseY); 
    }
    r = 153;
    g = 0;
    b = 0;
  }
  
  if(shot){
    image(myimages[2], 228, 350);
    image(myimages[8], mouseX, mouseY);
    r = 153; 
    g = 0;
    b = 0;
  }
  
  if(balloon){
    f = f + up;  
    if(f<=150){
      up = 1;
      f++;
    }
    if(f>200){
      up = down;
    }    
    image(myimages[1], 228, 350);
    for(int i = 0; i < 5; i++){
      image(myimages[9], i*100, f); 
    }
    r = 255;
    g = 255;
    b = 204;
  }
}


