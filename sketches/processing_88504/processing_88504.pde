
float i = 0;
float j = 0;
float g = 0;
float frame = 0;
int timer = 0;
int maxImages = 16;
PImage[] images = new PImage[maxImages];

void setup(){
  size(700,500);
  frameRate(5);
  
  images[1] = loadImage("background1.jpg");
  images[2] = loadImage("background2.jpg");
  images[3] = loadImage("background3.jpg");
  images[4] = loadImage("background4.jpg");
  images[5] = loadImage("goblin1.png");
  images[6] = loadImage("goblin2.png");
  images[7] = loadImage("goblin3.png");
  images[8] = loadImage("hero1.png");
  images[9] = loadImage("hero2.png");
  images[10] = loadImage("hero3.png");
  images[11] = loadImage("hero4.png");
  images[12] = loadImage("hero5.png");
  images[13] = loadImage("hero6.png");
  images[14] = loadImage("hero7.png");
  images[15] = loadImage("Trojan-Herpleasure-condoms.png");
}

void draw(){
  timer += 1;
  
  if (timer >= 0 && timer < 15){
    image(images[1],0,0,700,500);
    image(images[8],100,0,700,500);
  }
  
  if (timer >= 15 && timer < 30){
    image(images[1],0,0,700,500);
    image(images[9],100,0,700,500);
    textSize(30);
    fill(0);
    text("I have to save the princess!", 30,30);
  }
  
  if (timer >= 30 && timer < 35){
    image(images[2],0,0,700,500);
    image(images[5],200,50,140,100);
    image(images[5],200,200,140,100);
    image(images[5],200,350,140,100);
    image(images[10],400,350,140,100);
    text("HOLD C!", 400, 300);
  }
  
  if(keyPressed){
    if(key == 'c'){
            image(images[2],0,0,700,500);
            image(images[5],200,50,140,100);
            image(images[5],200,200,140,100);
            image(images[6],180,350,140,100);
            text("HOLD U!", 400, 200);
            if(i > -500){
              i -= 10;
              translate(i,0);
            image(images[11],150,350,140,100);
            }
  
}
}

  if(keyPressed){
    if(key == 'u'){
            image(images[2],0,0,700,500);
            image(images[5],200,50,140,100);
            image(images[6],180,200,140,100);
            image(images[7],180,350,140,100);
            text("HOLD T!", 400, 100);
            if(j > -500){
              j -= 10;
              translate(j,0);
            image(images[11],150,200,140,100);
            }
  
}
}

  if(keyPressed){
    if(key == 't'){
            image(images[2],0,0,700,500);
            image(images[6],180,50,140,100);
            image(images[7],180,200,140,100);
            image(images[7],180,350,140,100);
            text("NOW CLICK!!!!", 400, 400);
            if(g > -500){
              g -= 10;
              translate(g,0);
            image(images[11],150,50,140,100);
            }
  
}
}

if (frame == 1){
  fill(255);
  image(images[3],0,0,700,500);
  image(images[12],0,100,700,500);
  text("Click to Look!",100,500);
}

if (frame == 2){
  fill(255);
  image(images[3],0,0,800,600);
  image(images[13],0,100,700,500);
  text("Click to Enter!",100,500);
}

if (frame == 3){
  fill(255);
  image(images[4],0,0,700,500);
  image(images[14],0,50,700,500);
  text("Click",100,500);
}

if (frame == 4){
  fill(255);
  image(images[4],0,0,700,500);
  image(images[14],0,50,700,500);
  text("Click",100,500);
  text("It's Dangerous to Go Alone!",200,50);
}

if (frame == 5){
  fill(255);
  image(images[4],0,0,700,500);
  image(images[14],0,50,700,500);
  image(images[15],300,200,100,100);
  text("Click",100,500);
  text("It's Dangerous to Go Alone!",200,50);
  text("Take This!",300,100);
}

if (frame == 6){
  fill(255);
  rect(0,0,700,500);
  image(images[12],0,0,700,500);
  image(images[15],600,25,100,100);
  fill(0);
  text("END",500,400);
}
}

void mousePressed(){
  frame += 1;
}


