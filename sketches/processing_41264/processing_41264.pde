

float r = 160;
float g = 0;
float b = 10;
int rectSize = 0;
float seed = 20;
float var = 0;
float thick = 1;
boolean pres = false;

void setup() {
  size (500,500);
  noCursor();
  smooth();
    rectMode(CORNER);
}

void draw() {




  noStroke();




  if (mouseX > width/2 && mouseY < height/2) {
    //destra in alto dello schermo
    r=r-1;
    b=b+1;
    background(r,0,b);
    fill(r,0,mouseY/2);
    rect(width/2, 0,width/2,height/2);
  } 
  else if (mouseX > width/2 && mouseY > height/2) {
    //destra basso
    r=r-1;
    b=b+1;
    background(r,0,b);
    fill(r,mouseX/2,mouseY/2);
    rect(width/2, height/2,width/2,height/2);
  }
  else if (mouseX < width/2 && mouseY > height/2) {
    //sinistra basso
    r=r+1;
    b=b-1;
    background(r,0,b);
    fill(b,mouseY/2+mouseX/2,r);
    rect(0,height/2,width/2,height/2);
  } 
  else {
    //sinistra alto
    r=r+1;
    b=b-1;

    background(r,0,b);
    fill(b,mouseY/2,r);
    rect(0,0,width/2,height/2);
  }
  
  g=g+1;
  // effetto speciale 

  if (pres) {

    rectSize ++;
    noFill();
    //stroke( constrain(mouseY/2,0,255),seed,constrain(mouseX/2,0,255));
    stroke(g, g , g);
    strokeWeight(thick);
    rect(width/2-rectSize/2,height/2-rectSize/2,rectSize,rectSize);
    rect(width/2-rectSize/2+seed/2,height/2-rectSize/2+seed/2,rectSize-seed,rectSize-seed);

    rect(width/2-rectSize/2+(seed/var)/2,height/2-rectSize/2+(seed/var)/2,rectSize-seed/var,rectSize-seed/var);
    rect(width/2-rectSize/2+(seed/var/1.1)/2,height/2-rectSize/2+(seed/var/1.1)/2,rectSize-seed/var/1.1,rectSize-seed/var/1.1);
    rect(width/2-rectSize/2+(seed/var/1.3)/2,height/2-rectSize/2+(seed/var/1.3)/2,rectSize-seed/var/1.3,rectSize-seed/var/1.3);
    rect(width/2-rectSize/2+(seed/var/1.8)/2,height/2-rectSize/2+(seed/var/1.8)/2,rectSize-seed/var/1.8,rectSize-seed/var/1.8);
    rect(width/2-rectSize/2+(seed/var*1.3)/2,height/2-rectSize/2+(seed/var*1.3)/2,rectSize-seed/var*1.3,rectSize-seed/var*1.3);
    rect(width/2-rectSize/2+(seed/var*1.8)/2,height/2-rectSize/2+(seed/var*1.8)/2,rectSize-seed/var*1.8,rectSize-seed/var*1.8);
  }


  //vincola il valore massimo e minimo di r e di b
  //constrain(r,0,200);
  //constrain(b,0,255);
  if (r > 255) {
    r=255;
  } 
  else if (r<0) {
    r=0;
  }

  if (b > 255) {
    b=0;
  } 
  else if (b<0) {
    b=255;
  }
  if (g > 255) {
    g=0;
  } 
  else if (g<0) {
    g=0;
  }

//spessore linea effetto speciale
  if (mouseY > width /2) {
    thick= thick + 0.12 ;
  }
  else {
    thick= thick - 0.12 ;
  }
    if (thick > 18) {
    thick=18;
  } 
  else if (thick<2) {
    thick=2;
  }
  //puntatore mouse
  
  fill(mouseX/2,255,mouseY/2);
  ellipse(mouseX,mouseY,30,30);
}


void mousePressed() {
  pres = !pres;
  rectSize=0;
  seed = random (0,100) + constrain(mouseX/2,10,350);
  var = random (0,1);
  println(seed);
}  


