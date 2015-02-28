
//float xpos=0;  //xposition of ellipse
//float ypos=0; // y position of ellipse
//int diam=50; // diameter of ellipse
//
//void setup(){
//  size(800,800);
//  noStroke();
//}
//
//void draw(){
//  background(0);
////  ellipse(xpos, ypos, diam, diam);
////  if(keyPressed){
////    if(key == 'a'){
////      xpos++;
////      ypos++;
////    }
////  }
////  println(key);
//}
//
//void keyPressed(){
//  if(key == 'a'){
//    xpos++;
//    ypos++;
//  }
//}

void setup(){
  size(800,800);
  background(0);
}

void draw(){
//  for(int i=0; i<30; i++){
//    rectangle(80+i*20,80+i*30, 10,10);
//  }
  fill(127.5);
  drawKitten(width/2, height/2, 200);
  fill(127.5);
  drawKitten(100,100, 50);
}

//void rectangle(int x, int y, int w, int h){
//  line(x, y, x+w, y);
//  line(x, y, x, y+h);
//  line(x, y+h, x+w, y+h);
//  line(x+w, y, x+w, y+h);
//}

void drawKitten(float x, float y, float w){
  noStroke();
  ellipse(x, y, w, .8*w);
  fill(255,150,150);
  triangle(x, y, x+.075*w, y+.15*w, x-0.075*w, y+.15*w);
}

