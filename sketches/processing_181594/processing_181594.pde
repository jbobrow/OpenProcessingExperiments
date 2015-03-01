
//Aly Weir
//This program makes rain drops fall each second for 60 seconds
//*Credit to Chris Jung for being a helpful resource for building arrays 

Drop[] drops= new Drop[60];
int totalDrops = 0; 
 
void setup() {
  size(200,200); // make it big
  frameRate(60); //dont give anyone a seizure  
}
 
void draw() {
  background(0);//paint it black 
  drops[totalDrops] = new Drop(40, random(0,200), random(0,200));
   
  totalDrops = millis()/1000; //each drop appears after 1 second
   
  if (totalDrops >= drops.length) { //screen will clear after 60 sec
    totalDrops = 0; //start over
  }
   
  for (int i = 0; i < totalDrops; i++) {
    drops[i].display();  // displays each drop
    drops[i].fall(); // falling 
  }
}
 
class Drop {
  int w; //width of drop
  int h; //height of drop
  float sX; //xpos of drop
  float sY; //ypos of drop
   
  Drop(int id, float isX, float isY){
    w = 1;
    h = 5;
    sX = isX;
    sY = 0;
  }
      
  void display(){
    noStroke();
    fill(255);
    rect(sX, sY, w, h);  //draw the drop
  }
     
  void fall(){
    sY++;
  }
  
}



