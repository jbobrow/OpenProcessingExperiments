
buttons bs;
switchColor sc;
strokeSet st;

void setup() {
  size(800,600);
  background(255);
  smooth();
  cursor(CROSS);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(15);
  bs=new buttons(random(255), random(255), random(255), random(-random(2, 5), random(2, 5)), 
  random(-random(2, 5), random(2, 5)), random(-random(2, 5), random(2, 5)));
  sc=new switchColor(random(255), random(255), random(255), random(-random(2, 5), random(2, 5)), 
  random(-random(2, 5), random(2, 5)), random(-random(2, 5), random(2, 5)));
  st=new strokeSet(0.2, 1);
}

void draw() {
  bs.update();
  bs.display();
  if (mouseButton==RIGHT) {
    background(255);
    bs.display();
  }
}

void mouseDragged() {
  sc.update();
  sc.display();
  st.update();
  st.display();
}


class buttons {
  float R, G, B, amR, amG, amB;
  buttons(float R, float G, float B, float amR, float amG, float amB) {
    this.R=R;
    this.G=G;
    this.B=B;
    this.amR=amR;
    this.amG=amG;
    this.amB=amB;
  }

  void update() {
    if (R>255 || R<0) {
      amR=random(-random(2, 5), random(2, 5));
    }
    if (G>255 || G<0) {
      amG=random(-random(2, 5), random(2, 5));
    }
    if (B>255 || B<0) {
      amB=random(-random(2, 5), random(2, 5));
    }
    R=R+amR;
    G=G+amG;
    B=B+amB;
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    fill(120);
    rect(width/2, height/20, width-40, height/5);
    fill(255);
    text("--- EPaint --- by Eiichi Ishii / Built with Processing ===> Please press key 0~5", width/2.2, height/8.5);
    fill(0);
    rect(width/5.3, height/20, 50, 30);
    fill(255);
    text("-1-", width/5.3, height/20+5);
    fill(255);
    rect(width/2.6, height/20, 50, 30);
    fill(0);
    text("-2-", width/2.6, height/20+5);
    fill(255, 0, 0);
    rect(width/1.7, height/20, 50, 30);
    fill(0);
    text("-3-", width/1.7, height/20+5);
    fill(0, 255, 0);
    rect(width/1.3, height/20, 50, 30);
    fill(0);
    text("-4-", width/1.3, height/20+5);
    fill(0, 0, 255);
    rect(width/1.06, height/20, 50, 30);
    fill(0);
    text("-5-", width/1.06, height/20+5);
    fill(R, G, B);
    rect(width/1.06, height/8.5, 50, 30);
    fill(0);
    text("-6- →", width/1.11, height/8.5+5);
  }
}

class strokeSet {
  float sw, amount;
  strokeSet(float sw, float amount) {
    this.sw=sw;
    this.amount=amount;
  }

  void update() {
    if (sw>15 || sw<0.2) {
      amount=-amount;
    }
    sw=sw+amount;
  }

  void display() {
    strokeWeight(sw);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

class switchColor {
  float R, G, B, amR, amG, amB;
  switchColor(float R, float G, float B, float amR, float amG, float amB) {
    this.R=R;
    this.G=G;
    this.B=B;
    this.amR=amR;
    this.amG=amG;
    this.amB=amB;
  }

  void update() {
    if (R>255 || R<0) {
      amR=random(-random(2, 5), random(2, 5));
    }
    if (G>255 || G<0) {
      amG=random(-random(2, 5), random(2, 5));
    }
    if (B>255 || B<0) {
      amB=random(-random(2, 5), random(2, 5));
    }
    R=R+amR;
    G=G+amG;
    B=B+amB;
  }

  void display() {
    switch(keyCode) {
    default:
      stroke(0, 200);
      break;
    case'2':
      stroke(255, 200);
      break;
    case'3':  
      stroke(255, 0, 0, 200);
      break;
    case'4':  
      stroke(0, 255, 0, 200);
      break;
    case'5':  
      stroke(0, 0, 255, 200);
      break;
    case'6':
      stroke(R, G, B, 200);
      break;
    }
  }
}
