
/*
var sound0 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-1.wav?_subject_uid=305829285&w=AAA7MjFauONPMw6YaTYV0rQLn1bKATUNPD0locKjXALgJA");
var sound1 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-5.wav?_subject_uid=305829285&w=AABfEtYjIGuc1EHe-c0893o9tyfrdkTmVY81D1d3qzdfgg");
var sound2 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-6.wav?_subject_uid=305829285&w=AAB62EFFVlR0Zbg5td_iXAEHlO98TkeQZfMJDACK69_OsQ");
var sound3 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-11.wav?_subject_uid=305829285&w=AAAh-VCNLiaNtwAdwzcHrv80RfObrzAbee1AYFvIu8Cutw");
var sound4 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-16.wav?_subject_uid=305829285&w=AADJMeNmz9H8tz8KdsYf09Z-Q3TH3CF9X2iWUBIJ_SIthA");
var sound5 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-22.wav?_subject_uid=305829285&w=AACfGqKwcytHfPoEPDETR-EEIK69y3KQLCG7PfvpqasdYg");
var sound6 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-23.wav?_subject_uid=305829285&w=AAAvByPuEp1c9ek1ToIVjMfEmrXtrcerjRBE7ZefsCf25Q");
var sound7 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-29.wav?_subject_uid=305829285&w=AACkOav645ZvFMlCdkVYWx0QLdDIu0nLcDyliuFRaF8Yyw");
var sound8 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-31.wav?_subject_uid=305829285&w=AADu9Ca2V5XQQQT33zZjztrFQHWJ5WzS22yka_LCsKtpEw");
var sound9 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-24.wav?_subject_uid=305829285&w=AADI-YEo5imfnyNKZqjdvE9cf0lLJUWO-tZdAtQiWdWSng");
var sound10 = new Audio("https://dl-web.dropbox.com/get/sounds/sound-36.wav?_subject_uid=305829285&w=AAAXvBkgkIkGDueLQbunXwOcClYqXm5-LFy1MgJabJynFw");
*/

var music = new Audio("https://dl-web.dropbox.com/get/Goddess2.wav?_subject_uid=305829285&w=AABvyH71HFVEDjct6J4QMYL789W7THmgriTKEJJIE2Be1g");


width = 800;
height = 800;

float speed;
float lineWidth;
float dx = 0;
float dy = 0;
float normX = 0.0;
float normY = 0.0;

horizon = 300;

sizeBox = 10;

areaMAX = 600;
areaMIN = 0;
widthMAX = 50;
heightMAX = 100;
heightMIN = 0;

d = 10;
chunk = 25;
 



colorMode(RGB, 100);
void setup() {  //setup function called initially, only once



colorMode(RGB, 100);
size(width, height); 
background(44,44,88);

/*
     sound0.load();
     sound1.load();
     sound2.load();
     sound3.load();
     sound4.load();
     sound5.load();
     sound6.load();
     sound7.load();
     sound8.load();
     sound9.load();
     sound10.load()
*/
     //music.load();
     //music.play();
   
}

void draw() {  //draw function loops 
    
   
 
  speed = dist(pmouseX, pmouseY, mouseX, mouseY); 
  speed = map(speed, 0, 50, 0, 10);
  dx = pmouseX-mouseX;
  dy = pmouseY-mouseY;
  
  lineWidth = map(speed, -10,10,20,0);
  //lineWidth = constrain(lineWidth, 0, 5);
  
  dx = map(dx,-70, 70, -10, 10);
  dx = constrain(dx, -10,10);
  dy = map(dy,-70, 70, -10, 10);
  dy = constrain(dy, -10,10);
  
  
}

void mousePressed(){
/*    
    r = random(10);
    
    switch(int(r)){
    case 0:
    sound0.play();
    break;
    case 1:
    sound1.play();
    break;
    case 2:
    sound2.play();
    break;
    case 3:
    sound3.play();
    break;
    case 4:
    sound4.play();
    break;
    case 5:
    sound5.play();
    break;
    case 6:
    sound6.play();
    break;
    case 7:
    sound7.play();
    break;
    case 8:
    sound8.play();
    break;
    case 9:
    sound9.play();
    break;
    case 10:
    sound10.play();
    break;
    
    
    }
*/
    //music.play();

 
 
    
}

void mouseClicked(){
    
    if (mouseButton == RIGHT) {
     
           lights();
   
    }
}

 void mouseDragged(){
    
    
    if (mouseButton == LEFT) {
        brush();
    }
    
    if (mouseButton == RIGHT) {
        //lane();
    }
    
  
     
    //info();
}


  //line(pmouseX, pmouseY, mouseX, mouseY)
  

