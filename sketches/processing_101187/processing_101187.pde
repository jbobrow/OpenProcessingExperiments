
import ai.pathfinder.*;

//PrintWriter output;
//Table table;
String filename;
SKU[] SKUs;
Order[] Orders;
Bay[] myBays;
Simulation[] Sims;
Pathfinder myMap;
ArrayList path = new ArrayList();
ArrayList PickPath = new ArrayList();
Node HomeNode;
int simRun=0;
int PickDistance=0;
int PathStep=0;
  int Grid;
  int Gutter = 20;
  int INtoGDx, INtoGDy, INtoGD;
  int[][] myGrid;
  
void setup() {
  size(800, 600);
  background(100);
  frameRate(60);
  //output = createWriter("log.txt");
  /*table = new Table();
  table.addColumn("ID");
  table.addColumn("BayWidth");
  table.addColumn("Upright");
  table.addColumn("BayDepth");
  table.addColumn("Flue");
  table.addColumn("AisleWidth");
  table.addColumn("BaysLong");
  table.addColumn("AislesWide");
  table.addColumn("Lines");
  table.addColumn("Orders");
  table.addColumn("Slotting");
  table.addColumn("OrderMix");
  table.addColumn("TotalDistance");
  filename = String.valueOf(year())+String.valueOf(month())+String.valueOf(day())+String.valueOf(hour())+String.valueOf(minute())+String.valueOf(second());
  saveTable(table, "data/"+filename+".csv");*/
  
  int[] BayWidths = {36,60,72,84,96};
  int[] Uprights = {0};
  int[] BayDepths = {12, 18, 24, 36, 42, 48};
  int[] Flues = {6, 12};
  int[] AisleWidths = {72, 96, 108, 120, 132, 144};
  int[] BaysLongs = {4, 8, 10, 12};
  int[] AislesWides = {3,4, 5, 6, 7, 8};
  Sims = new Simulation[BayWidths.length*Uprights.length*BayDepths.length*Flues.length*AisleWidths.length*BaysLongs.length*AislesWides.length];
  int simCount=0;
  for(int a=0;a<BayWidths.length;a++){
    for(int b=0;b<Uprights.length; b++){
      for(int c=0;c<BayDepths.length; c++){
        for(int d=0;d<Flues.length; d++){
          for(int e=0;e<AisleWidths.length; e++){
            for(int f=0;f<BaysLongs.length; f++){
              for(int g=0;g<AislesWides.length; g++){
                Sims[simCount] = new Simulation(BayWidths[a],Uprights[b],BayDepths[c],Flues[d],AisleWidths[e],BaysLongs[f],AislesWides[g]);
                simCount++;
              }
            }
          }
        }
      }
    }
  }    
  //output.println("Simulations Loaded: "+Sims.length);
  Sims[simRun].SetupSimulation();
}

void draw() {
  /*drawNodes();
  output.println("PathStep:"+PathStep);
  output.println("Total paths:"+PickPath.size());
  output.println("Nodes:"+myMap.nodes.size());*/
  if(PathStep<PickPath.size()-1){
  if(PathStep==0){
    path = myMap.aStar((Node)PickPath.get(0), (Node)PickPath.get(1));
  }else{
    path = myMap.aStar((Node)PickPath.get(PathStep), (Node)PickPath.get(PathStep+1));
  }
  //output.println("Path size:"+path.size());
  PathStep++;
  PickDistance+=Grid*path.size();
  //output.println("Grid:"+Grid);
  //output.println("Pick distance:"+PickDistance);
}else{
  if(simRun<Sims.length-1){
    //output.println("Saving simulation stats");
    /*TableRow newRow = table.addRow();
    newRow.setInt("ID", table.getRowCount() - 1);
    newRow.setInt("BayWidth", Sims[simRun].BayWidthIN);
    newRow.setInt("Upright", Sims[simRun].UprightIN);
    newRow.setInt("BayDepth", Sims[simRun].BayDepthIN);
    newRow.setInt("Flue", Sims[simRun].FlueIN);
    newRow.setInt("AisleWidth", Sims[simRun].AisleWidthIN);
    newRow.setInt("BaysLong", Sims[simRun].BaysLong);
    newRow.setInt("AislesWide", Sims[simRun].AislesWide);
    newRow.setInt("Lines", PathStep);
    newRow.setInt("Orders", Sims[simRun].OrderCount);
    newRow.setString("Slotting", "Random");
    newRow.setString("OrderMix", "Flat");
    newRow.setInt("TotalDistance", PickDistance);
    saveTable(table, "data/"+filename+".csv","csv");*/
    //output.println("Loading next simulation");
    simRun++;
    background(100);
    //output.println("Loaded Simulation: "+simRun);
    PathStep=0;
    PickPath.clear();
    path.clear();
    myGrid=null;
    myBays=null;
    myMap=null;
    PickDistance=0;
    Sims[simRun].SetupSimulation();
  }else{
    //output.flush(); // Writes the remaining data to the file
    //output.close(); // Finishes the file
    exit();
  }}
 //path.clear();
  drawPath();
  strokeWeight(0);
  fill(100);
  rect(0,height,width,-Gutter);
  fill(255);
  text("Total Distance Traveled:"+PickDistance/12+" ft  |  Lines Picked:"+PathStep, 10, height-10);
}


