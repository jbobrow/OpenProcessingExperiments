
// HW #12 of Jim's CFA-757
// Zoe Lu copyright @ CMU, Spring 2012

// move your mouse over the locations to get the museum's name
// press space key to get more info of the museum
// left click your mouse to erase the info


int[] xloc = {215,200,170,153,136,108,220,250,298,283};
int[] yloc = {40,58,117,138,149,248,373,160,118,95};
String[] names={"Guggenheim","Met","MOMA",
                "Paley Center","Time Square",
                "New Museum","Brooklyn","MOMA PS1",
                "Museum of Moving Images","Noguchi Musuem"};
String[] hoursWD={"Sun-Fri: 10:00a-5:45p",
                  "Sun-Thur: 9:30a-5:30p",
                  "Sat-Thur: 10:30a-5:30p",
                  "Fri-Wed: 12:00p-6:00p",
                  "Mon-Fri: 8:00a-8:00p",
                  "Fri-Wed: 11:00a-6:00p",
                  "Fri-Wed: 11:00a-6:00p",
                  "Thur-Mon: 12:00p-6:00p",
                  "Tue-Thur: 10:30p-5:00p, Fri-8:00p",
                  "Wed-Fri: 10:00a-5:00p"};
String[] hoursWK={"Sat: 10:00a-7:45p",
                  "Fri-Sat: 9:30a-9:00p",
                  "Fri: 10:30a-8:00p",
                  "Tue: 12:00p-8:00p",
                  " ",
                  "Thur: 11:00a-9:00p",
                  "Thur: 11:00a-10:00p",
                  " ",
                  "Sat-Sun: 10:30p-7:00p",
                  "Sat-Sun: 11:00a-6:00p"};
String[] closed={"Thur",
                 "Mon",
                 "Tue",
                 "Mon-Tue",
                 "none",
                 "Mon-Tue",
                 "Mon-Tue",
                 "Tue-Wed",
                 "Mon",
                 "Mon-Tue"};
String[] links={"www.guggenheim.org",
                "www.metmuseum.org",
                "www.moma.org",
                "www.paleycenter.org",
                "time square visitor center",
                "www.newmuseum.org",
                "www.brooklynmuseum.org",
                "momaps1.org",
                "www.movingimage.us",
                "www.noguchi.org"};
int[] stuPrice={15,12,12,8,0,10,8,5,9,5};
int dia=8;

float noiseScale=0.008;
float xnoise=0;
float ynoise=0;
float noiseVal;

float target;

void setup(){
  size(530,500);
  noStroke();  
}

void draw(){
  drawMap();
  drawLocation();
  drawName();
}

void drawName(){ 
  for(int i=0;i<xloc.length;i++){
    target=dist(mouseX,mouseY,xloc[i],yloc[i]);
    if(target<10){
      for(int j=0;j<15;j+=5){
        fill(random(89,120),0,0,180);
        ellipse(mouseX, mouseY,2*j,2*j);
        
        fill(250,180);  
        PFont name;
        name =loadFont("Verdana-16.vlw");
        textFont(name,12);
        text(names[i],mouseX+15,mouseY);
      }
    }  
  }
}

void drawMap(){
  PImage nyMap;
  nyMap = loadImage("nyMap.jpg");
  image(nyMap,0,0);

  fill(255);
  PFont headline;
  headline =loadFont("Bebas-22.vlw");
  textFont(headline,20);
  text("Museums in New York",10,30);  
}

void drawLocation(){
  
  for(int i=0;i<xloc.length;i++){
    //fill(random(45,65));
    
    xnoise+=noiseScale;
    //ynoise+=noiseScale*1.2; 
    noiseVal=noise(xnoise,ynoise);
    fill(noiseVal*95,noiseVal*115,noiseVal*140);
    ellipse(xloc[i],yloc[i],dia,dia);
  }
}

void keyPressed(){
  if(keyCode == ' '){
    noLoop();
    drawInfo();
  }  
}

void mouseClicked(){
  loop();
}

void drawInfo(){
  for(int i=0;i<xloc.length;i++){
    target=dist(mouseX,mouseY,xloc[i],yloc[i]);
    if(target<5){
      fill(240,240,240,150);
      rect(mouseX+10,mouseY+10,260,80);
      fill(50);
      text("Admission: $"+stuPrice[i]+" (students)",mouseX+15,mouseY+25);
      text("Hours: "+hoursWD[i],mouseX+15,mouseY+40);
      text(hoursWK[i],mouseX+60,mouseY+55);
      text("Closed: "+closed[i],mouseX+15,mouseY+70);
      text("more info: "+links[i],mouseX+15,mouseY+85);
    }
  }
}

