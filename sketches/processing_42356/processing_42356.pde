
//EJ Posselius - Processing.2 - 2011.10.12

float bx, by, cx, cy; //box dimensions; b = *2; c = /2
int bs = 20; //box size (radius)
int bgD; //background diameter
boolean locked = false;
PFont f1;

void setup (){
  size (800,800);
  bx = 50;
  by = 50;
  cx = 50;
  cy = 100;
  bgD = width;
  f1 = loadFont("f1.vlw");
  rectMode(RADIUS);
  
  background (0);  
  smooth();
}


void draw() {
fill(0, 50);
rect(0,0,width,height);

 
  //draw bgCircles
 for (int i = 1; i<int(width/bs)+1; i++) {
   for (int j = 1; j<int(width/bs)+1; j++) {
     fill(round(map(j,1,width/bs,80,255)),round(map(i,1,width/bs,100,255)),round(map((i+j)/2,0,width/bs,80,255)));
     ellipse(i*bgD-(bgD/2), j*bgD-(bgD/2), bgD, bgD);
   }
 }

 
 textFont(f1,30);
 
 //test button 'b'
  if (mouseX > bx-bs && mouseX < bx +bs && mouseY > by-bs && mouseY < by+bs  && mousePressed == true ){  
    if(!locked) {
      stroke(255);
      fill(200,200,100);
    }
  }else if(bgD < 50){
    stroke(255);
    fill(0);
    bgD = 20;
  }else{
   stroke(0);
   fill(100,100,200);
   bgD /= 2;
   delay(100);  //debounce switch
   
}

fill(100,255,100,150);
rect(bx,by,bs,bs);
fill(0);
text("x2",bx-bs+5,by+(bs/2));

 //test button 'c'
  if (mouseX > cx-bs && mouseX < cx +bs && mouseY > cy-bs && mouseY < cy+bs  && mousePressed == true ){  
    if(!locked) {
      stroke(255);
      fill(200,200,100);
    }
  }else if(bgD >= width){
    stroke(255);
    fill(0);
    bgD = 800;
  }else{
   stroke(0);
   fill(100,100,200);
   bgD *= 2;
   delay (100); //debounce switch
}
fill(100,255,100,150);
rect(cx,cy,bs,bs);
fill(0);
text("/2",cx-bs+5,cy+(bs/2));
}

