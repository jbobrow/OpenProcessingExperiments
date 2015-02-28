
//bouncing ball#2
float vy,vx,x,y,x2,y2,frictiony,frictionx,gravity;
int mode = 0; 
PImage nyancat,evilnyan,poptart,startimage;

void setup(){
  size(800,600);
  smooth();
  nyancat = loadImage ("nyan.jpg");
  evilnyan = loadImage ("evilnyan.jpg");
  poptart = loadImage ("poptart.jpg");
  startimage = loadImage( "nyanvsevil.gif");
  vy = 0;  // velocity y
  vx = 1.5; // moving 2 pixels per frame
  x = 0;
  y = 600; //beginning point of ball (10,200)
  x2 = 10;
  y2 = 5;
  frictiony = -.6; //cuts down speed when bouncing
  frictionx = .998; //slows down horizontal movement
  gravity = .1;
  
  
}

void draw(){
  println(int(millis()/1000));
  if (mode == 0){ //start startscreen at beginning ( 0)
    startScreen();
  } else if (mode == 1){
  play();
  } //moves all codes into ' fun' 
  else if (mode ==2){
    gameover();
  }

  
  }
  
  void keyPressed(){
     if (key == 'a'){ //begin game
    mode = 1;
  }
  if (key == 'b'){ //restart -- not working?
    mode = 1;
  }
  
  

  }

void mouseReleased(){
  vy -= 3; //negative fact. makes ball bounce up
  // y axis- going down = +, going up = -
}


void startScreen(){ //starting screen is red
  background(238,122,233);
  textSize(30);
  fill(0,0,128);
  strokeWeight(15);
  text("NYAN CAT VS. EVIL", 260,150);
  text("Press A Button to Start", 230,400);
  textSize(20);
  text("Earn all poptarts without hitting evil waffle cat", 180,540);
  text("in 15 sec", 350,570);
  image(startimage,250,200,300,150);
}

void gameover(){
  background(131,111,255);
  textSize(50);
  fill(0);
  text("GAME OVER",250 ,height/3);
  textSize(30);
  fill(0);
  text("Press B button to Restart", 200, 500); //not working
}
  
void play(){
background(0,0,128);

for(int x = 0; x < width; x+=35){
  for(int y = 0; y < height; y +=35){
    noStroke();
    fill (248,248,255);
    ellipse(x,y,3,3);
    pushMatrix();
    translate(52,52);
    ellipse(x,y,5,9);
    popMatrix();
  }
}
fill(144,238,144);
  noStroke();
  ellipse(100,600,500,300);
  ellipse(450,600,400,200);
  ellipse(700,630,500,400);
    
  
  vy += gravity; //force pulling down every frame
  vx *=frictionx; //slow down x velocity
  x += vx;
  y += vy;
  if (y > height){
    y = height; //doesnt go outside frame
    vy *= frictiony;
  }
  if (x > width){
    x = width;
    vx *= -1;
  } 
  if(int(millis()/1000) > 15){
  mode = 2;

  } //goes to gameover page by touching evilcat

  

  image(nyancat,x,y,35,25); //ball

  
  
  image(evilnyan,90,100,50,30);
  image(evilnyan,250,480,50,30);
  image(evilnyan,400,80,50,30);
  image(evilnyan,600,240,50,30);

  
  
  image(poptart,180,300,30,20);
  image(poptart,490,400,30,20);
  image(poptart,670,30,30,20);
  
  
}
 


 


