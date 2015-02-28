
int hoofdX = 120;
int hoofdY = 40;

int oogLX = 130;
int oogLY = 50;

int oogRX = 160;
int oogRY = 50;

int lichaamX = 150;
int lichaamY = 125;

int armLX = 125;
int armLY = 110;
int handLX = 70;
int handLY = 110;

int armRX = 170;
int armRY = 110;
int handRX = 225;
int handRY = 110;

int beenLX = 135;
int beenLY = 155;
int voetLX = 135;
int voetLY = 220;

int beenRX = 160;
int beenRY = 155;
int voetRX = 160;
int voetRY = 220;

void setup(){
  size(300,300);
}

void draw(){
    background(255,255,255);
fill(0,240,0);
rect(hoofdX,hoofdY,60,50);

ellipseMode(ENTER);
fill(255,255,255);
stroke(0,0,0);
ellipse(oogLX,oogLY,10,10);

ellipseMode(ENTER);
fill(255,255,255);
stroke(0,0,0);
ellipse(oogRX,oogRY,10,10);

fill(0,240,0);
ellipseMode(ENTER);
ellipse(lichaamX,lichaamY,50,70);

line(handLX,handLY,armLX,armLY);
line(armRX,armRY,handRX,handRY);

line(beenLX,beenLY ,voetLX,voetLY);
line(beenRX,beenRY,voetRX,voetRY);

hoofdY = hoofdY -1
lichaamY = lichaamY -1
armRY = armRY -1
armLY = armLY -1
beenRY = beenRY -1
beenLY = beenLY -1
oogLY = oogLY -1
oogRY = oogRY -1
handLY = handLY -1
handRY = handRY -1
voetLY = voetLY -1
voetRY = voetRY -1
}

