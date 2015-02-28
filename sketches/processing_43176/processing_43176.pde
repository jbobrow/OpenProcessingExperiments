
gMap ourMap;
Bloke myBloke = new Bloke();
NotificationHandle NotificationHandler;

void setup() {
  size(940, 640);
  ourMap = new gMap();
  myBloke.build(50, height-50);
  println(width/20);
  println(height/20);

  NotificationHandler = new NotificationHandle();


  ReadSprSheet = new readSprSheet();
}

void draw() {
  ourMap.renderTiles();
  myBloke.moveIt();
  NotificationHandler.notifi();
}


