
float eyeh; //eye height
float eyew; // eye width
float eyey; // eye y postion
float leyex; // left eye x postion
float reyex; // right eye x postion
float pupS; // pupil size
float lpupX; // left pupil x position
float rpupX; // right pupil x position
float pupY; // pupil Y position
float blinkpoint; // Y cordinate of blink
boolean blinkcheck = true; // checks if eyes are blinked




void setup() {

  size(400, 200);
  smooth();
  
  eyeh       = height/3;
  eyew       = height/4;
  eyey       = height*0.35;
  leyex      = width*0.25;
  reyex      = width*0.75;
  pupS       = eyeh/3;
  blinkpoint = eyey-(eyeh/4);
}

void draw() {

  background(240,210,160);
  
  // none moving section - eye background
  noStroke();
  fill(255);
  quad(leyex-eyew, eyey,  leyex, eyey-(eyeh/2),  leyex+eyew, eyey,  leyex, eyey+(eyeh/2));
  quad(reyex-eyew, eyey,  reyex, eyey-(eyeh/2),  reyex+eyew, eyey,  reyex, eyey+(eyeh/2));
  
  // pupils
  fill (170,140,90);
  lpupX = map(mouseX, 0, width, leyex-eyew, leyex+eyew);
  pupY  = map(mouseY, 0, height, (eyey-(eyeh/2)+pupS), (eyey+(eyeh/2)-pupS));
  ellipse(lpupX, pupY, pupS, pupS);
  rpupX = map(mouseX, 0, width, reyex-eyew, reyex+eyew);
  ellipse(rpupX, pupY, pupS, pupS);
  
  // left eye indent
  fill(210,180,160);
  beginShape();
  vertex(leyex+eyew+pupS, eyey);
  vertex(leyex+eyew, eyey);
  vertex(leyex, eyey-(eyeh/2));
  vertex(leyex-eyew, eyey);
  vertex(leyex, eyey+(eyeh/2));
  vertex(leyex+eyew, eyey);
  vertex(leyex+eyew+pupS, eyey);
  vertex(leyex+eyew, eyey+eyeh);
  vertex(leyex-(2*eyew),height);
  vertex(0,height);
  vertex(0,0);
  vertex(leyex+eyew, eyey-(0.75*eyeh));
  endShape();
  
  // right eye indent
  beginShape();
  vertex(reyex-eyew-pupS, eyey);
  vertex(reyex-eyew, eyey);
  vertex(reyex, eyey-(eyeh/2));
  vertex(reyex+eyew, eyey);
  vertex(reyex, eyey+(eyeh/2));
  vertex(reyex-eyew, eyey);
  vertex(reyex-eyew-pupS, eyey);
  vertex(reyex-eyew, eyey+eyeh);
  vertex(reyex+(2*eyew),height);
  vertex(width,height);
  vertex(width,0);
  vertex(reyex-eyew, eyey-(0.75*eyeh));
  endShape();
  
  // upper eye lids
  fill(230,200,150);
  stroke(230,200,150);
  strokeWeight(1);
  quad(leyex-eyew, eyey,  leyex, eyey-(eyeh/2),  leyex+eyew, eyey,  leyex, blinkpoint);
  quad(reyex-eyew, eyey,  reyex, eyey-(eyeh/2),  reyex+eyew, eyey,  reyex, blinkpoint);
  
  // lower eye lids
  fill(225,195,145);
  noStroke();
  quad(leyex-eyew, eyey,  leyex, eyey+(eyeh/2),  leyex+eyew, eyey,  leyex, eyey+(eyeh/4));
  quad(reyex-eyew, eyey,  reyex, eyey+(eyeh/2),  reyex+eyew, eyey,  reyex, eyey+(eyeh/4));
  
}

// blink animation
void mouseClicked() {
 
  if (blinkcheck) {
        blinkpoint = eyey+(eyeh/4);
        blinkcheck = false;
  } else {
   blinkpoint = eyey-(eyeh/4);
   blinkcheck = true;
  }
}

