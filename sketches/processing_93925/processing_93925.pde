
String[] data;
float[] Lat;
float[] Lon;
float[] Magn;
PImage img;
boolean alt;

void setup() {
  size(720,360);
  alt = true;
  img = loadImage("worldmap.jpg");
  data = loadStrings("data.txt");
  Lat = new float[data.length];
  Lon = new float[data.length];
  Magn = new float[data.length];
  for(int i = 1; i < data.length; i++){
    String[] temp = data[i].split(",");
    Lat[i] = Float.parseFloat(temp[6]);
    Lon[i] = Float.parseFloat(temp[7]);
    Magn[i] = Float.parseFloat(temp[8]);
  }
}
void draw(){
  background(255);
  image(img,0,0);
  textSize(30);
  fill(0);
  text("EARTHQUAKES - PRESS SPACE TO SWITCH",100,40);

//  for(int i = 0; i < 180; i += 20){
//      line(0,i,360,i);
//  }
//  for(int i = 0; i < 360; i += 20){
//      line(i,0,i,180);
//  }
  textSize(10);
  if(alt){
    for(int i = 1; i < data.length; i++){
      fill(random(0,255),random(0,255),random(0,255));
      ellipse((Lon[i]+180)*2,(-Lat[i]+90)*2,(float)Math.pow(Magn[i],10)/1000000,(float)Math.pow(Magn[i],10)/1000000);
    }
    fill(0);
    text("LINEAR",10,10);
  }else{
    for(int i = 1; i < data.length; i++){
    fill(random(0,255),random(0,255),random(0,255));
    ellipse((Lon[i]+180)*2,(-Lat[i]+90)*2,Magn[i]*5,Magn[i]*5);
    }
    fill(0);
    text("LOG",10,10);
  }
  noLoop();
}
void keyPressed(){
  if(keyCode == ' '){
    alt = !alt;
    loop();
  }
}

