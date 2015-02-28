
//to go with http://www.mathemagician.net/town.html
//scroll to void setup() to alter values
int sizeX;
int sizeY;
int population;
boolean sewer=false;
int sewerCounter=0;
int sewerSize;
int sewerTotal;
boolean wall1=false;
boolean wall2=false;
boolean wall3=false;
int locationX;
int locationY;
int houseCounter = 0;//lightgrey
int houseSize;
int houseTotal;
int blacksmithCounter = 0;//orange
int blacksmithSize;
int blacksmithTotal;
int magicCounter = 0;//darkblue
int magicSize;
int magicTotal;
int scrollandpotionCounter = 0;//lightblue
int scrollandpotionSize;
int scrollandpotionTotal;
int jewelryCounter = 0;//yellow
int jewelrySize;
int jewelryTotal;
int generalCounter = 0;//darkgreen
int generalSize;
int generalTotal;
int tavernCounter = 0;//lightgreen
int tavernSize;
int tavernTotal;
int townguardCounter = 0;//red
int townguardSize;
int townguardTotal;
int militiaCounter = 0;//pink
int militiaSize;
int militiaTotal;
int powercenterCounter = 0;//purple
int powercenterSize;
int powercenterTotal;
int pixelLocation1;
int pixelLocation2;
int pixelLocation3;
int pixelLocation4;

void setup() {
  frameRate(1000000);
  
  //**************************************************
  
  population=339;
  powercenterTotal=1;
  townguardTotal=1;
  militiaTotal=1;
  blacksmithTotal=1;
  magicTotal=0;
  scrollandpotionTotal=1;
  jewelryTotal=1;
  generalTotal=1;
  tavernTotal=1;
  
  //**************************************************
  
  if (population>0 && population<=80) {sizeX=100; sizeY=sizeX;}
  if (population>80 && population<=400) {sizeX=200; sizeY=sizeX; sewer=true;}
  if (population>400 && population<=900) {sizeX=300; sizeY=sizeX; sewer=true;}
  if (population>900 && population<=2000) {sizeX=400; sizeY=sizeX; sewer=true; wall1=true;}
  if (population>2000 && population<=5000) {sizeX=550; sizeY=sizeX; sewer=true; wall1=true;}
  if (population>5000 && population<=12000) {sizeX=700; sizeY=700; sewer=true; wall1=true; wall2=true;}
  if (population>12000 && population<=25000) {sizeX=1000; sizeY=850; sewer=true; wall1=true; wall2=true;}
  if (population>25000 && population<=50000) {sizeX=1250; sizeY=850; sewer=true; wall1=true; wall2=true; wall3=true;}
  if (population>50000) {sizeX=1500; sizeY=850; sewer=true; wall1=true; wall2=true; wall3=true;}
  size(sizeX, sizeY);
  background(255);
  rectMode(CENTER);
  houseSize=5;
  houseTotal=population/2;
  jewelrySize=10;
  scrollandpotionSize=15;
  magicSize=20;
  blacksmithSize=25;
  generalSize=30;
  tavernSize=35;
  militiaSize=40;
  townguardSize=45;
  powercenterSize=50;  
  sewerSize=10;
  sewerTotal=population/100;
  fill(0);
  while(sewer==true && sewerCounter<sewerTotal){ellipse(random(width/10, width-width/10),random(height/10, height-height/10),sewerSize,sewerSize); sewerCounter++;}
  noFill();
  strokeWeight(10);
  if(wall1==true){rect(width/2,height/2,width-width/9,height-height/9);}  
  if(wall2==true){rect(width/2,height/2,width-width/15,height-height/15);}
  if(wall3==true){rect(width/2,height/2,width-width/50,height-height/50);}
  strokeWeight(1);
}

