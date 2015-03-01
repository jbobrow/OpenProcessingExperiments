
// Kevin McGowan IML 404 week 4 sketch

// variables
    // clouds and sun
    int counterTwo = 0;
    int sunY = 600;
    
    // star noise
    PImage star;
    float starX;
    float starY;
    int starW;
    int starH;
    float noiseScale = 0.01;
    int counterThree = 3;
    
    // other
    boolean nightTime = true;
    int counterOne = 2;  // if odd = day
    PFont caslonReg;
    PFont caslonItal;    // lindsay says change text
    
    
void setup(){
  size(800,600); 
  caslonReg = loadFont("ACaslonPro-Regular-48.vlw");
  caslonItal = loadFont("ACaslonPro-Italic-48.vlw");
  star = loadImage("star.png");
}

void draw(){
  backGnd();
  clouds(counterTwo);
  button();
  counterTwo++;
  if (counterTwo == 800)
    counterTwo = 0;
    
  
}


void mousePressed(){
  if (mouseX>15 && mouseX<115 && mouseY>15 && mouseY<55){
    button();
    counterOne++;
    backGnd();
  }
}

void button(){
  if (counterOne%2==1){  //night time
     fill(#290094);
     rect(15,15,100,40); 
     fill(255);
     textFont(caslonItal);
     textSize(24);
     text("Night",30,40);
     nightTime = true;
  }
  else {               //day time
    fill(255,230,0);
    rect(15,15,100,40); 
    fill(0);
    textFont(caslonReg);
    textSize(24);
    text("Day", 30,40);
    nightTime = false;
  }
  
}

void backGnd(){
  if (nightTime){  //night time
    background(0);
    stars(); 
    fill(0,255,120,50);
    triangle(150,height,300,300,450,height);
    triangle(300,height,500,225,700,height); 
    sunY = 600;
  }
  else {       //day time
    background(120,106,255);  
    sun();
    fill(0,255,120);
    triangle(150,height,300,300,450,height);
    triangle(300,height,500,225,700,height);
  }
}

void clouds(int counter){
  for (int i=-2;i<3;i++){
    for(float ii = PI/3; ii<=PI*2; ii+=PI/3){
      int x = int(cos(ii)*40) + counter;
      int y = int(sin(ii)*30);
      fill(255);
      noStroke();
      ellipse(x+(i*400),y+100,65,65);
    }
  }
}

void sun(){
  fill(240,238,108);
  ellipse(400,sunY,75,75);
  if(sunY > 100)
    sunY--;
}

void stars(){
  for(int iii=0;iii<200;iii++){ 
  starX = noise(mouseX*.1)*width;
  starY = noise(mouseY*.1)*height-200;
  starW = int(noise(noiseScale));
  starH = int(noise(noiseScale+0.1));
  noiseScale+=noiseScale;
  image(star,starX,starY,11,11);
  }  
}




