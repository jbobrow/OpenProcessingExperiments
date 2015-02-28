
int c ;
int x = 360 ;
int y;

void setup(){
  size(600, 600);
  colorMode(HSB,360);
  background(0);
  frameRate(15);
}

void draw(){
   smooth();
  c = c + 3;
  y = y + 3;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == DOWN){
      x = x-20;
      if(x<=0){
        x=0;
      }
    }
    else if(keyCode == UP){
      x= x+20;
      if(x>=360){
        x=360;
      }
    }
  }
                           
  switch (key){
   case 'z':
   background(0);
   break;   //risetto
}
}


void mouseDragged(){
   noFill();
   stroke(c,360,360,x);
   if(key == 'x'){
     ellipse(mouseX,mouseY,y,y); //mausewooshiteiruaidaengakakeru
   }
  else if(key == 'q'){
  noStroke();
  fill(0,0,0);
  ellipse(mouseX,mouseY,60,60);
  }//kesigomu
  else if(key == 'e'){
      rectMode(CENTER);  //shikakugakakeru
      rect(mouseX,mouseY,y,y);
   }
   else{
     noStroke();
     fill(360,x);
     ellipse(mouseX,mouseY,10,10);
   }
   if(c >=360 || y >= 360){
  c = 0; y= 0;
}
 
}




