
// Collage engine

XMLElement xml;
String apiKey = "d6f83a6b0b350cd22493377c4d0fe8ad";
String secret = "d68743ade4f2f6b3";
String groupID = "52242317293@N01";
String tag1 = "sunrise";
String tag2 = "sunset";
int numPhotos = 15;
PGraphics buffert;
ArrayList photos;
Boolean sunset = true;

PFont georgia48;
PFont georgia12;

int prevTime = 0;
int curTime = 0;
float deltaTime = 0.0;

class Photo {
  PImage _img;
  PVector _pos;
  PVector _smallSize;
  PVector _curSize;
  int _id;
  Boolean _loading;
  
  Photo(String url, float nx, float ny, int id)
  {
    _img = requestImage(url);
    id = _id;
    _loading = true;
    _pos = new PVector(nx, ny);
    _smallSize = new PVector(0, 0);
    _curSize = new PVector(0, 0);
  }
  
  void Loaded()
  {
    _loading = false;
    
    // Landscape
    if(_img.width > _img.height)
    {
      _curSize.x = _smallSize.x = 120;
      _curSize.y = _smallSize.y = _img.height * (120 / (float)_img.width);
    }
    // Portrait
    else
    {
      _curSize.x = _smallSize.x = _img.width * (120 / (float)_img.height);
      _curSize.y = _smallSize.y = 120;
    }
  }
  
  void Render()
  {
    pushMatrix();
    translate(_pos.x, _pos.y);
    image(_img, 0, 0, _img.width, _img.height);
    popMatrix();
  }
  
  void DrawImage(PGraphics g)
  {
    g.translate(0,0);
    g.beginShape();
    g.texture(_img);
    g.vertex(_pos.x * 120 + (120 - _curSize.x) / 2, _pos.y * 120 + (120 - _curSize.y) / 2, 0, 0);
    g.vertex(_pos.x * 120 + _curSize.x + (120 - _curSize.x) / 2, _pos.y * 120 + (120 - _curSize.y) / 2, 1, 0);
    g.vertex(_pos.x * 120 + _curSize.x + (120 - _curSize.x) / 2, _pos.y * 120 + _curSize.y + (120 - _curSize.y) / 2, 1, 1);
    g.vertex(_pos.x * 120 + (120 - _curSize.x) / 2, _pos.y * 120 + _curSize.y + (120 - _curSize.y) / 2, 0, 1);
    g.endShape();
    g.translate(0,0);
  }
  
  void DrawBuffer(PGraphics b)
  {
    b.translate(0,0);
    b.beginShape();
    b.noStroke();
    b.fill(-(_id + 2));
    b.texture(_img);
    b.vertex(_pos.x * 120 + (120 - _curSize.x) / 2, _pos.y * 120 + (120 - _curSize.y) / 2);
    b.vertex(_pos.x * 120 + _curSize.x + (120 - _curSize.x) / 2, _pos.y * 120 + (120 - _curSize.y) / 2);
    b.vertex(_pos.x * 120 + _curSize.x + (120 - _curSize.x) / 2, _pos.y * 120 + _curSize.y + (120 - _curSize.y) / 2);
    b.vertex(_pos.x * 120 + (120 - _curSize.x) / 2, _pos.y * 120 + _curSize.y + (120 - _curSize.y) / 2);
    b.endShape(CLOSE);
    b.translate(0,0);
  }
}

void setup()
{
  size(600, 720, P2D);
  background(20);
  buffert = createGraphics(width, height, P2D);
  
  photos = new ArrayList();
  
  GetNewPhotos();
  
  imageMode(CENTER);
  textureMode(NORMALIZED);
  noStroke();
  smooth();
  textAlign(CENTER);
  
  georgia48 = createFont("Georgia.ttf", 48);
  georgia12 = createFont("Georgia.ttf", 12);
}

void GetNewPhotos()
{
  sunset = !sunset;
  
  photos.clear();
  photos = null;
  xml = null;
  
  photos = new ArrayList();
  String url;
  if(sunset)
  {
    url = "http://api.flickr.com/services/rest/?api_key=" + apiKey + "&group_id=" + groupID + "&tags=" + tag2 + "&method=flickr.groups.pools.getPhotos&per_page=" + numPhotos + "&page=" + random(0, 200);
  }
  else
  {
    url = "http://api.flickr.com/services/rest/?api_key=" + apiKey + "&group_id=" + groupID + "&tags=" + tag1 + "&method=flickr.groups.pools.getPhotos&per_page=" + numPhotos + "&page=" + random(0, 200);
  }
  xml = new XMLElement(this, url);
  XMLElement photoList = xml.getChild(0);
  int childCount = photoList.getChildCount();
  int perRow = childCount / 5;
  int yPos = 0;
  
  for(int i = 0; i < childCount; i++)
  {
    String farm = photoList.getChild(i).getString("farm");
    String server = photoList.getChild(i).getString("server");
    String id = photoList.getChild(i).getString("id");
    String secret = photoList.getChild(i).getString("secret");
    
    if(i % perRow == 0)
    {
      yPos++;
    }
    
    photos.add(new Photo("http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+".jpg", i % perRow, yPos, i+1));
  }
}

void draw()
{
  prevTime = curTime;
  curTime = millis();
  deltaTime = (curTime - prevTime) / 1000.0f;
  
  background(20);
  
  textSize(48);
  textFont(georgia48);
  if(sunset)
  {
    fill(150, 10, 40);
    text("sunset.", width/2, 60);
  }
  else
  {
    fill(150, 40, 10);
    text("sunrise.", width/2, 60);
  }
  
  fill(100);
  textSize(12);
  textFont(georgia12);
  text("images streamed from flickr.", width/2, 80);
  
  noFill();
  strokeWeight(1);
  stroke(100);
  line(120, 96, 480, 96);
  noStroke();
  
  pushMatrix();
  
  translate(120, 0);
  
  buffert.beginDraw();
  buffert.background(color(255));
  
  for(int i = 0; i < photos.size(); i++)
  {
    Photo p = (Photo)photos.get(i);
    p.DrawBuffer(buffert);
  }
  buffert.endDraw();
  
  for(int i = 0; i < photos.size(); i++)
  {
    Photo p = (Photo)photos.get(i);
    
    // Completed loading
    if(p._loading && p._img.width > 0)
    {
      p.Loaded();
    }
    
    p.DrawImage(g);
  }
  
  popMatrix();
  
  // Hover mouse
  int curX = (mouseX - 120) / 120 % 3;
  int curY = (mouseY - 120) / 120;
  
  if(mouseX >= 120 && mouseX <= 480 && mouseY >= 120 && mouseY < 720)
  {
    int i = curX + curY * 3;
    
    // Display hovered image
    Photo curPhoto = (Photo)photos.get(i);
    pushMatrix();
    translate(width/2, height/2);
    curPhoto.Render();
    popMatrix();
  }
}

void mouseClicked()
{
  GetNewPhotos();
}

