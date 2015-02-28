
PImage img;
void setup() {
  String ll = returnCoord();
 img = loadImage("https://maps.googleapis.com/maps/api/staticmap?center="+ll+"&zoom=12&size=800x400&markers;="+ll+"&sensor=false","jpg");
  size(img.width,img.height);
  image(img,0,0,width,height);
  
}

String returnCoord(){
  String [] lines = loadStrings("http://www.ip2location.com/");
  String oneString = join(lines, "");
//  println(oneString);
  int lon=oneString.indexOf("Latitude & Longitude");
  println(oneString.substring(lon+64,lon+64+18));
  oneString = oneString.substring(lon+64,lon+64+18);
  String strings[]  = splitTokens(oneString, " ");
  String returnCoord=strings[0]+strings[1];
  println("returnCoord = "+returnCoord);
  return returnCoord;
}
