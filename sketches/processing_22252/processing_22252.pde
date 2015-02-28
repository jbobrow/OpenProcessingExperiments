
class City{
  Station[] stations; 
  Node[] nodes; 
  Edge[] edges; 
  Path[] lignes; 
  Train[] trains; 
  Passenger[] passengers; 


  int nbStations, nbNodes, nbEdges, nbLignes, nbTrains, nbPassengers;

  City(){
    println("city initiated.");
    stations=new Station[1000];
    nodes=new Node[1000];
    edges=new Edge[1000];
    lignes=new Path[1000];
    trains=new Train[1000];
    passengers=new Passenger[1000];

    this.nbStations=0;
    this.nbNodes=0;
    this.nbEdges=0;
    this.nbLignes=0;
    this.nbTrains=0;
    this.nbPassengers=0;  
  }
  City(int myStations, int myNodes, int myEdges, int myLignes, int myTrains, int myPassengers){
    stations=new Station[myStations];
    nodes=new Node[myNodes];
    edges=new Edge[myEdges];
    lignes=new Path[myLignes];
    trains=new Train[myTrains];
    passengers=new Passenger[myPassengers];

    this.nbStations=0;
    this.nbNodes=0;
    this.nbEdges=0;
    this.nbLignes=0;
    this.nbTrains=0;
    this.nbPassengers=0;  
  }

  void loadFile(String dataFile){
    int i=7;
    String[] data = loadStrings(dataFile);
    //  stations=new Station[int(data[0])];
    //  nodes=new Node[int(data[1])];
    //  lignes=new Path[int(data[2])];
    //  edges=new Edge[int(data[3])];
    //  trains=new Train[int(data[4])];
    //  passengers=new Passenger[int(data[5])];

    while (!data[i].equals("---")){
      println(i+" "+data[i]);
      String[] station=split(data[i],';');
      addStation(int(station[0]),int(station[1]),station[2],boolean(station[3]));
      i++;
    }
    i++;
    while (!data[i].equals("---")){
      println(i+" "+data[i]);
      addNode(int(data[i]));
      i++;
    }
    i++;
    while (!data[i].equals("---")){
      println(i+" "+data[i]);
      String[] cols=split(data[i],' ');
      addLigne(color(int(cols[0]),int(cols[1]),int(cols[2])));
      i++;
    }
    i++;
    while (!data[i].equals("---")){
      println(i+" "+data[i]);
      String[] edge=split(data[i],' ');
      addEdge(int(edge[0]),int(edge[1]),int(edge[2]));
      i++;
    }
  }
  void addStation(float xpos, float ypos, String myName, boolean myType){
    println("Adding station #"+nbStations+" with these parameters: "+xpos+" "+ypos+" "+myName+" "+myType);
    println("stations[] can hold:"+stations.length+" items.");



    stations[nbStations]=new Station(xpos, ypos, myName, myType);
    nbStations++;
    println("Now "+nbStations+" stations.");
  }

  void addNode(int myStationIndex){
    nodes[nbNodes]= new Node(stations[myStationIndex]);
    nbNodes++;
  }

  void addLigne(color myColor){
    lignes[nbLignes]=new Path(myColor);
    nbLignes++;
  }
  void addEdge(int startNodeIndex, int endNodeIndex, int myLigneIndex){
    edges[nbEdges]=new Edge(nodes[startNodeIndex], nodes[endNodeIndex], lignes[myLigneIndex]);
    lignes[myLigneIndex].addEdge(edges[nbEdges]);
    nbEdges++;
  }

  void addTrain(int myPassengers, int myLigneIndex, int myReturnLigneIndex, int myPos){
    trains[nbTrains]= new Train(myPassengers, lignes[myLigneIndex], lignes[myReturnLigneIndex], myPos);
    nbTrains++;
  }

  void addPassenger(Passenger myPassenger){
    passengers[nbPassengers]=myPassenger;
    nbPassengers++;
  }

  Node getNode(int i){
    return this.nodes[i];
  }
  Station getStation(int i){
    return this.stations[i];
  }
  Train getTrain(int i){
    return this.trains[i];
  }
  Path getLigne(int i){
    return this.lignes[i];
  }
  Edge getEdge(int i){
    return this.edges[i];
  }
  Passenger getPassegner(int i){
    return this.passengers[i];
  }
  void updateTrains(){
    for(int i=0;i<nbTrains;i++){
      trains[i].update();
    }
  }
  void displayTrains(){
    for(int i=0;i<nbTrains;i++){
      trains[i].display();
    }
  }
  
  void drawNet(){
    int circleSize=0;
    int netAlpha=24;
    for(int i=0;i<nbLignes;i++){
      fill(lignes[i].pathColor,netAlpha);
      stroke(lignes[i].pathColor,netAlpha);
      //strokeWeight(2);
      for (int j=0;j<lignes[i].nbEdges;j++){
        float x1,x2,y1,y2;
        x1=lignes[i].edges[j].startNode.getX();
        x2=lignes[i].edges[j].endNode.getX();
        y1=lignes[i].edges[j].startNode.getY();
        y2=lignes[i].edges[j].endNode.getY();
        ellipse(x1,y1,circleSize,circleSize);
        if(j+1==lignes[i].nbEdges){ellipse(x2,y2,circleSize,circleSize);}
        line(x1,y1,x2,y2);
      }
    }
  }
}      

class Passenger{
}