/*void mousePressed(){
  if(PathStep<PickPath.size()-1){
  if(PathStep==0){
    path = myMap.aStar((Node)PickPath.get(0), (Node)PickPath.get(1));
  }else{
    path = myMap.aStar((Node)PickPath.get(PathStep), (Node)PickPath.get(PathStep+1));
  }
  PathStep++;
  PickDistance+=Grid*path.size();
}
}
void drawNodes(){
  stroke(10);
  fill(255, 10);
  strokeWeight(1);
  for(int i = 0; i < myMap.nodes.size(); i++){
    Node temp = (Node)myMap.nodes.get(i);
    if(temp.walkable){
      rect(temp.x, temp.y, INtoGD, INtoGD);
    }
  }
}*/
void drawPath(){
  strokeWeight(INtoGD);
  noFill();
  stroke(#A80000,25);
  if(path != null){
    beginShape();
    for(int i = 0; i < path.size(); i++){
      Node temp = (Node)path.get(i);
      vertex(temp.x, temp.y);
    }
    endShape();
  }
}
void deleteNodes(int x, int y, int l, int w){
  //Node temp;
  //output.println("X:"+x+" Y:"+y+" L:"+l+" W:"+w);
  for(int i=x; i<x+l; i++){
    for(int j=y;j<y+w;j++){
      Node temp = (Node)myMap.nodes.get(myGrid[i][j]);
      temp.walkable=false;
    }
  }
  myMap.radialDisconnectUnwalkables();
}

class Bay {
  float bayX;
  float bayY;
  float bayWidth;
  float bayHeight;
  int leftRight;
  int PickNode;
  int PickOrder;
  Bay (float x,float y, float bWidth, float bHeight, int LR, int nd){
    bayX=x;
    bayY=y;
    bayWidth=bWidth;
    bayHeight=bHeight;
    leftRight=LR;
    PickNode=nd;
  }
  void display(){
    stroke(10);
    fill(255);
    strokeWeight(1);
    rect(bayX,bayY,bayWidth,bayHeight);
  }
}
class SKU{
  int ID;
  int BayLocation;
  float Velocity;
  float DimLength;
  float DimWidth;
  float DimHeight;
  SKU(){
  }
  void ID(int id){
    ID=id;
  }
}
class Order{
  int[] Lines;
  int[] LineOrder;
  int ID;
  int LineCount;
  int Priority;
  Order(){
  }
}
class Simulation{
  int grid;
  int BayWidthIN;
  int UprightIN;
  int BayDepthIN;
  int FlueIN;
  int AisleWidthIN;
  int BaysLong;
  int AislesWide;
  int OrderCount;
  Simulation(int baywidthin, int uprightin, int baydepthin, int fluein, int aislewidthin, int bayslong, int aisleswide){
    BayWidthIN=baywidthin;
    UprightIN=uprightin;
    BayDepthIN=baydepthin;
    FlueIN=fluein;
    AisleWidthIN=aislewidthin;
    BaysLong=bayslong;
    AislesWide=aisleswide;
    int minGrid=1000;
    boolean denomfail=false;
    if(UprightIN<minGrid && UprightIN>0)minGrid=UprightIN;
    if(BayWidthIN<minGrid && BayWidthIN>0)minGrid=BayWidthIN;
    if(BayDepthIN<minGrid && BayDepthIN>0)minGrid=BayDepthIN;
    if(FlueIN<minGrid && FlueIN>0)minGrid=FlueIN;
    if(AisleWidthIN<minGrid && AisleWidthIN>0)minGrid=AisleWidthIN;
    while(!denomfail && minGrid>1){
      denomfail=true;
      if(UprightIN%minGrid>0)denomfail=false;
      if(BayWidthIN%minGrid>0)denomfail=false;
      if(BayDepthIN%minGrid>0)denomfail=false;
      if(FlueIN%minGrid>0)denomfail=false;
      if(AisleWidthIN%minGrid>0)denomfail=false;
      if(denomfail==false){
        minGrid=(int)minGrid/2;
      }}
     grid=minGrid;
     Grid=grid;
     //output.println("Grid:"+Grid);
  }
  void SetupSimulation(){
  int SKUCount = 50;
  int LinesPerOrder = 5;
  int LineCount = 1000;
  int BayWidthGD = ceil(BayWidthIN/grid);
  int UprightGD = 0;//ceil(UprightIN/Grid);
  int BayDepthGD = ceil(BayDepthIN/grid);
  int FlueGD = ceil(FlueIN/grid);
  int AisleWidthGD = ceil(AisleWidthIN/grid);
  myBays = new Bay[BaysLong*AislesWide*2];
  //output.println("Bays set:"+myBays.length);
  int rowCounter, bayCounter, rowX, rowY,pnd;
  INtoGDx = (width-Gutter*2)/((FlueGD+BayDepthGD)*2*AislesWide+AisleWidthGD*AislesWide+FlueGD*AislesWide);
  INtoGDy = (height-Gutter*2)/((BayWidthGD+UprightGD)*BaysLong+UprightGD+AisleWidthGD*2);
  INtoGD = min(INtoGDx,INtoGDy);
  rect(Gutter, Gutter, ((FlueGD+BayDepthGD)*2*AislesWide+AisleWidthGD*AislesWide)*INtoGD,((BayWidthGD+UprightGD)*BaysLong+UprightGD+AisleWidthGD*2)*INtoGD);
  myMap = new Pathfinder();
  myMap.offsetX = Gutter+INtoGD/2;
  myMap.offsetY = Gutter+INtoGD/2;
  myMap.setCuboidNodes(((FlueGD+BayDepthGD)*2*AislesWide+AisleWidthGD*AislesWide),((BayWidthGD+UprightGD)*BaysLong+UprightGD+AisleWidthGD*2), INtoGD);
  myGrid = new int[((FlueGD+BayDepthGD)*2*AislesWide+AisleWidthGD*AislesWide)][(BayWidthGD+UprightGD)*BaysLong+UprightGD+AisleWidthGD*2];
  //output.println("GridX:"+myGrid.length);
  //output.println("GridY:"+myGrid[0].length);
  int x=0;
  for(int i=0; i<myGrid[0].length;i++){
    for(int j=0; j<myGrid.length; j++){
      myGrid[j][i]=x;
      x++;
    }
  }
  HomeNode = (Node)myMap.nodes.get(myGrid[FlueGD+BayDepthGD+AisleWidthGD/2][0]);
  fill(10,255,10);
  ellipse(HomeNode.x, HomeNode.y, INtoGD*3, INtoGD*3);
  PickPath.add(HomeNode);
  rowCounter=1;
  bayCounter=0;
  rowX=FlueGD;
  rowY=0;
  for (int i = 0; i < myBays.length; i++){
     if(bayCounter==BaysLong){
      bayCounter=0;
      rowCounter++;
      rowX=rowX+BayDepthGD+FlueGD;
      if(rowCounter % 2==0){
        rowX=rowX+AisleWidthGD;
      }}
    bayCounter++;
    if(bayCounter==1){
      rowY=UprightGD+AisleWidthGD;
    }
   if(rowCounter%2==0){ //Pick Node is on left
     pnd= myGrid[rowX-1][(bayCounter-1)*(BayWidthGD)+rowY+BayWidthGD/2];
   }else{ //Pick Node is on right
     pnd=myGrid[rowX+BayDepthGD][(bayCounter-1)*(BayWidthGD)+rowY+BayWidthGD/2];
   }
   myBays[i] = new Bay(Gutter+(rowX)*INtoGD,Gutter+((bayCounter-1)*(BayWidthGD)+rowY)*INtoGD,BayDepthGD*INtoGD,BayWidthGD*INtoGD,rowCounter%2, pnd);
   deleteNodes(rowX,(bayCounter-1)*(BayWidthGD)+rowY,BayDepthGD,BayWidthGD);
   if(rowCounter%2==1){
     myBays[i].PickOrder=i;
   }else{
     myBays[i].PickOrder=(rowCounter*BaysLong-1)-(bayCounter-1);
   }
   //output.println("Bay:"+i+" PickOrder:"+myBays[i].PickOrder);
  }
  SKUs = new SKU[SKUCount];
  for(int i=0;i<SKUCount;i++){
    SKUs[i]=new SKU();
    SKUs[i].ID(i);
    SKUs[i].BayLocation = (int)random(myBays.length);
    //output.println("SKU:"+i+" Bay location:"+SKUs[i].BayLocation);
  }
  //output.println("SKUs created");
  OrderCount=0;
  int j=0;
  Orders = new Order[LineCount/LinesPerOrder];
  for(int i=0;i<LineCount; i++){
    if(j==LinesPerOrder){
        OrderCount++;
        j=0;
      }  
    if(j==0){
        Orders[OrderCount]=new Order();
        //output.println(OrderCount);
        Orders[OrderCount].ID=OrderCount;
        Orders[OrderCount].Lines = new int[LinesPerOrder];
        Orders[OrderCount].LineOrder = new int[LinesPerOrder];}
      if(j<LinesPerOrder){
        Orders[OrderCount].Lines[j]=(int)random(SKUs.length); //Randomly assign lines to orders
        //output.println("Order:"+OrderCount+" SKU:"+Orders[OrderCount].Lines[j]);
        j++;}
  }      
  //output.println("Orders populated");  

  for(int i=0;i<Orders.length;i++){
    int nextLine=0;
    int myLine=0;
    int noPick=0;
    //output.println(i);
    for(int k=0;k<Orders[i].LineOrder.length;k++){
        //Orders[i].LineOrder[k]=1000;
        int lowestBay=1000;
      for(j=1;j<=Orders[i].Lines.length;j++){         
        for(int s=0;s<k+1;s++){
          //output.println("LineOrder("+s+"):"+Orders[i].LineOrder[s]+" j:"+j);
          if(Orders[i].LineOrder[s]==j){noPick=1;}
        }
          if(myBays[SKUs[Orders[i].Lines[j-1]].BayLocation].PickOrder<lowestBay && noPick==0){
            //output.println("PickOrder:"+myBays[SKUs[Orders[i].Lines[j-1]].BayLocation].PickOrder+" LowestBay:"+lowestBay+" j:"+j);
            lowestBay=myBays[SKUs[Orders[i].Lines[j-1]].BayLocation].PickOrder;
            myLine=j;
          }
            noPick=0;
          }
    Orders[i].LineOrder[nextLine]=myLine;
    //output.println("Order:"+i+" LineOrder:"+Orders[i].LineOrder[nextLine]);
    nextLine++;
    lowestBay=1000;
    }        
    nextLine=0;
  for(int m=0;m<Orders[i].Lines.length;m++){
    PickPath.add(myMap.nodes.get(myBays[SKUs[Orders[i].Lines[Orders[i].LineOrder[m]-1]].BayLocation].PickNode));
    //output.println("Next bay:"+SKUs[Orders[i].Lines[Orders[i].LineOrder[m]-1]].BayLocation);
  }
  PickPath.add(HomeNode);
}
  //output.println("Pick path generated");
  for (int i = 0; i < myBays.length; i++){
    myBays[i].display();
  }
  //output.println("Bays displayed");
  }
}

    

