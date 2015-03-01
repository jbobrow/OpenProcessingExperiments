
float y = 0;
int z = 0;
int w =0;
int basDesDents = 400;
int tailleDesDents = 1;
int hautDesDents = 370;

Monstre m = new Monstre();

void setup(){

  size(700,700);
  noFill();
  smooth();
  //noCursor();
  m.echelle = 0.5;
  m.angle = 0;

}

void draw(){
  if(pmouseY<mouseY){
    y -= 2;
  }
  else if(pmouseY>mouseY){
    y +=2;
  }
  dessineRectangleDuFond();
  m.x = mouseX-170;
  m.y1 = mouseY-170;

  //m.echelle += 0.01;
  m.dessineToi();


  //filter(DILATE);
}

void dessineRectangleDuFond(){
  fill(0,20);
  rect(0-width,0-height,height*2,width*2);
}


class Monstre {

  float x, y1;
  float echelle;

  float angle;


  void dessineLesDents(){
    fill(255,60);
    beginShape();
    strokeWeight(3);
    stroke(0,0,0,80);
    line(180,y+330,210,y+basDesDents+tailleDesDents);
    line(210,y+basDesDents+tailleDesDents,240,y+hautDesDents);
    line(240,y+hautDesDents,270,y+basDesDents+tailleDesDents);
    line(270,y+basDesDents+tailleDesDents,300,y+hautDesDents);
    line(300,y+hautDesDents,330,y+basDesDents+tailleDesDents);
    line(330,y+basDesDents+tailleDesDents,360,y+hautDesDents);
    line(360,y+hautDesDents,390,y+basDesDents+tailleDesDents);
    line(390,y+basDesDents+tailleDesDents,420,y+hautDesDents);
    line(420,y+hautDesDents,440,y+basDesDents+tailleDesDents);
    line(440,y+basDesDents+tailleDesDents,480,y+330);
    line(480,y+330,430,y+430);
    line(430,y+430,210,y+430);
    line(210,y+430,180,y+330);
    endShape();


  }
  void dessineLesYeux(int R,int G,int B){
    strokeWeight(3);
    fill(R,G,B);
    beginShape();
    bezier(210-w,270+y,230-w,280+y+z,260-w,290+y+z,290,330+y);
    bezier(210-w,270+y,230-w,300+y+z,260-w,310+y+z,290,330+y);
    endShape();
    beginShape();
    bezier(450+w,270+y,430+w,280+y+z,basDesDents+w,290+y+z,hautDesDents,330+y);
    bezier(450+w,270+y,430+w,300+y+z,basDesDents+w,310+y+z,hautDesDents,330+y);
    endShape();
  }

  void dessineToi(){
    translate(x, y1);
    scale(echelle);
    scale(1);
    dessineLesDents();
    dessineLesYeux(0,0,0);
    //filter(BLUR,0);
    for(int i = 0;i<500;i++){
      noFill();
      strokeWeight(1);
      stroke(0,50);
      rect(random(width),random(height),60,6);

    }
    fill(150,random(60)+10);
    ellipse(330,350,400,400);
    if(mousePressed){
      z +=3 ;
      w +=2;
      filter(ERODE);
    }
    if(keyPressed){

      y = 0;
      w = 0;
      z = 0;

    }
  }
}
