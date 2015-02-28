
int count = 1;
PImage grad;
PImage city;
PImage bg1;
PImage heat;
PImage end;
Table data;
float al = 0;
float flood = 430;
ArrayList<Puff> puffs = new ArrayList(); 

////////////////////////////////////////////////////////////////////
void setup() {
  size(800, 400, P3D);  
  imageMode(CENTER);

  frameRate(30);

  bg1 = loadImage("bg1.png");
  heat = loadImage("heat.png");
  city = loadImage("city.png");
  city.resize(width, height);

  data = loadTable("co2.csv", "header,csv");
} 

////////////////////////////////////////////////////////////////////
void draw() {

  //for (TableRow row: data.rows()) {

  if (count < 666) {

    TableRow row = data.getRow(count);
    float avg = row.getFloat("average"); 
    float yr = row.getFloat("date");
    float trd = row.getFloat("trend");
    float itp = row.getFloat("interpolated");
    float Mx = map(yr, 1958, 2013, -30, 650); 
    float My = map(avg, 300, 400, height, 100);
    float trend = map(trd, 400, 300, height, -99);
    float interpolated = map(itp, 400, 300, height, -99);

    Puff p = new Puff(Mx, My, trend, interpolated);
    puffs.add(p); // "save" it 

    count += 2;
  }

  // draw all the objects
  tint(255, 255);
  image(bg1, width/2, height/2);
  image(city, width/2, height/2);

  if (count >= 550 && flood >= 350) {
    flood -= 0.3;
  }

  fill(40, 140, 255, 170);
  rect(0, flood, 800, 60);

  if (count >= 450) {
    al ++;
  }
  tint(255, al);
  image(heat, width/2, height/2);

  for (Puff puff : puffs) {
    puff.display();
  }




  println(frameRate + " " + puffs.size());
}

class Puff {
  float x;
  float y;

  float trend;
  float interpolated;  

  float tempTrend;
  float tempInter;
  PImage Co2;
  Puff(float x_, float y_, float trend_, float inter_) {
    x = x_;
    y = y_;
    trend = trend_;
    interpolated = inter_;

    tempTrend = 1;
    tempInter = 1;
    //    Co2 = loadImage("Co2.png");
  }

  void display() {
    fill(100 -x, 90 -y, 100-trend, 8 );
    //     stroke(127, 127, 127, 30);
    noStroke();
    ellipse(x, y, tempTrend, tempInter);
    //     Co2.resize(tempTrend, tempInter);
    //     image(Co2, x, y);

    // "animate"
    if (tempTrend < trend) tempTrend ++;
    if (tempInter < interpolated) tempInter ++;
  }
}



