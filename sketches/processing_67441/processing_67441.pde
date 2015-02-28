
int yPos;
int xPos;
float noiseaddition;
float fillamount;
boolean isline;
int gameState;

float angle;

float noiseScale=0.02;

void setup() {
  background(255);
  size(500, 500);
  yPos = height/2;
  xPos = width/2;
  gameState=0;
  smooth();

  fillamount=100;
  noiseaddition=.2;
  isline=true;
}

void draw() {

  for (int x=0; x < width; x++) {
    float noiseVal = noise((mouseX)*noiseScale, mouseY*noiseScale);
    stroke(noiseVal*255);
    //line(x, mouseY+noiseVal*80, x, height);
  }

  noiseaddition = noiseaddition+.05;
  //colorMode(RGB,100);

  // frameRate(1);
  //noStroke();
  // fill(fillamount, 40*noise(noiseaddition));
  //line(pmouseX, pmouseY, mouseX, mouseY);

  float oneSecondOsc = sin( map(millis()%1000, 0, 999, 0, TWO_PI));
  //println(oneSecondOsc * PI/60);
  //float oneSecondOsc2= sin( map(millis()%1000,0,999,PI,));

  //  float xOffset = ;
  //  float yOffset = ;


  if (isline==false) {

    noStroke();
    fill(fillamount, 10 + 50*noise(noiseaddition));
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    filter (BLUR,1);
    rect((sin(oneSecondOsc)*200), (cos(oneSecondOsc)*50), 20, 10);
    popMatrix();
  }

  if (isline==true) {
    stroke(fillamount);
    line(  mouseX+ (sin(oneSecondOsc)*50), mouseY+ (cos(oneSecondOsc)*50), pmouseX, pmouseY);

    //if mousex<=-50{
  }
}

void keyPressed() {

  if (keyCode==UP) {
    fillamount=fillamount-15;
  }

  if (keyCode==DOWN) {
    fillamount=fillamount+15;
  }

  if (key=='l') {
    isline=true;
  }

  if (key=='r') {
    isline=false;
  }

  if (key == 'v') {
    angle+=.01;
  }

  if (key=='s') {
    save("myimage"+int( random(1,100000))+".png");
  }  

  // if(key=='a'){
  // line= line+rotate(.3);
  // }



  //    stroke(fillamount, 40*noise(noiseaddition));
  //    line(pmouseX, pmouseY, mouseX, mouseY);

  //  if (keyCode==UP){
  //    yPos=yPos-1;
  //}

  //if (keyCode==DOWN) {
  // yPos=yPos+1;
  // }

  //if(keyCode==LEFT){
  //xPos=xPos-1;
  //  }

  //  if(keyCode==RIGHT){
  //  xPos=xPos+1;
}



