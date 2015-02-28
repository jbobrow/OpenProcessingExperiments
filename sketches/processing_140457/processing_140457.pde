
char[] texte;
PGraphics fond;
PFont typo;

void setup() {
  size(1400,300);
  typo=createFont("Times new roman",128);
  fond = createGraphics(width, height, JAVA2D);
  fond.beginDraw();
  fond.background(0);
  fond.textFont(typo, 128);
  fond.textAlign(CENTER, CENTER);
  fond.endDraw();
  texte = new char[0];
  background(0);
  textAlign(CENTER, CENTER);
  text("start typing text", width/2, height/2);
}

void draw() {
}

void keyReleased() { 
  if (keyCode==8) {
    if (texte.length>0) {
      texte = (char[]) subset(texte, 0, texte.length-1);
    }
    redessine();
  } 
  else if (keyCode>=65 && keyCode<=90 || keyCode==32 || keyCode==54) {
    texte = (char[]) append(texte, key); 
    redessine();
  }   
}

void redessine() {
  String t=new String();
  t=join(texte,"");
  fond.beginDraw();
  fond.background(0);
  fond.text(t, width/2, height/2);
  fond.filter(BLUR, 5);
  fond.text(t, width/2, height/2);
  fond.endDraw();
  background(0);noFill();stroke(255);
  for(int a=0;a<fond.height;a+=4){
    beginShape();
    for(int b=0;b<fond.width;b+=3){
      float c=brightness(fond.get(b,a));
      vertex((b+a*0.4)*1.8-200,(a-c*0.1-b*0.1)*1.8-50);
    } 
    endShape();
  }
}
