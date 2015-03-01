
JSONObject jsonObj;
String url = "http://date.jsontest.com/";
String timeStr;

void setup() {
  size(300,300);
}

void draw() {
  background(255, 204, 0);
  fill(200, 0, 220);
  textSize(32);
  jsonObj = loadJSONObject(url);
  timeStr = jsonObj.getString("time");
  text(timeStr, 10, 150);
}

