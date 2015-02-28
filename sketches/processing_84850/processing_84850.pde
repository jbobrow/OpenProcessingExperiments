
import processing.pdf.*;
import org.json.*;

PImage img1;
PGraphics pixelized;
final int TIME = 2000;
int lastTime = -TIME;
int level = 1;

String api  = "http://api.flickr.com/services/rest/?method=flickr.photos.search";
String apikey = "5aa089fde84e9fb10513ef7605ef0847";
String tag = "bolzano";

int xImgPos = 0;
int yImgPos = 0;

void setup() {
      

  size (1125, 1125);
  
  beginRecord(PDF, "bolzano/bolzano_16_pag1_09.01.13_geo.pdf");
   background (255);
  getFlickrData();

}


 
void pixelize(){
  
  // Width and height of a cell for this level
  int w = img1.width / level;
  int h = img1.height / level;
  if (w < 1 || h < 1)
  {
    noLoop();
    println("Done");
    return;
  }
  println(level + " -> " + w + "x" + h);
  // We have some extra pixels to distribute
  int excessW = img1.width - w * level;
  int excessH = img1.height - h * level;
  // We will distribute them in the middle
  int excPosX = (level - excessW) / 2;
  int excPosY = (level - excessH) / 2;
//  println(excessW + "x" + excessH + " - " + excPosX + "x" + excPosY);
 
  pixelized.beginDraw();
  pixelized.noStroke();
  // Position of each cell
  int posX = 0;
  for (int i = 0; i < level; i++)
  {
    int cw = w;
    if (i >= excPosX && excessW > 0)
    {
      cw++; excessW--;
    }
    int rowExcessH = excessH;
    int posY = 0;
    for (int j = 0; j < level; j++)
    {
      int ch = h;
      if (j >= excPosY && rowExcessH > 0)
      {
        ch++; rowExcessH--;
      }
      color[] colors = new color[cw * ch];
      for (int x = 0; x < cw; x++)
      {
        for (int y = 0; y < ch; y++)
        {
          int pixelPos = x + cw * y;
          int pos = (posX + x) + (posY + y) * img1.width;
//println(posX + " " + posY + " - " + x + " " + y + " - " + cw + " " + ch);
          colors[pixelPos] = img1.pixels[pos];
        }
      }
      color c = averageColors(colors);
      pixelized.fill(c);
      pixelized.rect(posX, posY, cw, ch);
     
      posY += ch;
    }
    posX += cw;
  }
  pixelized.endDraw();
}
 
color averageColors(color[] colors)
{
  long r = 0;
  long g = 0;
  long b = 0;
  for (color c : colors)
  {
    r += (c >> 16) & 0xFF;
    g += (c >> 8) & 0xFF;
    b += c & 0xFF;
  }
  int len = colors.length;
  int ar = int(r / len);
  int ag = int(g / len);
  int ab = int(b / len);
  return 0xFF000000 | (ar << 16) | (ag << 8) | ab;
}


////////////////////////////////////////////////////

void getFlickrData() {
  String request = api + "&tags;="+tag+"&has_geo=1&page=1&per_page=300&format=json&nojsoncallback=1&extras=geo&api;_key="+apikey;
  println(request);
  String result = join (loadStrings( request ), "");
  //println(result);
  try {
    JSONObject flickrData = new JSONObject(join(loadStrings(request), ""));
    //JSONArray photos = flickrData.getJSONArray("photos");
    println("test1");
    println(flickrData );
    // println(flickrData.getString("photos"));
    println("test2");
    JSONObject flickrData2 = new JSONObject(flickrData.getString("photos") )  ;
    // JSONObject results = flickrData.JSONObject(0);
    // JSONArray results = flickrData.getJSONArray("photo");
    //    JSONArray results = flickrData.getJSONArray("photos");  
    // JSONObject jsonobj2 = flickrData.JSONObject("photo");  
    println("test3 ----------------------------------------------------------------------");
    println(flickrData2 );
    println("test4");
    JSONArray results = flickrData2.getJSONArray("photo");
    println("test5");
    println("------------------------------------------------------------------------------");
    println("=======================================");
    
    int numberOfElements = results.length();
    int lineNum=2;
    int factor1= 110;
    int factor2= 25;
    
    for (int j = 0; j < numberOfElements; j++) {
     
      
      JSONObject entry = results.getJSONObject(j);
      println ("Now we show entry # " + j );
      println (entry);
      println("id is: " + entry.getString("id"));
      
          //String longitudeID = entry.getString("longitude");
          //String latitudeID = entry.getString("latitude");
           //println("This is longitude and latitude: " + longitudeID+" "+latitudeID);
             
      String farmID = entry.getString("farm");
      String serverID = entry.getString("server");
      String imageID = entry.getString("id");
      String seceretID = entry.getString("secret");

      //////////// the image url
      
      String imgURL = "http://farm"+farmID+".staticflickr.com/"+serverID+"/"+imageID+"_"+seceretID+"_s.jpg";
      level  = 16;
      
      println(imgURL);
      
      img1 = loadImage(imgURL);
      pixelized = createGraphics(img1.width, img1.height, JAVA2D);

      pixelize();
      image(pixelized,xImgPos,yImgPos);
      
     // this.x = x;
    //this.y = y;
      if (xImgPos> width){
        xImgPos=0;
        yImgPos += pixelized.height;
     }else{
       xImgPos+=pixelized.width;
     }
      
    
      //image(img1, 70, j * 95 + 25);
      /*
      PFont myFont=createFont("avenir-32.vlw", 16);
      textFont(myFont, 25);
      lineNum= 1;
      text (entry.getString("title"), j*factor1+lineNum*factor2, j*factor1+lineNum*factor2 );     
      lineNum++;
      text (entry.getString("accuracy"), 44, j*factor1+lineNum*factor2 );
      lineNum++;
      textFont(myFont, 14);
      text (entry.getString("context"), 44, j*factor1+lineNum*factor2 );
      lineNum++;*/
     // text (entry.getString("latitude"), 44, j*factor1+lineNum*factor2 );
      //lineNum++;
      //
      println ("----------------------");
    }
    /*
    for (int i = 0; i < photos.length(); i++){
     JSONObject flickrImg = (JSONObject) photos.get(i);
     JSONArray flickrPhoto = flickrImg.getJSONArray("photo");
     JSONObject photo = (JSONObject) flickrPhoto.get(0);
    
     println("\nLongitude : " + photo.getString("longitude"));
     }  */
  }
  catch (JSONException e) {
   println ("There was an error parsing the JSONObject.");
  }
  
   endRecord();

  
}