void draw() {
  locationX=int(random(width/10, width-width/10));
  locationY=int(random(height/10, height-height/10));
  pixelLocation1=(locationX-houseSize) + ((locationY-houseSize)*width);
  pixelLocation2=(locationX+houseSize) + ((locationY-houseSize)*width);
  pixelLocation3=(locationX-houseSize) + ((locationY+houseSize)*width);
  pixelLocation4=(locationX+houseSize) + ((locationY+houseSize)*width);
  loadPixels();
  if ((houseCounter<houseTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(200, 200, 200, 150);
    rect(locationX, locationY, houseSize, houseSize);
    houseCounter=houseCounter+1;
  }
  else if ((blacksmithCounter<blacksmithTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(200, 100, 0, 150);
    rect(locationX, locationY, blacksmithSize, blacksmithSize);
    line(locationX-blacksmithSize/2, locationY-blacksmithSize/2, locationX+blacksmithSize/2, locationY+blacksmithSize/2);
    line(locationX-blacksmithSize/2, locationY+blacksmithSize/2, locationX+blacksmithSize/2, locationY-blacksmithSize/2);
    blacksmithCounter=blacksmithCounter+1;
  }
  else if ((magicCounter<magicTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(0, 0, 255, 150);
    rect(locationX, locationY, magicSize, magicSize);
    line(locationX-magicSize/2, locationY-magicSize/2, locationX+magicSize/2, locationY+magicSize/2);
    line(locationX-magicSize/2, locationY+magicSize/2, locationX+magicSize/2, locationY-magicSize/2);
    magicCounter=magicCounter+1;
  }
  else if ((scrollandpotionCounter<scrollandpotionTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(150, 150, 255, 150);
    rect(locationX, locationY, scrollandpotionSize, scrollandpotionSize);
    line(locationX-scrollandpotionSize/2, locationY-scrollandpotionSize/2, locationX+scrollandpotionSize/2, locationY+scrollandpotionSize/2);
    line(locationX-scrollandpotionSize/2, locationY+scrollandpotionSize/2, locationX+scrollandpotionSize/2, locationY-scrollandpotionSize/2);
    scrollandpotionCounter=scrollandpotionCounter+1;
  }
  else if ((jewelryCounter<jewelryTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(255, 255, 0, 150);
    rect(locationX, locationY, jewelrySize, jewelrySize);
    line(locationX-jewelrySize/2, locationY-jewelrySize/2, locationX+jewelrySize/2, locationY+jewelrySize/2);
    line(locationX-jewelrySize/2, locationY+jewelrySize/2, locationX+jewelrySize/2, locationY-jewelrySize/2);
    jewelryCounter=jewelryCounter+1;
  }
  else if ((generalCounter<generalTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(0, 100, 0, 150);
    rect(locationX, locationY, generalSize, generalSize);
    line(locationX-generalSize/2, locationY-generalSize/2, locationX+generalSize/2, locationY+generalSize/2);
    line(locationX-generalSize/2, locationY+generalSize/2, locationX+generalSize/2, locationY-generalSize/2);
    generalCounter=generalCounter+1;
  }
  else if ((tavernCounter<tavernTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(0, 255, 0, 150);
    rect(locationX, locationY, tavernSize, tavernSize);
    line(locationX-tavernSize/2, locationY-tavernSize/2, locationX+tavernSize/2, locationY+tavernSize/2);
    line(locationX-tavernSize/2, locationY+tavernSize/2, locationX+tavernSize/2, locationY-tavernSize/2);
    tavernCounter=tavernCounter+1;
  }
  else if ((townguardCounter<townguardTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(150, 0, 0, 150);
    rect(locationX, locationY, townguardSize, townguardSize);
    line(locationX-townguardSize/2, locationY-townguardSize/2, locationX+townguardSize/2, locationY+townguardSize/2);
    line(locationX-townguardSize/2, locationY+townguardSize/2, locationX+townguardSize/2, locationY-townguardSize/2);
    townguardCounter=townguardCounter+1;
  }
  else if ((militiaCounter<militiaTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(255, 100, 100, 150);
    rect(locationX, locationY, militiaSize, militiaSize);
    line(locationX-militiaSize/2, locationY-militiaSize/2, locationX+militiaSize/2, locationY+militiaSize/2);
    line(locationX-militiaSize/2, locationY+militiaSize/2, locationX+militiaSize/2, locationY-militiaSize/2);
    militiaCounter=militiaCounter+1;
  }
  else if ((powercenterCounter<powercenterTotal) && (brightness(pixels[pixelLocation1]) == 255) && (brightness(pixels[pixelLocation2]) == 255) && (brightness(pixels[pixelLocation3]) == 255) && (brightness(pixels[pixelLocation4]) == 255)) {
    fill(255, 0, 255, 150);
    rect(locationX, locationY, powercenterSize, powercenterSize);
    line(locationX-powercenterSize/2, locationY-powercenterSize/2, locationX+powercenterSize/2, locationY+powercenterSize/2);
    line(locationX-powercenterSize/2, locationY+powercenterSize/2, locationX+powercenterSize/2, locationY-powercenterSize/2);
    powercenterCounter=powercenterCounter+1;
  }
}

void keyReleased(){
  save("citygenerator.tif");
}
