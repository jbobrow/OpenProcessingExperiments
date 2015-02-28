
String[] data;
String[] race;
float[] male;
float[] female;

void setup(){
  size(640,640);
  data = loadStrings("cancerdata.txt");
  race = new String[data.length];
  male = new float[data.length];
  female = new float[data.length];

  for(int i = 0; i < data.length; i++){
    String[] temp = data[i].split(",");
    race[i] = temp[0];
    male[i] = Float.parseFloat(temp[1]);
    female[i] = Float.parseFloat(temp[2]);
  }
}
void draw(){
  background(255,255,215);
  textSize(20);
  fill(0);
  text("Lung Cancer Death Rates by Gender and Race", 25,25);
  textSize(10);
  fill(110,160,255);
  text("Male", 25,50);
  fill(253,140,180);
  text("Female", 25,65);
  for(int i = 1; i < 6; i++){
    line(0,i*100,640,i*100);
  }
  textSize(10);
  fill(0);
  text(100,20,100);
  text(75,20,200);
  text(50,20,300);
  text(25,20,400);
  text(0,20,500);

  line(0,100,640,100);
  for(int i = 0; i < data.length; i++){
    rectMode(CORNERS);
    fill(110,160,255);
    rect(100+80*i,500,100+80*i+30,500-(male[i]/100)*400);
    fill(253,140,180);
    rect(120+80*i,500,120+80*i+30,500-(female[i]/100)*400);
    fill(0);
    text(race[i],100+80*i,520);
  }
  
}

