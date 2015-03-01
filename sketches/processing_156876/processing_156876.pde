
PImage tile3;
PImage tile4;

int numTiles = 50;
int[]Tile3X=new int[numTiles];
int[]Tile3Y=new int[numTiles];
//int[]Tile4X=new int[numTiles];
//int[]Tile4Y=new int[numTiles];
int tileSize = 20;

void setup(){
size(500,500);


tile3 = loadImage("tile3.jpg");
tile4 = loadImage("tile4.jpg");

}



void draw(){


//for(int m=0
//x+=100
//x=x+100

for(int x=0; x<width; x+=100){
for(int y=0; y<height; y+=100){
  
  //if(mouseX>x && mouseX<x+100 && mouseY>y && mouseY<y+100){
   
   // image(tile3, x, y, 100, 100);
    //println("one is happening");
  //} else {
  
   //println("2 is happening");
   image(tile4, x, y,100,100);
  } 
  
}
  for (int i=0; i<numTiles-1; i++){
    Tile3X[i] = Tile3X[i+1];
    Tile3Y[i] = Tile3Y[i+1];
  }
  
  Tile3X[numTiles-1]= mouseX;
  Tile3Y[numTiles-1]= mouseY;

  for(int j=0; j<numTiles; j++){
    
    image (tile3, Tile3X[j], Tile3Y[j], 100, 100);
  
  }
  
}
    

  
  
  //println("mouseX: " + mouseX);
 // println("mouseY: " + mouseY);
  




