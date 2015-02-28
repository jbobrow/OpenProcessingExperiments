
Table pTable;
int rowCount;
int[] values;
DiagramBox[] boxes;
DiagramBox showInfoDB;

int rectHeight = 15;
int rectWidth = 12;

void setup(){
  size(1280,480);
}

void draw(){
  background(32);
  values = new int[100];
  pTable = new Table("internet_penetration.tsv");
  rowCount = pTable.getRowCount();
  boxes = new DiagramBox[rowCount];
  
  //title
  textSize(48);
  fill(64);
  text("World Internet Penetration 2008", 330, 110);
  
  //read values
  for(int row=0; row<rowCount; row++){
    int val = int(pTable.getFloat(row, 4));
    values[val]++;
    boxes[row] = new DiagramBox((val*(width/100)) + 50, 
                                (height - (values[val]*rectHeight)-50),
                                pTable.getFloat(row, 4),
                                int(pTable.getFloat(row, 3)),
                                pTable.getString(row, 0));

  }
  
  //draw diagram
  int h = rectHeight*16/4;
  int w = rectWidth*100/10;
  for(int i=1; i<=4; i++){
    for(int j=0; j<=9; j++){
      fill(32);
      stroke(64);
      rect(int(j*w+50), int((height - (i*h)-50)), w, rectHeight*4);
      
      
      fill(64);
      textSize(12);
      textAlign(LEFT);
      //label x-axis
      if(i==1){
        text(j*10, int(j*w+50), int((height - (i*h)+(rectHeight*2))));
      }
      
      //label y-axis
      if(j==0){
        textAlign(RIGHT);
        text(i*4, int(j*w+45), int((height - (i*h)-(rectHeight*3))));
      }
    }
  }
  
  fill(128);
  textAlign(LEFT);
  text("Users %", 50, 470);
  text("Number of countries", 50, 180);
  
  //draw values
  for(int v=0; v<boxes.length; v++){
    fill(#834147);
    stroke(#3E1A1D);
    rect(boxes[v].x, boxes[v].y, width/100, rectHeight);
    
    if(mouseX >= boxes[v].x && mouseX <= boxes[v].x + width/100 && 
       mouseY >= boxes[v].y && mouseY <= boxes[v].y + rectHeight){
      showInfoDB = boxes[v]; 
    }
  }
  
  showInfoBox();
}

void showInfoBox(){
  stroke(192);
  fill(32);
  rect(50, 50, 200, 80);
  
  fill(192);
  textAlign(LEFT);
  if(showInfoDB != null){
    text(showInfoDB.name, 60, 70);
    text("Population: " + showInfoDB.population, 60, 100);
    text("Internet Penetration: " + showInfoDB.percent + "%", 60, 120);
    
    fill(#CBABAD);
    stroke(#3E1A1D);
    rect(showInfoDB.x - 1, showInfoDB.y - 1, (width/100) + 2, rectHeight + 2);
  }else{
    text("Roll over the boxes", 60, 70);
    text("to display information!", 60, 90);
  }
}

class DiagramBox{
  int x;
  int y;
  float percent;
  int population;
  String name;
  float rectHeight;
  float rectWidth;
  
  DiagramBox(int x, int y, float percent, int population, String name){
    this.x = x;
    this.y = y;
    this.percent = percent;
    this.population = population;
    this.name = name;
  }  
}

