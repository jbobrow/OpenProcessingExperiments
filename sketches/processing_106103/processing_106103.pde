
PImage empire;
PImage bridge;
PImage cloud;
int empVar;
int bridgeVar;
int hour;
int second;
int minute;

void setup() {
  size(1000,800);
  background(255);
  empire = loadImage("ESP.png");
  bridge = loadImage("BB.png");
  cloud = loadImage("cloud.png");

}

void draw() {
  
   background(255);

 bridgeVar = int(map(second(),0,60,400,100)); 
// empVar = int( map(second(), 0, 60, 600, 100));
 
 
   
  imageMode(CORNERS);
//  image(bridge, 150,bridgeVar, 1000,800);
  

  
  hour = hour();
  for(int i = 0; i<hour; i++){
  image(cloud,i*40,20);
  }
     
      minute = minute();
  for(int i = 1; i<minute; i++){
  image(empire,i*10,80);
  }
  
  fill(255);
  rect(0,700,width,700);
    image(bridge, 50,bridgeVar, 1000,800);
  
//textSize(32);  
//   fill(67);
//text(minute(), 9, empVar); 
// textSize(52);  
//   fill(255,45,34);
//text(second(), 700, bridgeVar+200);  
  
  
  
}




