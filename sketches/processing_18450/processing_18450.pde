
float R=0;
boolean B = true;
boolean V = false;
boolean q = false;
boolean w = false;
boolean e = false;
boolean Z = true;
float G=0;

void setup() {
  size(250,250);
  background(0);
}

void draw() {
  if(B) {
    stroke(0);
    rect(0,0,250,250);
    fill(0,15);
  }

  if(V) {
    translate(mouseX,mouseY);
  
  if(q){stroke(255,0,0);}
  if(w){stroke(0,255,0);}
  if(e){stroke(0,0,255);}
  strokeWeight(2);
  
  rotate(R);
  point(0,10);

  rotate(R*-.2);
  point(0,20);
  
  rotate(R*-1);
  point(0,30);

  rotate(R/2);
  point(0,40);

  translate(100,0);
  rotate(R*-.1+G);
  point(0,50);

  rotate(R*-5);
  point(5,0);
  point(0,0);
  
  R+=.1;
  if(Z){G+=.1;}
}
}

void keyPressed() {
  if (key=='b') {
    if(B) {
      B=false;
    }
    else if(!B) {
      B=true;
    }
  }
  if (key=='v') {
    if(V) {
      V=false;
    }
    else if(!V) {
      V=true;
    }
  }
  if (key=='1') {
    if(q) {
      q=false;
    }
    else if(!q) {
      q=true;
      w=false;
      e=false;
    }
  }
  if (key=='2') {
    if(w) {
      w=false;
    }
    else if(!w) {
      w=true;
      q=false;
      e=false;
    }
  }
  if (key=='3') {
    if(e) {
      e=false;
    }
    else if(!e) {
      e=true;
      w=false;
       q=false;
    }
  }
  if (key=='g'){
    if(Z) {
       Z=false;
    }
    else if(!Z) {
      Z=true;
    }
  }
  if (key=='s'){
    saveFrame("dots.png");
  }
}


