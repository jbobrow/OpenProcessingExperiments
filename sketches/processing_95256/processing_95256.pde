
float diameter;
String[] data;
String[] type;
float[] male;
float[] female;
float[] total;
float[] angles;
float lastAngle = 0;


void setup(){
  size(640,640);
  data = loadStrings("marriagedata.txt");
  type = new String[data.length];
  male = new float[data.length];
  female = new float[data.length];
  total = new float[data.length];
  angles = new float[(data.length-1)];
  diameter = min(width, height) * 0.75;
    
  for(int i = 0; i < data.length; i++){
    String[] temp = data[i].split(",");
    type[i] = temp[0];
    male[i] = Float.parseFloat(temp[1]);
    female[i] = Float.parseFloat(temp[2]);
    total[i] = male[i] + female[i];
  }
  for(int i = 0; i <(data.length-1);i++){
    angles[i] = (total[i]/total[data.length-1])*360;
  }
  print(Arrays.toString(angles));
}
void draw(){
  background(100,100,255);
  textSize(30);
  text("Active Duty Family Marital Status",50,40);
  for (int i = 0; i < angles.length; i++) {
    fill(random(255),random(255),random(255));
    float percent = angles[i]/360*100;
    textSize(10);
    text(type[i]+":"+percent+"%",10,80+i*20);
    
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
  noLoop();
}

