


int posx;
int posy;
int posa;
int posb;

int lastSavedTime; // for images
PImage[] imageArray= new PImage[12]; //for images
int imageCounter=0;//for images

void setup(){
  background(30);
  size(1000,700);

  imageArray[0]= loadImage("children.jpg"); //for images
  imageArray[1]= loadImage("haiti3.jpg");
  imageArray[2]= loadImage("Haititenttown.jpg"); //for images
  imageArray[3]= loadImage("market-port-au-prince.jpg"); //for images
  imageArray[4]= loadImage("papadoc.jpg"); //for images
  imageArray[5]= loadImage("big.jpg"); //for images
  imageArray[6]= loadImage("black.jpg"); //for images
  imageArray[7]= loadImage("haiti3.jpg"); //for images
  imageArray[8]= loadImage("water.jpg"); //for images
  imageArray[9]= loadImage("blue.jpg"); //for images
  imageArray[10]= loadImage("tenttown.jpg"); //for images
  imageArray[11]= loadImage("haitian-slum.jpg"); //for images
  
//  textArray[0]= text("filler"); //writes text
//  textArray[1]= text("fillera"); //writes text
//  textArray[2]= text("fillerb"); //writes text
//  textArray[3]= text("fillerc"); //writes text
//  textArray[4]= text("fillerd"); //writes text
//  textArray[5]= text("fillere"); //writes text
//  textArray[6]= text("fillerf"); //writes text
//  textArray[7]= text("fillerg"); //writes text
//  textArray[8]= text("fillerh"); //writes text
     
  fill(0);
  stroke(55);
  strokeWeight(15);
  rect(500,70,450,340);
  strokeWeight(1);
}


void draw(){
  posx=mouseX-(mouseX%10);
  posy=mouseY-(mouseY%10);
//  posa=mouseX++;
//  posb=mouseY++;
  
  if(mousePressed == true){
  
      strokeWeight(0);
      fill(0,random(255),0,5);
      rect(posx,posy,10,10);

  } else if(keyPressed){
    if(key=='s'){
     fill(1,0,130,15); 
     strokeWeight(0); 
      rect(posx,posy,60,60);  
    } else if(keyPressed){
      if(key=='f'){
        strokeWeight(1);  
        fill(255);  
        triangle(posx,posy,posx++,posy++,posx+=5,posy+=5);  
      }
    } else if(keyPressed){
      if(key=='a'){
        noStroke();  
        fill(0);  
        rect(posx,posy,60,60);
  
      }
    }


    imageMode(CORNER);
    image(imageArray[imageCounter],50,70,450,340);
    if(millis()-lastSavedTime >500){
      if(imageCounter<imageArray.length-1){
        imageCounter ++;
      } else{
        imageCounter= 0;
      }
      lastSavedTime= millis();
    }
         tint(255,15);
  }
  noFill();
  stroke(55);
  rect(50,70,450,340);
  fill(0);
 
  noFill();
  strokeWeight(15);
  rect(50,405,900,287);
  fill(0);
 
  textAlign(CENTER);
  
  PFont AndaleMono;
  AndaleMono = loadFont("AndaleMono-32.vlw");
  textFont(AndaleMono, 15);
  fill(255);
  text("...", -10, 20);
  if(keyPressed && key=='f'){ //this is going to change
    fill(0, 10);
    rect(500,70,450,340);
    fill(255);
    text("An estimated 634,000",728,150);
    text("cholera outbreaks",730,380);
    text("himself governor-general of an autonomous",760, 790);
  } else {
      text("are still displaced", 730,250);
      text("death", 730,350);

  }
    textFont(AndaleMono, 32);
  fill(255);
  text("Make a Mark", 180,55);

}




//if(textArray[textCounter], 130,20);
//  if(millis()-lastSavedTime>20000{
//    if(textCounter<textArray.length-1){
//      textCounter++;
//	}else{
//          textCounter=0;
//            rect(500,70,450,340);
//              fill(255);
//}
//            lastSavedTime=millis();
  
    

