
class ArticleCirc { // give Classes names that begin with a capital letter to differentiate
  float x1;
  float y1;
  int maxdiam;
  boolean mouse;
  float r1;
  float g1;
  float b1;
  int md;
  String title = "";

  ArticleCirc(int maxdiam_, float rr, float gg, float bb) { 
    x1 = width/2;
    y1 = height/2-60;
    maxdiam = maxdiam_;
    mouse = false;
    r1 = rr;
    g1 = gg;
    b1 = bb;
  }

  void display(int i) {
    pushMatrix();
    translate(x1,y1);
    md = maxdiam - i;
    int d = md + 8*md;
    if (mouse) { 
      //      noFill();
      stroke(255,25);
      strokeWeight(.02);
      //      stroke(255,0,0);
      float r2 = r1+d/10;
      float g2 = g1+d/10;
      float b2 = b1+d/10;
      fill(r2,g2,b2);
    }  
    else {
      stroke(255,10);
      strokeWeight(.02);
      float r3 = r1+d/8;
      float g3 = g1+d/8;
      float b3 = b1+d/8;
      fill(r3,g3,b3);
    }
    ellipse(0,0,d,d);
    popMatrix();
  }


  void rollText(int i) {
    //    if(textBox) {
    //    }
    md = maxdiam - i;
    int d = md + 8*md;
    if (mouse) { 
      textFont(f2, 22);
      fill(255);
      textAlign(LEFT);
      if (titleArray[i] != null) text(titleArray[i],35,height-110);
      textFont(f2, 16);
      fill(255,150);
      textAlign(LEFT);
      textLeading(22);
      if (bodyArray[i] != null) text(bodyArray[i],35,height-95, 850, 90);
      textFont(f, 10);
      fill(0,150);
      if (titleArray[i] != null) {  
        float top = y1-md*3.25; 
        float left = x1-md*3.5;
        float topScreen = constrain(top, 20,600); 
        if (topScreen == 20) left = (left-8);
        text("article: "+md,left,topScreen);
      }
      println(titleArray[i] +" "+ i);
      println(bodyArray[i] +" "+ i);
    }
  }


  void boxText(String sWord1, String sWord2) {
    if (clear && offsetCount>1) {
      adTotal = 0;
      xx = 0;
      fill(255);
      rect(0,0,width,height);
      redraw();
    }
    noStroke();
    fill(0,220);
    rect(0,height-150,width,height);
    textFont(f, 28);
    fill(0,200);
    textAlign(RIGHT);
    text(tt2,170,height/2-82);
    textFont(f, 13);
    text("occurences",170,height/2-67);
    text("of the word",170,height/2-51);
    text("\""+sWord1+"\"",170,height/2-35);

    textFont(f, 28);
    fill(0,200);
    textAlign(LEFT);
    text(tt3,830,height/2-82);
    textFont(f, 13);
    text("occurences",830,height/2-67);
    text("of the word",830,height/2-51);
    text("\""+sWord2+"\"",830,height/2-35);

    imageMode(CENTER);
    image(myImage, width/2,35); 
    textFont(f, 18);
    fill(0);
    textAlign(CENTER);
    text("KEYWORD CROSS SECTION",width/2,80);

    fill(0,20);
    noStroke();
    //    ellipse(140,height/2-65,140,140);
    //    ellipse(860,height/2-65,140,140);
    //    arc(170, height/2-68, 70, 70, PI+HALF_PI, TWO_PI+HALF_PI);
    //    arc(830, height/2-68, 70, 70, HALF_PI, PI+HALF_PI);
  }


  void rollover(int i) { 
    md = maxdiam - i;
    int dia = md +8*md;
    float mouseDist= dist(mouseX,mouseY,x1,y1);
    if (mouseDist>=dia/2.0-2 && mouseDist<=dia/2.0+2) {
      mouse = true;
    } 
    else {
      mouse = false;
    }
  }


  void textDisplay() { 
    noFill();
    strokeWeight(.02);
    stroke(200);
    int dee = 50 +8*50;
    int ree = 100 +8*100;
    ellipse(x1,y1,dee,dee);
    ellipse(x1,y1,ree,ree);

    textFont(f, 120);
    fill(0,30);
    textAlign(CENTER);
    text(total,x1,height/2-20);
    textFont(f, 25);
    text("cross section",x1,height/2+5);
    text("matches",width/2,height/2+30);
  }
}// end class


