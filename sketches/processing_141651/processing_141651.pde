
ArrayList<Partition> partitions = new ArrayList<Partition>();
ArrayList<House> houses = new ArrayList<House>();
House beinDragged;

void setup(){
  size(1000,1000);
  for(int i=1;i<21;i++){
    Partition newPart = new Partition(i);
    partitions.add(newPart);
    House newHouse = new House(i);
    houses.add(newHouse);
  } 
}

void draw(){
  background(#ffffff);
  for(int i=0;i<partitions.size();i++){
    partitions.get(i).drawPartition();
    stroke(#aaaaaa);
    strokeWeight(4);
    line(0,i*50,1000,i*50);
  }
  for(int i=0;i<houses.size();i++){
    houses.get(i).drawHouse();
  }
}

class House{
  float x = -50;
  int houseNum;
  House(int num){
    houseNum = num;
  }
  void drawHouse(){
    stroke(#444444);
    strokeWeight(1);
    line(x,(houseNum-1)*50+30,x,1000);
    fill(#5E5E5E);
    triangle(x-18,(houseNum-1)*50+20,x+18,(houseNum-1)*50+20,x,(houseNum-1)*50+5);
    fill(#996633);
    rect(x-14,(houseNum-1)*50+20,28,20);
  }
  void setX(float newX){
    x = newX;
  }
}

class Partition{
  int numParts;
  float partSize;
  
  Partition(int parts){
    numParts = parts;
    partSize = 1000./parts;
  }
  void drawPartition(){
    for(int i=0;i<numParts+1;i++){
      int housesHere = 0;
      for(int j=0;j<numParts;j++){
        if(houses.get(j).x >= i*partSize && houses.get(j).x < (i+1)*partSize){
          housesHere++;
        }
      }
      if(housesHere > 0){
        fill(#00A300);
        stroke(#00A300);
        if(housesHere > 1){
          fill(#800000);
          stroke(#800000);
        }
        rect(i*partSize,(numParts-1)*50,partSize,50);
      }
      stroke(#000000);
      strokeWeight(2);
      line(i*partSize,(numParts-1)*50,i*partSize,(numParts)*50);
    }
  }
}

void mousePressed(){
  beinDragged = houses.get(floor(mouseY/50));
}
void mouseDragged(){
  beinDragged.setX(mouseX);
}


