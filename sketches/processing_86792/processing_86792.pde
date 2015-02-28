
/*     <---- 9 tiles ---->
      /_/_/_/_/_/_/_/_/_/  ^
     /_/_/_/_/_/_/_/_/_/   |
    /_/_/_/_/_/_/_/_/_/    |
   /_/_/_/_/_/_/_/_/_/   9 tiles
  /_/_/_/_/_/_/_/_/_/      |
 /_/_/_/_/_/_/_/_/_/       |
/_/_/_/_/_/_/_/_/_/        V

each tile is 60x38 pixels
*/

//the map will be drawn based on map_x and map_y
float map_x, map_y, w, h;
//array to remember all the tile images
PImage[] tileBank;
//array to remember the map grid

int[][] mapdata={
{8,6,6,6,6,6,12,12,7},
{5,0,0,0,0,0,0,0,4},
{5,0,0,0,0,0,0,0,4},
{5,0,0,1,1,1,0,0,4},
{5,0,0,1,2,1,0,0,4},
{5,0,0,1,1,1,0,0,4},
{5,0,0,0,0,0,0,0,4},
{5,0,0,0,0,0,0,0,4},
{9,11,11,3,3,3,3,3,10}
};

void setup(){
  size(800,600);
  //smooth();
  
  w=800;
  h=600;
  //load all the images, this could be done in a loop
  tileBank=new PImage[14];
  tileBank[0]=loadImage("tile_"+1+".png");
  tileBank[1]=loadImage("tile_"+2+".png");
  tileBank[2]=loadImage("tile_"+3+".png");
  tileBank[3]=loadImage("tile_"+4+".png");
  tileBank[4]=loadImage("tile_"+5+".png");
  tileBank[5]=loadImage("tile_"+6+".png");
  tileBank[6]=loadImage("tile_"+7+".png");
  tileBank[7]=loadImage("tile_"+8+".png");
  tileBank[8]=loadImage("tile_"+9+".png");
  tileBank[9]=loadImage("tile_"+10+".png");
  tileBank[10]=loadImage("tile_"+11+".png");
  tileBank[11]=loadImage("tile_"+12+".png");
  tileBank[12]=loadImage("tile_"+13+".png");
  tileBank[13]=loadImage("tile_"+14+".png");
  
  
  map_x=w/2;
  map_y=h/2;
  
}

void draw(){
  background(0);
  drawMap();
}

void drawMap(){
  for(int i=0;i<mapdata.length;i++){
    for(int j=0;j<mapdata[i].length;j++){
      //to see if mouse if on top, if so tint the tile to yellow
      if(dist(map_x+30*j-30*i+30,map_y+15*i+15*j+17,mouseX, mouseY)<=15){
        tint(255,202,17);
        image(tileBank[mapdata[i][j]],map_x+30*j-30*i,map_y+15*i+15*j);
        //chang tint back to white (normal color);
        tint(255);
      }else{
        image(tileBank[mapdata[i][j]],map_x+30*j-30*i,map_y+15*i+15*j);
      }
    }
  }
}

void keyPressed(){
  if (key == CODED) {
    //move map instead of character
    if (keyCode == UP) {
      map_y+=2;
    } else if (keyCode == DOWN) {
      map_y-=2;
    } 
  if (keyCode == LEFT) {
      map_x+=2;
    } else if (keyCode == RIGHT) {
      map_x-=2;
    } 
  }
  
}


