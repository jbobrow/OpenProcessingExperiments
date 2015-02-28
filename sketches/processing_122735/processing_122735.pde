
int eSize = 10; //ellipse size
int a = 150; //alpha
int rc = 0; //RGB(R)
int gc = 0; //RGB(G)
int bc = 0; //RGB(B)

void setup(){
  size(600,600);
  background(255);
  smooth();
  noStroke();
  frameRate(120);
}

void draw(){
}

void keyPressed(){
  
  //drawing alpha
  if(key == CODED){
    if(keyCode == UP){
      a += 5;
      if(a > 150){
        a = 150;
      }
    }else if(keyCode == DOWN){
      a -= 5;
      if(a < 0){
        a = 0;
      }
    }
  }
  
  
  //drawing size
  if(key == CODED){
    if(keyCode == RIGHT){
      eSize += 5;
      if(eSize > 300){
        eSize = 300;
      }
    }else if(keyCode == LEFT){
      eSize -= 5;
      if(eSize < 5){
        eSize = 5;
      }
    }
  }
  
  
  //screen shot
  if(key == 'p' || key == 'p'){
    save("screenshot.jpg");
    println("saved screen.");
  }
  
  
  switch(key){
    
    //colorchange
    case'r':  //red
     rc = 255; gc = 0; bc = 0;
     break;
    case'o':  //orange
     rc = 255; gc = 165; bc = 0;
     break;
    case'y':  //yellow
     rc = 255; gc = 255; bc = 0;
     break;
    case'g':  //green
     rc = 50; gc = 205; bc = 50;
     break;
    case's':  //skyblue
     rc = 0; gc = 191; bc = 255;
     break;
    case'b':  //blue
     rc = 0; gc = 0; bc = 128;
     break;
    case'v':  //violet
     rc = 75; gc = 0; bc = 130;
     break;
    case'l': //randomcolor
     rc = int(random(255));
     gc = int(random(255));
     bc = int(random(255));
     break;
    
    //clear
    case'w':  //eraser(white)
     rc = 255; gc = 255; bc = 255;
     break;
    case'k':  //eraser(black)
     rc = 0; gc = 0; bc = 0;
     break;
    
    //background
    case'K':  //shift+k(black)
     background(0);
     break;
    case'W':  //shift+w(white)
     background(255);
     break;
  }
}

void mouseDragged(){
  fill(rc,gc,bc,a);  //draw color
  ellipse(mouseX,mouseY,eSize,eSize);
  ellipse(mouseX+20,mouseY+20,eSize,eSize);
  ellipse(width-mouseX,height-mouseY,eSize,eSize);
  ellipse(width-mouseX-20,height-mouseY-20,eSize,eSize);
}


