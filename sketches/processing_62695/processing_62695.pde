
class City {
  int id, statuses, followers, friends, mood;
  Location location;
  float x, y, lat, lng, markerRadius;
  String tweet, datetime;
  color col;
  boolean mouseOver;


  City(float lat, float lng, String tweet, String datetime, int statuses, int followers, int friends, int mood) {
    this.lat = lat;
    this.lng = lng;
    this.tweet = tweet;
    this.datetime = datetime;
    this.statuses = statuses;
    this.followers = followers;
    this.friends = friends;
    this.mood = mood;
    col = #00688B;
    location = new Location(lat, lng);
    tick();
  }   
  void tick() {
    float xy[] = map.getScreenPositionFromLocation(location);
    x = xy[0];
    y = xy[1];
    if (onScreen()) {
      draw();
    }
  }
  
  void draw() {
    markerRadius = constrain(map.getZoom()/10, 1, 20) * 8;
    fill(col);
    ellipse(x, y, markerRadius/2, markerRadius/2);
    fill(col, 40);
    noStroke();
    ellipse(x, y, markerRadius, markerRadius);
  }
  
  boolean onScreen() {
    if (x > -markerRadius && x < width + markerRadius && y > -markerRadius && y < height + markerRadius) {
      return true;
    } 
    else {
      return false;
    }
  }
}


