
//Ana Vlajnic

float[] data = {5, 6, 18, 30, 41};
String[] data_name = {"Delaware", "Rhode Island", "Connecticut", "Maryland", "Virginia"};
float angle_1 = 0;
float angle_2 = data[0];
float num = 0;
PFont font = createFont("Arial", 14, true);

void setup(){
  size(630, 600);
  background(255);
  smooth();
  noStroke();
  noLoop();
  textFont(font);
}

void draw(){
  String str = "Populations of States";
  String str_2 = "According to 2012 Census Data";
  fill(0);
  text(str, 270, 40);
  
  fill(100);
  text(str_2, 240, 55);
  
  for (int i=0; i<data.length; i++) {
    num += data[i];
  }
 
  num = 360/ num;

  int y =  height/2 - 100;
  for (int i = 0; i < data.length; i++) {
    angle_2 = angle_1;
    angle_1 += data[i] * num;

    int m = int(random(255));
    int n = int(random(255));
    int o = int(random(255));
  
    fill(m, n, o);
    arc(width/2 - 100, height/2, 300, 300, radians(angle_2), radians(angle_1));
    
    fill(m, n, o);
    rect(width/2 + 125, y, 14, 14);
 
    fill(0);
    text(data_name[i], width/2 + 150, y + 12);
    y += 40;
    
  }

}



