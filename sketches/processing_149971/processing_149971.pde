
Table smogdata;
PImage mapImage;
float[] neglat, lon;
float maxneglat, minneglat, maxlon, minlon;
float[] p1, p2, p3, p4;
float maxp1, minp1, maxp2,minp2,maxp3,minp3;
float x, y;
float radius;

void setup() {
  size(1000, 1000);
  colorMode(HSB,360,100,100);
  smogdata = loadTable( "smogdata.tsv", "header" );
  mapImage = loadImage("map1000.jpg");
  int num = smogdata.getRowCount();
  neglat = new float[num-1];
  lon = new float[num-1];
  p1 = new float[num-1];
  p2 = new float[num-1];
  p3 = new float[num-1];
  
  for (int i = 1; i < num; i ++) {
    TableRow row = smogdata.getRow(i);
    String stateAbb = row.getString (0);

    neglat[i-1] = row.getFloat(2)*-1;
    lon[i-1] = row.getFloat(1);
    p1[i-1] = row.getFloat(3);
    p2[i-1] = row.getFloat(4);
    p3[i-1] = row.getFloat(5);
  }
  maxneglat = max(neglat);
  minneglat = min(neglat);
  maxlon = max(lon);
  minlon = min(lon);
  
  maxp1 = max(p1);
  minp1 = min(p1);
  maxp2 = max(p2);
  minp2 = min(p2);
  maxp3 = max(p3);
  minp3 = min(p3);
}

void draw() {
  background(254);
  image(mapImage, 0, 0);

  for (int i = 0; i < neglat.length; i ++) {
    //println(neglat[i]);
    
    float mappedlat = map(neglat[i], minneglat, maxneglat, 272.0, 837.0);
    float mappedlon = map(lon[i], minlon, maxlon, 296.0, 889.0);
    //println(mappedlat + ":" + mappedlon);
    
    float mp1 = map(p1[i], minp1, maxp1, 1.0, 150.0);
    int intmp1 = ceil(mp1);
    float mp2 = map(p1[i], minp2, maxp2, 1.0, 150.0);
    int intmp2 = ceil(mp2);
    float mp3 = map(p1[i], minp3, maxp3, 1.0, 150.0);
    int intmp3 = ceil(mp3);
    
    float mp1m = map(mouseX, 0,333,0,mp1);
    float mp2m = map(mouseX, 333,666,mp1,mp2);
    float mp3m = map(mouseX, 666,1000, mp2,mp3);
    
    if (mouseX<333){
    curves(mappedlon, mappedlat, mp1m);
    } else if (mouseX>=333 && mouseX<666){
    curves(mappedlon, mappedlat, mp2m);
    } else if (mouseX>=666 && mouseX<1000){
    curves(mappedlon, mappedlat, mp3m);
    }
  }
}

void curves(float x, float y, float radius){
  pushMatrix();
  translate(x,y);
  strokeWeight(0.7);
  noFill();
  for (float i=0 ; i < radius; i++){
  stroke(140,80,90,100-i);
  ellipse(0,0,i,i); 
  }
  popMatrix();
}