void lane() {
    depthFactor = (mouseY-horizon)/50;
    color c = color(0,0,0);
    strokeWeight(depthFactor/2);
    stroke(c);
    if (dist(pmouseX, pmouseY, mouseX, mouseY) > 20){line(pmouseX, pmouseY, mouseX, mouseY);}
    
}


void brush() {
  closeRed = (mouseY-horizon)/10;
  randYellow = int(random(100));
  randBlue = int(random(25))+50;
  greyFactor = int(random(50));
  color w = color(randYellow+closeRed, randYellow, randBlue);
  color c = color(0,0,0);
  stroke(c);
  fill(w);
  strokeWeight(1);
  
  speed = constrain(speed, 0, 10);
  
  if (mouseY > horizon) {
  
      for(j = 0;j < d; j =j + random(d)){
      for(i = 0;i < d; i =i + random(d)){
          
          
          
          depthFactor = (mouseY-horizon)/60;
          heightMAXa = heightMAX * depthFactor/5;
          areaBox = ((10 - speed)/(i)) * ((d - speed)/j);
          boxX = mouseX+dx*(i+j);
          boxY = (mouseY+dy*(i+j))-((d - speed)/j);
          boxW = depthFactor*sizeBox*(10 - speed)/(2*i);
          boxH = depthFactor*sizeBox*(d - speed)/j;
          
          
      
          if((areaBox < areaMAX) && (areaBox > areaMIN) && (boxW < widthMAX) && (boxH < heightMAXa) && (boxH > heightMIN)){
          
          randomBuild = int(random(10));
          randomStyle = int(random(5));
          if (randomBuild > 7) {
              rect(mouseX-boxW, mouseY-boxH, boxW, boxH);
              stroke(0,0,0);
              
              for (iL = mouseX-boxW+2; iL <mouseX-1; iL = iL + 2){
                  for (jL = mouseY-boxH+2; jL <mouseY-1; jL = jL + 4){
                     
                      fillLights(iL, jL);stroke(0,0,0);
                      
                      
                  }
              }
              line(mouseX-boxW, mouseY-1, mouseX, mouseY-1);
          
          
          switch(randomStyle){
              
          
          case 1:
           color w = color(11,11,22);
              stroke(w);
              for(E =  mouseY-boxH; E < mouseY; E = E + 2){
                  line(mouseX - boxW, E, mouseX , E);
              }
           
          break;
          
         case 2:
           color w = color(11,11,22);
              stroke(w);
              for(E =  mouseY-boxH; E < mouseY; E = E + 3){
                  line(mouseX - boxW, E, mouseX , E);
              }
           
          break;
          
          case 3:
           color w = color(11,11,22);
              stroke(w);
              for(E =  mouseY-boxH; E < mouseY; E = E + 6){
                  line(mouseX - boxW, E, mouseX , E);
              }
           
          break;
          
          case 4:
          stroke(0,0,0 );
              line(mouseX - boxW/2, mouseY-boxH ,mouseX - boxW/2,mouseY-boxH-boxH/10);
              line(mouseX - boxW/2-3, mouseY-boxH ,mouseX - boxW/2-3,mouseY-boxH-boxH/15);
              line(mouseX - boxW/2, mouseY-boxH ,mouseX - boxW/2,mouseY-boxH-boxH/15);
          
          break;
          
          case 5:
              
          break;
          
          
          
           } 
          
          
          }
          
          } 
    
  }
  }
  //line(pmouseX, pmouseY, mouseX, mouseY)
  
}


}
void fillLights(int x, int y) {
    rLights = random(100);
    color l = (100,100,100);
    stroke(l);
    
    strokeWeight(1);
    if (rLights > 80) {point(x,y);}
}

void lights() {


  color l = (100,88,88);
  stroke(l);
  fill(l);
  strokeWeight(1);
 
  r = random(10) +2;
  
  for(j = -d;j < d; j =j + r){
  for(i = -d;i < d; i =i + r){
      randRoom = random(10);
      if (randRoom > 7) {point(mouseX + i, mouseY + j);}
      
  }
  }
  //line(pmouseX, pmouseY, mouseX, mouseY)
  
}

void info(){
  stroke(0,0,0);
  fill(0,0,0);
  rect(0,0,100,100);
  
  stroke(100,100,100);
  fill(100,100,100);
  
  
  // output information for debugging. later I will comment out the call.
    font = loadFont("FFScala.ttf"); 

    textFont(font); 

    text("dx:" , 15, 30); 
    text(dx, 30, 30); 

    text("dy:", 15, 40); 
    text( dy, 30, 40); 
    
     text("s:", 15, 50); 
     text( speed, 30, 50); 
    

  
  }
  
  
 
