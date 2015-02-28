
int nappi=0;
int m;
PImage juti;
PFont myFont;

void setup(){
  size(500,500);
  frameRate(14);
  juti=loadImage("juti.jpg");
  myFont = createFont("Futura-Medium",32);
  textFont(myFont);
  m=2*24;
}

void draw(){
  
  switch(nappi){
    
    case 0:
    background(#FF39DB);
    textSize(16);
    text("press any key",250,480);
    break;
    
    case 1:
    background(#FF39DB);
    textAlign(CENTER);
    textSize(32);
    text("Ville 25 vee",width/2,height/2);
    break;
    
    case 2:
    background(#FF39DB);
    textAlign(CENTER);
    textSize(32);
    text("onnea hyvä herra...",width/2,height/2);
    break;
    
    case 3:
    background(#FF39DB);
   for (int x=0; x<500;x=x+5){
  float viiva=random(-100,500);
  float paksu=random(0.5,5);
  color vari=color(random(255), random(255), random(255));
  line(width/2,height/2,x*2,50+viiva);
  strokeWeight(paksu);
  stroke(vari);
  }
    image(juti,150,100);
    textSize(32);
    text("ny saa rillata!",width/2,90);
  break;
  
  case 4:
  background(#FF39DB);
  textSize(16);
  textAlign(0,0);
  text("t. elekku",350,480);
  }  
}

void keyPressed(){
  nappi=nappi+1;
  if(nappi>4)
  nappi=4;
  
  if (m<0)
  nappi=1;
}



