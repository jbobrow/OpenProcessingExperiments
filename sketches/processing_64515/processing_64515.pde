
PImage B;
PImage O;
PImage U;
PImage N;
PImage C;
PImage E;

float Bxpos, Bypos, Oxpos, Oypos, Uxpos, Uypos, Nxpos, Nypos, Cxpos, Cypos, Expos, Eypos;
float Bxspeed, Byspeed, Oxspeed, Oyspeed, Uxspeed, Uyspeed, Nxspeed, Nyspeed, Cxspeed, Cyspeed, Exspeed, Eyspeed;
//float value = 0;


void setup() {
  size(500, 500);
  smooth();

  B = loadImage("B.png");
  O = loadImage("O.png");
  U = loadImage("U.png");
  N = loadImage("N.png");
  C = loadImage("C.png");
  E = loadImage("E.png");
  
  imageMode(CENTER);
  
  Bxspeed = 5.2;
  Byspeed = 4.3;
  Oxspeed = 3.2;
  Oyspeed = 2.3;
  Uxspeed = 1.2;
  Uyspeed = 0.3;
  Nxspeed = 1.2;
  Nyspeed = 2.3;
  Cxspeed = 3.2;
  Cyspeed = 4.3;
  Exspeed = 5.2;
  Eyspeed = 6.3;
  
  Bxpos = width/2;
  Bypos = height/2;
  Oxpos = width/2;
  Oypos = height/2;
  Uxpos = width/2;
  Uypos = height/2;
  Nxpos = width/2;
  Nypos = height/2;
  Cxpos = width/2;
  Cypos = height/2;
  Expos = width/2;
  Eypos = height/2;

}

void draw()
{
  background(255);
  
//  xspeed = 5.2;
//  yspeed = 4.3;
  //fill(255, 20); //instead of background, a rectangle with some alpha
  //rect(0,0,width,height);
   
 
//  fill(200,20,150);
//  ellipse(xpos,ypos, r*2,r*2);
  //tint(255, 200);
  image(B, Bxpos, Bypos, 15, 15);
  
  translate(15,0);
  image(O, Oxpos, Oypos, 15, 15);
  
  translate(15,0);
  image(U, Uxpos, Uypos, 15, 15);
  
  translate(15,0);
  image(N, Nxpos, Nypos, 15, 15);
  
  translate(15,0);
  image(C, Cxpos, Cypos, 15, 15);
  
  translate(15,0);
  image(E, Expos, Eypos, 15, 15);
  
//  if(dist(xpos, ypos, mouseX, mouseY) > 5) {
//   xpos = width/2;
//   ypos = height/2; 
//     xspeed = xspeed-xspeed;
//     yspeed = yspeed-yspeed;
//  }
   
  if ((dist(Bxpos, Bypos, mouseX, mouseY) < 20) || (dist(Oxpos, Oypos, mouseX, mouseY) < 20) || (dist(Uxpos, Uypos, mouseX, mouseY) < 20) || (dist(Nxpos, Nypos, mouseX, mouseY) < 20) || (dist(Cxpos, Cypos, mouseX, mouseY) < 20) || (dist(Expos, Eypos, mouseX, mouseY) < 20)) {
    Bxspeed = Bxspeed-Bxspeed;
    Byspeed = Byspeed-Byspeed;
    Oxspeed = Oxspeed-Oxspeed;
    Oyspeed = Oyspeed-Oyspeed;
    Uxspeed = Uxspeed-Uxspeed;
    Uyspeed = Uyspeed-Uyspeed;
    Nxspeed = Nxspeed-Nxspeed;
    Nyspeed = Nyspeed-Nyspeed;
    Cxspeed = Cxspeed-Cxspeed;
    Cyspeed = Cyspeed-Cyspeed;
    Exspeed = Exspeed-Exspeed;
    Eyspeed = Eyspeed-Eyspeed;
  }
  else {
  Bxpos += Bxspeed;
  Bypos += Byspeed;
  Oxpos += Oxspeed;
  Oypos += Oyspeed;
  Uxpos += Uxspeed;
  Uypos += Uyspeed;
  Nxpos += Nxspeed;
  Nypos += Nyspeed;
  Cxpos += Cxspeed;
  Cypos += Cyspeed;
  Expos += Exspeed;
  Eypos += Eyspeed;
  }
  
//  Bxpos += Bxspeed;
//  Bypos += Byspeed;
//  Oxpos += Oxspeed;
//  Oypos += Oyspeed;
//  Uxpos += Uxspeed;
//  Uypos += Uyspeed;
//  Nxpos += Nxspeed;
//  Nypos += Nyspeed;
//  Cxpos += Cxspeed;
//  Cypos += Cyspeed;
//  Expos += Exspeed;
//  Eypos += Eyspeed;
  
  
  if ((Bypos > height-15) || (Bypos < 15)) {
    Byspeed *= -1;
  }
  
  if( (Bxpos > width-15) || (Bxpos < 15)) {
    Bxspeed *= -1;
  }
  
    if ((Oypos > height-15) || (Oypos < 15)) {
    Oyspeed *= -1;
  }
  
  if( (Oxpos > width-15) || (Oxpos < 15)) {
    Oxspeed *= -1;
  }
  
    if ((Uypos > height-15) || (Uypos < 15)) {
    Uyspeed *= -1;
  }
  
  if( (Uxpos > width-15) || (Uxpos < 15)) {
    Uxspeed *= -1;
  }
  
    if ((Nypos > height-15) || (Nypos < 15)) {
    Nyspeed *= -1;
  }
  
  if( (Nxpos > width-15) || (Nxpos < 15)) {
    Nxspeed *= -1;
  }
  
    if ((Cypos > height-15) || (Cypos < 15)) {
    Cyspeed *= -1;
  }
  
  if( (Cxpos > width-15) || (Cxpos < 15)) {
    Cxspeed *= -1;
  }
  
    if ((Eypos > height-15) || (Eypos < 15)) {
    Eyspeed *= -1;
  }
  
  if( (Expos > width-15) || (Expos < 15)) {
    Exspeed *= -1;
  }
  
  if(mousePressed == true) {
  Bxspeed = 5.2;
  Byspeed = 4.3;
  Oxspeed = 3.2;
  Oyspeed = 2.3;
  Uxspeed = 1.2;
  Uyspeed = 0.3;
  Nxspeed = 1.2;
  Nyspeed = 2.3;
  Cxspeed = 3.2;
  Cyspeed = 4.3;
  Exspeed = 5.2;
  Eyspeed = 6.3;
  }
}

//void mouseReleased() {
//   if(value == 0) {
//     xspeed = xspeed-xspeed;
//     yspeed = yspeed-yspeed;
//   } 
//   else {
//      xspeed = 5.2;
//      yspeed = 4.3;
//      xpos += xspeed;
//      ypos += yspeed; 
//   }
//}

