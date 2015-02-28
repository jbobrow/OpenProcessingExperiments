
PImage fungus;
PImage stone;
PImage hive;
PImage beetle;

void setup(){
  size(800,800);
  
  background(200,100,50);
  
  fungus = loadImage("fungus.JPG");
  stone = loadImage("stone.JPG");
  hive = loadImage("hive.JPG");
  beetle = loadImage("Beetle.JPG");
  
}
  
  void draw()
  {
    
    tint(150,80,50);
    image(fungus, 0, 0);
    
    tint(100,220,100,50);
    image(stone, 0, 0);
    
    tint(90,20,150,40);
    image(hive, 0, 0);
    
    tint(40,90,180,80);
    image(beetle, 0, 0);
  }
    

