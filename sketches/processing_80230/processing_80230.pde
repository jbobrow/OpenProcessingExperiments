
boolean eqOn = false;
boolean mouseoverapplet;
boolean buttonover = false;
boolean buttoneffectcomplete = false;
   
int swidth = 800;
int sheight = 400;
int spawny = 0;
int spawny2 = 400;
int smaxnum = int(random(40,50));
int sizelimit = 4;
sqPixel[] sqPixels = new sqPixel[smaxnum];

PImage img; 

//Coords for button rollovers
int imgHX = 135;
int imgHY = 138;
int imgPX = 216;
int imgPY = 138;
int imgSX = 384;
int imgSY = 138;
int imgCX = 539;
int imgCY = 138;
  
int zzz = 0;
int buttonOver = 0;
int speed = 1;
 
void setup()
{
  size(400,400);
  img = loadImage ("07.png"); 
  frameRate(30);
  stroke(#000000,0);


  for(int i = 0; i < smaxnum; i = i + 1){
    //sqPixel 
    sqPixels[i] = new sqPixel(random(0,175),random(0,10),random(swidth),random(spawny, spawny2),random(0.5,0.99),1,0,0);
  } 
}
  
void draw() {
background(255);
image(img, 0, 0); 

  
 for(int i = 0; i < smaxnum; i = i + 1){
 sqPixels[i].update();
 if (sqPixels[i].sqOpacity < 10) {          
   if(mouseoverapplet){
     //THIS IS CHECKING MOUSE OVER APPLET  
     float z1 = random(1,20) * 10;
     float z2 = random(1,20) * 10;
     if(buttonOver > 0){
        sqPixels[i] = new sqPixel(random(0,175),random(0,6),(mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1)),(mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2)),random(0.5,0.99),1,mouseX,mouseY);
     }else{
        sqPixels[i] = new sqPixel(random(0,175),random(0,6),(mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1)),(mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2)),random(0.5,0.99),1,0,0);   
     } }else{
        sqPixels[i] = new sqPixel(random(0,175),random(0,6),random(swidth),random(spawny, spawny2),random(0.5,0.99),1,0,0);
       }
    }
  } 
  

  if(zzz > 0){
      zzz = zzz + 1;
  }
  if(mouseoverapplet == true){
    drawbuttons();
  }
}
   
   
class sqPixel {
 float sqOpacity, sqSize, sqX, sqY, sqSP, sqBehave, sqTX, sqTY;
 sqPixel (float pixO, float pixS, float pixX, float pixY, float pixSP, float pixBehave, float targetX, float targetY){
  sqOpacity = pixO;
  sqSize = pixS;
  sqX = pixX;
  sqY = pixY;
  sqSP = pixSP;
  sqTX = targetX;
  sqTY = targetY;
 }
  
