
PVector pos;
PVector vel;
PVector target;
PVector accel;

Table pTable;
int rowCount;
int[] values;
DiagramBox[] boxes;
DiagramBox showInfoDB;

int rectHeight = 15;
int rectWidth = 12;

void setup(){
  size(720,480);
  pos = new PVector();
  vel = new PVector();
  accel = new PVector(0,0);
  target = new PVector();
  target.x = 2;
  target.y = 2;
  vel.x = 4;
  vel.y = 9;
}

void draw(){
  background(#070B15);
  values = new int[100];
  pTable = new Table("bankruptcies.tsv");
  rowCount = pTable.getRowCount();
  boxes = new DiagramBox[rowCount];
  
  //title
  textSize(24);
  fill(#7D86A2);
  text("Pronounced Bankruptcies" + "\n" + "Enterprises by Branche," + "\n" + "July 2010", 330, 80);
  
  //read values
  for(int row=0; row<rowCount; row++){
    int val = (int(pTable.getFloat(row, 1)))/2;
    values[val]++;
    boxes[row] = new DiagramBox((val*(rectWidth)) + 50, 
                                (height - (values[val]*rectHeight)-50),
                                pTable.getFloat(row, 1),
                                pTable.getString(row, 0));

  }
  
  //draw diagram
  int h = rectHeight*16/4;
  int w = (rectWidth*50/10)*2;
  for(int i=1; i<=4; i++){
    for(int j=0; j<=4; j++){
      fill(#070B15);
      stroke(#959AA7);
      rect(int(j*w+50), int((height - (i*h)-50)), w, rectHeight*4);
      
      
      fill(#7D86A2);
      textSize(12);
      textAlign(LEFT);
      //label x-axis
      if(i==1){
        text(j*20, int(j*w+50), int((height - (i*h)+(rectHeight*2))));
      }
      
      //label y-axis
      if(j==0){
        textAlign(RIGHT);
        text(i*4, int(j*w+45), int((height - (i*h)-(rectHeight*3))));
      }
    }
  }
  
  fill(#7D86A2);
  textAlign(LEFT);
  text("Bankruptcies", 50, 470);
  text("Number of branches", 50, 180);
  
  //draw values
  for(int v=0; v<boxes.length; v++){
    fill(#467E9B);
    stroke(#8197A2);
    rect(boxes[v].x, boxes[v].y, rectWidth, rectHeight);
    
    if(mouseX >= boxes[v].x && mouseX <= boxes[v].x + width/100 && 
       mouseY >= boxes[v].y && mouseY <= boxes[v].y + rectHeight){
      showInfoDB = boxes[v]; 
    }
  }
  
  showInfoBox();
}

void showInfoBox(){
  stroke(#8197A2);
  fill(#070B15);
  rect(50, 50, 240, 60);
  
  fill(#7D86A2);
  textAlign(LEFT);
  if(showInfoDB != null){
    text(showInfoDB.name, 60, 70);
    text("Bankruptcies: " + showInfoDB.percent, 60, 100);
    
    fill(#E3BF85);
    stroke(#DB741F);
    
    target.x = showInfoDB.x -1;
    target.y = showInfoDB.y -1;
    accel = PVector.sub(target, pos);
    accel.mult(0.1);
    vel.add(accel);
    vel.mult(0.8);
    pos.add(vel);
    
    rect(pos.x, pos.y, (rectWidth) + 2, rectHeight + 2);
    
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
  
  DiagramBox(int x, int y, float percent, String name){
    this.x = x;
    this.y = y;
    this.percent = percent;
    this.population = population;
    this.name = name;
  }  
}

