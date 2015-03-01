
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


width = 1000;
height = 1000;
background(0);
float speed;
float lineWidth;
float dx = 0;
float dy = 0;
float normX = 0.0;
float normY = 0.0;
int r = 0;
int b = 100;
int g = 55;

areaMAX = 300;
widthMAX = 100;
heightMAX = 50;

d = 10;
chunk = 25;
 
int[] speedA = new int[100];



void setup() {  //setup function called initially, only once



colorMode(RGB, 100);
size(width, height); 
background(255,255,255);

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
     music.load();
     music.play();
   
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
    music.play();

 
 //lights();
    
}



 void mouseDragged(){
    
    
    if (mouseButton == LEFT) {
    brush();
    }
    
    if (mouseButton == RIGHT) {
     
   
    }
    
     
    info();
}


  //line(pmouseX, pmouseY, mouseX, mouseY)
  




void brush() {


  color w = (255,255,255);
  color c = color(0,0,0);
  stroke(w);
  fill(c);
  strokeWeight(lineWidth);
  
  speed = constrain(speed, 0, 10);
  
  
  
  for(j = 0;j < d; j =j + random(4)){
  for(i = 0;i < d; i =i + random(4)){
      if((((10 - speed)/i) * ((d - speed)/j) < areaMAX) && ((10 - speed)/i < widthMAX) && ((d - speed)/j) < heightMAX){
      
      rect(mouseX+dx*(i+j), (mouseY+dy*(i+j))-((d - speed)/j),(10 - speed)/i ,(d - speed)/j);}
      
  }
  }
  //line(pmouseX, pmouseY, mouseX, mouseY)
  
}

void lights() {


  color w = (100,100,100);
  stroke(w);
  fill(w);
  strokeWeight(1);
 
  r = random(10) +2;
  
  for(j = -d;j < d; j =j + r){
  for(i = -d;i < d; i =i + r){
      
      point(mouseX + i, mouseY + j);
      
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
  
  
 