 void update() {
  if (sqBehave == 2){
    sqSize -= sqSP;
    if (sqSize < 0){
      //sqPixels = new sqPixel(random(0,175),random(0,6),random(swidth),random(spawny, spawny2),random(0,0.99),1);
      sqOpacity = 0;
      sqSize = random(0,sizelimit);
      //sqX = random(0,swidth);
      //sqY = random(spawny, spawny2);
      sqSP = random(0.5,0.99);
      if((mouseX != 0) && (mouseY != 0)){
        sqX = mouseX; //(mouseX - random(0,(sqSP * 50))) + random(0,(sqSP * 50));
        sqY = mouseY; //(mouseY - random(0,(sqSP * 50))) + random(0,(sqSP * 50));  
        }else{
          sqX = random(0,swidth);
          sqY = random(spawny, spawny2);
          }
        sqBehave = 1;
        sqTX = 0;
        sqTY = 0;    
      }
    }else{
      sqSize += sqSP;
      if (sqSize > sizelimit){
        sqBehave = 2;
      }
    }
     
    sqY = sqY + sqSP;
    sqOpacity += (sqSP + sqSize);
    fill(#FFFFFF,sqOpacity);
  
//pointLight(51, 102, 126, sqX, sqY, 0);
if((mouseX != 0) && (mouseY != 0)){
  sqTX = random(0,30) + mouseX;
  sqTY = random(0,30) + mouseY;
  if(sqTX > sqX){
    sqX = sqX + sqSP;
  }else{
    sqX = sqX - sqSP;
  }
    
  if(sqTY > sqY){
    sqY = sqY + sqSP;
  }else{
    sqY = sqY - sqSP;
  }
}
    rect(sqX, sqY, sqSize, sqSize);
  }
}
  
void drawbuttons(){
cursor(ARROW);
if((mouseX > imgHX) && (mouseX < 216) && (mouseY > imgHY) && (mouseY < (imgHY + 37))) {
 //ADD THE FADEIN CODE HERE
 if((buttonOver > 1) || (buttonOver == 0)){
   zzz = 0;
 }
 if(zzz == 0){
   zzz = zzz + 1;
 }
if((zzz < 30) && (zzz > 0)){
  tint(255,int(10 * zzz));

  tint(255,255);
 }else{
  zzz = -1;
  tint(255,255);

 }
 
//image(imgHome, imgHX, imgHY);
for(int i = 0; i < smaxnum; i = i + 1){
  float z1 = random(1,20) * 10;
  float z2 = random(1,20) * 10;
  //sqPixels[i] = new sqPixel(random(0,175),random(0,6),(mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1)),(mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2)),random(0.5,0.99),1,0,0);
  sqPixels[i].sqTX = (mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1));
  sqPixels[i].sqTY = (mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2));
  buttonOver = 1; 
  cursor(HAND);
  //image(tipHome,mouseX + 15,mouseY - 15);
} 
  }else{
   // buttonOver = 0;
  cursor(ARROW);
  if((mouseX > imgPX) && (mouseX < (imgPX + 168)) && (mouseY > imgPY) && (mouseY < (imgPY + 37))) {  
     //image(imgPort, imgPX, imgHY);
     //ADD THE FADEIN CODE HERE
   if((buttonOver > 2) || (buttonOver < 2)){
     zzz = 0;
   }
 if(zzz == 0){
   zzz = zzz + 1;
 }
if((zzz < 30) && (zzz > 0)){
    tint(255,int(10 * zzz));

    tint(255,255);
   }else{
     zzz = -1;
     tint(255,255);

   }
  
    
  for(int i = 0; i < smaxnum; i = i + 1){
    float z1 = random(1,20) * 10;
    float z2 = random(1,20) * 10;
    sqPixels[i].sqTX = (mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1));
    sqPixels[i].sqTY = (mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2));   
    buttonOver = 2;
    cursor(HAND);
  } 
  }else{
   // zzz = 0;
   // buttonOver = 0;
    cursor(ARROW);
    if((mouseX > imgSX) && (mouseX < (imgSX + 155)) && (mouseY > imgSY) && (mouseY < (imgSY + 37))) {    
    //ADD THE FADEIN CODE HERE
    if((buttonOver > 3) || (buttonOver < 3)){
    zzz = 0;
   }
 if(zzz == 0){
   zzz = zzz + 1;
 }
if((zzz < 30) && (zzz > 0)){
    tint(255,int(10 * zzz));

    tint(255,255);
   }else{
     zzz = -1;
     tint(255,255);

   }
     
  //image(imgServ, imgSX, imgHY);
   for(int i = 0; i < smaxnum; i = i + 1){
      float z1 = random(1,20) * 10;
      float z2 = random(1,20) * 10;
      sqPixels[i].sqTX = (mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1));
      sqPixels[i].sqTY = (mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2));
      buttonOver = 3;
      cursor(HAND);
  } 
  }else{
   // buttonOver = 0;
    cursor(ARROW);
    if((mouseX > imgCX) && (mouseX < (imgCX + 132)) && (mouseY > imgCY) && (mouseY < (imgCY + 37))) {
      //ADD THE FADEIN CODE HERE
      if((buttonOver < 4)){
         zzz = 0;
      }
      if(zzz == 0){
        zzz = zzz + 1;
      }
       
if((zzz < 30) && (zzz > 0)){
   tint(255,int(10 * zzz));

   tint(255,255);
   }else{
     zzz = -1;
     tint(255,255);

  }
     
  //image(imgCont, imgCX, imgHY);
   for(int i = 0; i < smaxnum; i = i + 1){
      float z1 = random(1,20) * 10;
      float z2 = random(1,20) * 10;
      sqPixels[i].sqTX = (mouseX - random(0,(random(0.5,0.99) * z1))) + random(0,(random(0.5,0.99) * z1));
      sqPixels[i].sqTY = (mouseY - random(0,(random(0.5,0.99) * z2))) + random(0,(random(0.5,0.99) * z2));
      buttonOver = 4;
      cursor(HAND);
   }
 }else{
      buttonOver = 0;
      zzz = 0;
    } 
   }
  }
 } 
}
  
  
void mousePressed() { 
  if(buttonOver == 1){
    link("http://www.vacationhomepublications.com/freshtest/home.html","mainFrame"); 
  }else{
    if(buttonOver == 2){
      link("http://www.vacationhomepublications.com/freshtest/2.html","mainFrame"); 
    }else{
      if(buttonOver == 3){
        link("http://www.vacationhomepublications.com/freshtest/3.html","mainFrame"); 
      }else{
        if(buttonOver == 4){
          link("http://www.vacationhomepublications.com/freshtest/4.html","mainFrame"); 
        }
      }}}}
  
  
void mouseEntered(MouseEvent mouseEvent) {
  mouseoverapplet = true;
 // feedback = "entered at: " + mouseEvent.getPoint().x + "," + mouseEvent.getPoint().y + "nmouseX/mouseY: " + mouseX + "," + mouseY;
}
  
void mouseExited(MouseEvent mouseEvent) {
  mouseoverapplet = false;
  buttonOver = 0;
  zzz = 0;
  //feedback = "exited at: " + mouseEvent.getPoint().x + "," + mouseEvent.getPoint().y + "nmouseX/mouseY: " + mouseX + "," + mouseY;
} 

void mouseClicked() { 
  mouseoverapplet = false; 
  speed += 100;
}

