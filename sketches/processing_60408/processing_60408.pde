
String urls[] = loadStrings("http://nevada.robbycollins.com/data/url.txt?" + System.currentTimeMillis());
String lats[] = loadStrings("http://nevada.robbycollins.com/data/lat.txt?" + System.currentTimeMillis());
String lons[] = loadStrings("http://nevada.robbycollins.com/data/lon.txt?" + System.currentTimeMillis());
String elevs[] = loadStrings("http://nevada.robbycollins.com/data/ele.txt?" + System.currentTimeMillis());
float latitude, latitude1;
float longitude, longitude1;
float la, la1;
float lo, lo1;


void setup()
{
size(1000,600);
//for (int i=0; i < lats.length; i++) {
  //println(urls[i]);
  //println(lats[i]);
  //println(lons[i]);
  //println(elevs[i]);
//}
}

void draw(){
  
  background(0);

  noFill();
  float alpha = random(150,255);
  stroke(0, 0, 255, alpha);
  strokeWeight(1);
  
 for (int j=0; j < ((lats.length)-1); j++) {
  la = float(lats[j]);
  lo = float(lons[j]);
  la1 = float(lats[j+1]);
  lo1 = float(lons[j+1]);
  
  latitude = map(la, 40, 35, 0, height);
  longitude = map(lo, -125, -112, 0, width);
  latitude1 = map(la1, 40, 35, 0, height);
  longitude1 = map(lo1, -125, -112, 0, width);
  line(longitude, latitude, longitude1, latitude1);
  
 } 
  //println(la);
  //println(latitude);
  
  //println(lo);
  //println(longitude); 
  
  //noLoop();
}

void stop(){}

