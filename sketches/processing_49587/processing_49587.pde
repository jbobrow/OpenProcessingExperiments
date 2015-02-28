

int posx;
int posy;
int gsz=150;
int Fstartx;
int Fstarty;
int Ctrans;
PFont f;
ArrayList kitchen;
void setup() {
  kitchen=new ArrayList();
  Ctrans=10;
  noFill();
  stroke(150);
  strokeWeight(5);
  background(255);
  size(1200,800);
  Fstartx=150-(150%gsz);
  Fstarty=150-(150%gsz); 
  f = loadFont("CenturyGothic-48.vlw"); 
  textFont(f,16); 
  textAlign(CENTER);
  noFill();
  rect(Fstartx,Fstarty,gsz,gsz);
  text("Bedroom",posx+(gsz/2),posy+(gsz/2));
}
 
void draw() {
  noFill();
  stroke(0);
  strokeWeight(5);
  posx=mouseX-(mouseX%gsz);
  posy=mouseY-(mouseY%gsz);
  if(mousePressed == true) {
    fill(0);
    text("Bedroom",posx+(gsz/2),posy+(gsz/2));
    fill(255,0,152,Ctrans);
    rect(posx,posy,gsz,gsz);
  } else if(keyPressed) {
    if(key=='l') {
      fill(0);
      text("Living Room",posx+(gsz),posy+(gsz/2));
      fill(0,201,255,Ctrans);
      rect(posx,posy,gsz*2,gsz);
    }
    if(key=='k') {
      fill(0);
      text("Kitchen",posx+(gsz/2),posy+(gsz/2));
      fill(218,255,0,Ctrans);
      rect(posx,posy,gsz,gsz); 
      
      print("Added Kitchen");
    }
    if(key=='c') {
      background(255);
    }
  }
}

