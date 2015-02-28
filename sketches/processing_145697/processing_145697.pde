
boolean flipFlop = false;
int diam;
int pupil;

void setup(){
  size(500,500);
  
}
void draw(){
  background(50,50,50);
  if(flipFlop == false){
    diam = 25;
    pupil= 20;
  }else{
    diam = 30;
    pupil = 10;
  }
  translate(250,250);
fill(241,242,218);
rectMode(CENTER);
rect(0, 0, 1500, 1500);
strokeWeight(3);
stroke(0,0,0);
fill(0,0,0);
ellipse(0,0,550,550);
fill(195,255,3);
ellipse(0,0,500,500);
fill(255,255,255);
ellipse(0,0,450,450);
fill(195,255,3);
ellipse(0,0,400,400);
fill(0,0,0);
ellipse(0,0,350,350);
fill(195,225,3);
ellipse(0,0,300,300);
fill(225,225,225);
ellipse(0,0,250,250);
fill(0,0,0);
ellipse(0,0,200,200);
fill(195,225,3);
ellipse(0,0,160,160);
fill(0,24,232);
triangle(0,55,-55,250,55,250);
fill(255,226,180);
ellipse(0,0,250,150);
strokeWeight(3);
stroke(255,255,255);
fill(97,224,229);
ellipse(-37.5,-30,diam,diam);
ellipse(37.5,-30,diam,diam);
noStroke();
fill(0,0,0);
ellipse(-37.5,-30,20,20);
ellipse(37.5,-30,20,20);
fill(255,255,255);
ellipse(-34,-25,5,5);
ellipse(40,-25,5,5);


fill(229,97,122);
arc(-5, 35, 60, 60, 0, PI/1);
fill(17,0,219);
rect(10, -70, 160, 30);
ellipse(0,-120,150,110);
ellipse(-56,-106,50,90);
fill(225,226,180);
noStroke();
fill(240,189,196);
ellipse(-90,10,44,44);
ellipse(90,10,44,44);
noStroke();
fill(240,229,189);
triangle(0,-20,-15,10,15,10);
fill(0,0,0);
ellipse(-5,5,3,5);
ellipse(5,5,3,5);

}

void keyPressed(){
  flipFlop =! flipFlop;
}



