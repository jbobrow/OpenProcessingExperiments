
String[] data;
String[] name;
float[] age;

void setup() {
  size(1024,1024);
  data = loadStrings("lifedata.txt");
  age = new float[data.length];
  name = new String[data.length];
  for(int i = 0; i < data.length; i++){
    String[] temp = data[i].split(",");
    age[i] = Float.parseFloat(temp[2]);
    name[i] = temp[1];
  }
}

void draw(){
  background(0);
  textSize(15); 
  fill(255);
  text("AVERAGE LIFE EXPECTANCY",430,20);
  textSize(10); 
  fill(random(0,255),random(0,255),random(0,255));
  text("Dog",40+101,20);
  text("Dog",40+611,20);
  fill(random(0,255),random(0,255),random(0,255));
  text("Tiger",60+101,20);
  text("Tiger",60+611,20);
  fill(random(0,255),random(0,255),random(0,255));
  text("Gorilla",160+101,20);
  text("Gorilla",160+611,20);
  fill(random(0,255),random(0,255),random(0,255));
  text("Dolphin",100+101,20);
  text("Dolphin",100+611,20);
  fill(random(0,255),random(0,255),random(0,255));
  text("Rabbit",20+101,10);
  text("Rabbit",20+611,10);
  fill(random(0,255),random(0,255),random(0,255));
  text("Elephant",280+101,20);
  text("Elephant",280+611,20);
  fill(random(0,255),random(0,255),random(0,255));
  stroke(255);
  line(40+100,0,40+100,1024);
  line(40+610,0,40+610,1024);
  line(60+100,0,60+100,1024);
  line(60+610,0,60+610,1024);
  line(160+610,0,160+610,1024);
  line(160+100,0,160+100,1024);
  line(100+610,0,100+610,1024);
  line(100+100,0,100+100,1024);
  line(20+610,0,20+610,1024);
  line(20+100,0,20+100,1024);
  line(280+610,0,280+610,1024);
  line(280+100,0,280+100,1024);
  noStroke();
  
  for(int i = 0; i < data.length/2; i++){
    fill(random(0,255),random(0,255),random(0,255));
    text(name[i],0,i*10+30);
    for(float j = 0; j < age[i]; j++){
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(j*4+100,i*10+30,3,3);
    }
  }
  for(int i = data.length/2; i < data.length; i++){
    fill(random(0,255),random(0,255),random(0,255));
    text(name[i],512,(i-(data.length/2))*10+30);
    for(float j = 0; j < age[i]; j++){
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(j*4+610,(i-(data.length/2))*10+30,3,3);
    }
  }
  noLoop();
}

