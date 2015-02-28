
float gx, gy, gz;
int time;


void setup() {
  size(640, 480, P3D);
  frameRate(60);
  
  JSONObject json =loadJSONObject("http://api.artsat.jp/invader/sensor_data.json");
  JSONArray results = json.getJSONArray("results");
  JSONObject sensors = results.getJSONObject(0).getJSONObject("sensors");
  gx = sensors.getFloat("gx");
  gy = sensors.getFloat("gy");
  gz = sensors.getFloat("gz");
  time = results.getJSONObject(0).getInt("time");
  
  rectMode(CENTER);
  
  println(time + ", " + gx + ", " + gy + ", " + gz);
  

}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(radians(gx*50) * millis()/1000.0);
  rotateY(radians(gy*50) * millis()/1000.0);
  rotateZ(radians(gz*50) * millis()/1000.0);
  
 // pointLight(63, 127, 255, mouseX, mouseY, mouseX); 
 // rect(0, 0, 200, 200);
  fill(random(1,255), random(1, 255), random(1, 255), 120); 
  box(40);
  
  stroke(255,0, 0,100);
  fill(255,0);
// fill(random(1,255), random(1, 255), random(1, 255), 120);
  box(100);
  
  stroke(255, 0, 255, 100);
  strokeWeight(3);
  fill(255,90);
  box(650);
  

}



