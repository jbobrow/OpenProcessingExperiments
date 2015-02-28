
//Mode Notes

int mode = 7;

PImage stardestroyer;
PImage moncalcruiser;
PImage xwing;
PImage deathstar;
PImage alderaan;
PImage boom;
float x,y,dX,dY,easing;

void setup(){
  size(800,800);
  smooth();
  noFill();
}

void draw(){
  //Star Destroyer and Mon Cal
  if(mode == 4){
    background(0);
    pushMatrix();
    translate(187,500);
      stardestroyer = loadImage( "stardestroyer.png");
      image(stardestroyer,0,0);
    popMatrix();
    moncalcruiser = loadImage( "moncalcruiser.png");
    image(moncalcruiser,200,25);
    ellipse(mouseX,mouseY,20,20);
    noFill();
    for(int i = 400; i<401; i++){
      stroke(255,0,0);
      strokeWeight(1);
      line(mouseX,mouseY,i,535);
      line(mouseX,mouseY,470,533);
  }
  //Boom Screen
  }  else if(mode == 3){
    background(0);
    boom = loadImage( "boom-hi.png");
    image(boom,0,0);
    
      }
    //Star Destroyer and Mon Cal
      else if(mode == 2){
        background(0);
      stardestroyer = loadImage( "stardestroyer.png");
      image(stardestroyer,200,25);
    pushMatrix();
    translate(100,500);
      moncalcruiser = loadImage( "moncalcruiser.png");
      image(moncalcruiser,0,0);
    popMatrix();
    ellipse(mouseX,mouseY,20,20);
    noFill();
    for(int i = 400; i<401; i++){
    stroke(0,255,0);
    strokeWeight(1);
    line(mouseX,mouseY,i,505);
    line(mouseX,mouseY,248,548);
    line(mouseX,mouseY,535,565);

    }
      }
    //Xwing vs Death Star
    else if(mode == 1){
      background(0);
    pushMatrix();
    translate(345,500);
    xwing = loadImage( "xwing.png");
    image(xwing,0,0);
    popMatrix();
    deathstar = loadImage( "deathstar.png");
    image(deathstar,0,0);
    ellipse(mouseX,mouseY,20,20);
    noFill();
    for(int i = 400; i<401; i++){
    stroke(255,0,0);
    strokeWeight(1);
    line(mouseX,mouseY,i,559);
    line(mouseX,mouseY,735,690);
    line(mouseX,mouseY,410,645);
    line(mouseX,mouseY,670,785);
    }
  }
  //title screen
  else if(mode == 7){
    background(0);
    deathstar = loadImage( "deathstar.png");
    image(deathstar,0,0);
    xwing = loadImage( "xwing.png");
    image(xwing,380,475);
    fill(255,255,0);
    text("STAR WARS SHOOTER",450,100);
    fill(255);
    text("Press 1-X-Wing vs Death Star",500,150);
    fill(255);
    text("Press 2-Rebel Cruiser vs Star Destroyer",500,175);
    fill(255);
    text("Press 3-Star Destroyer vs Rebel Cruiser",500,200);
    fill(255);
    text("Press 4-Death Star vs Alderaan",500,225);
    fill(255);
    text("Left Click to Shoot",500,300);
  }
  //Star Destroyer Alderaan
  else if(mode == 5){
    background(0);
  pushMatrix();
  translate(120,0);
    deathstar = loadImage( "deathstar.png");
    image(deathstar,0,0);
  popMatrix();
  pushMatrix();
  translate(500,500);
    alderaan = loadImage( "alderaan.png");
    image(alderaan,0,0);
  popMatrix();
    ellipse(mouseX,mouseY,20,20);
    noFill();
    for(int i = 400; i<401; i++){
    stroke(0,255,0);
    line(mouseX,mouseY,i,130);
    strokeWeight(10);
    }
  }
}

void mousePressed(){
  mode = 3;
}

void mouseReleased(){
  mode = 7;
}

void keyPressed(){
  if(key == '1'){
    mode = 1;
  }
  else if(key == '3'){
    mode = 4;
  }
  else if(key == '2'){
    mode = 2;
  }
  else if(key == '4'){
    mode = 5;
  }
}

