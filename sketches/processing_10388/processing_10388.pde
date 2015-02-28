
TileLayer level;
Date timer;
int frames=0;
float time=0;
int i=0;

void setup(){
  timer=new Date();
  frameRate(60);
  size(640,400,JAVA2D);
  level=new TileLayer(loadImage("data/map.png"),loadImage("data/tiles2.png"),loadImage("data/colors.png"),20,13);
}

void draw(){
  background(40,90,255);
  image(level.renderTiles(),-32,-32);
  level.setView(i+int(100*sin(i/64.0)),int(100*cos(i/64.0)));
  image(level.renderTiles(),-32,-32);
  level.setView(i/4+int(25*sin(i/64.0)),int(25*cos(i/64.0)));
  i+=4;

  frames++;
  time=(new Date().getTime()-timer.getTime())/1000.0;
  println(frames/time);
  if(time>=2){
    timer=new Date();
    frames=0;
  }
}


class TileLayer{

  private int[][] map;
  private PImage rendered;
  private PImage[] tiles;
  private int viewX=0;
  private int viewY=0;
  private int mapHeight;
  private int mapWidth;
  private int tw;
  private int windowWidth;
  private int windowHeight;

  public TileLayer(PImage layerMap,PImage layerTiles, PImage layerColors, int windowWidth,int windowHeight){
    tw=layerTiles.width/layerColors.width;
    generateMapData(layerMap,layerColors);
    generateTiles(layerTiles);
    this.windowWidth=windowWidth;
    this.windowHeight=windowHeight;
    rendered=createImage((windowWidth+2)*tw,(windowHeight+2)*tw,ARGB);

  }

  private void generateTiles(PImage layerTiles){
    tiles=new PImage[layerTiles.width/tw];
    for(int i=0;i<tiles.length;i++)
      tiles[i]=layerTiles.get(i*tw,0,tw,tw);
  }

  private void generateMapData(PImage layerMap, PImage layerColors){
    mapWidth=layerMap.width;
    mapHeight=layerMap.height;
    this.map=new int[mapWidth][mapHeight];
    for(int x=0;x<mapWidth;x++)
      for(int y=0;y<mapHeight;y++)
        map[x][y]=getIndexOf(layerMap.get(x,y),layerColors);
  }

  private int getIndexOf(color col, PImage colors){
    int i;
    for(i=0;col!=colors.get(i,0);i++);
    return i;
  }

  public void setView(int x,int y){
    viewX=x+tw;
    viewY=y+tw;
  }

  public PImage renderTiles(){
    for(int x=0;x<windowWidth+2;x++)
      for(int y=0;y<windowHeight+2;y++){
        int vX=(viewX/tw)+x;
        int vY=(viewY/tw)+y;
        while(vX<0)vX+=mapWidth;
        while(vY<0)vY+=mapHeight;
        while(vX>=mapWidth)vX-=mapWidth;
        while(vY>=mapHeight)vY-=mapHeight;
        rendered.set(x*tw-(viewX%tw),y*tw-(viewY%tw),tiles[map[vX][vY]]);
      }

    return rendered;
  }
}


