
PImage img;
int x,y;
int c;

void setup(){
  size(500,500);
  background(1,11,27);
  smooth();
  noStroke();
  fill(0);
  img = loadImage("test.png");
  
  c =0;
}

void draw(){}
 void mouseDragged(){
tint(255,190,1,100);//not fill
  image(img,mouseX,mouseY,10,10);
}

void mousePressed(){//部分けし
  noStroke();
  fill(1,11,27);
  ellipse(mouseX,mouseY,20,20);
}

void mouseMoved(){
  c += 10;
  if(c > 255){
    c = 255;
  }
}

void keyPressed(){
  switch(key){
    case 'F':
      noStroke();
      fill(225,205,1);
      ellipse(250,60,100,100);
      break;
    case '3':
      noStroke();
      fill(1,11,27);
      ellipse(235,60,80,80);
      break;
    case 'P'://ぜんけし
      background(1,11,27); 
      break;
    case 'S':
      tint(255,190,1,50);
      image(img,mouseX,mouseY,20,20);
      break;    
    }
}


