
ArrayList<AgentQ> muGreenNetwork; //green type network
ArrayList<AgentQ> muCommercial; //built type cluster
ArrayList<AgentQ> muIndustrial; //built type cluster
ArrayList<AgentQ> muDomestic; //built type cluster
ArrayList<AgentQ> muPA;//built type cluster
ArrayList<AgentQ> muMajorRoads;// route type
ArrayList<AgentQ> muMajorPedes;// route type
ArrayList<AgentQ> muMajorPubTransport;// route type
ArrayList<AgentQ> muMajorCycle;// route type

ArrayList<AgentQ> muAttractorQ;

ArrayList<Integer> distanceListGreenNetwork;
ArrayList<Integer> distanceListCommercial;
ArrayList<Integer> distanceListIndustrial;
ArrayList<Integer> distanceListDomestic;
ArrayList<Integer> distanceListPA;
ArrayList<Integer> distanceListMajorRoads;
ArrayList<Integer> distanceListMajorPedes;
ArrayList<Integer> distanceListMajorPubTransport;
ArrayList<Integer> distanceListCycle;

ArrayList<Float> GreenNetworkFloat;
ArrayList<Float> CommercialFloat;
ArrayList<Float> IndustrialFloat;
ArrayList<Float> DomesticFloat;
ArrayList<Float> PAFloat;
ArrayList<Float> MajorRoadsFloat;
ArrayList<Float> MajorPedesFloat;
ArrayList<Float> MajorPubTransportFloat;
ArrayList<Float> CycleFloat;

boolean crash;

void setupQAgents() {
  muGreenNetwork = new ArrayList<AgentQ>();
  muCommercial = new ArrayList<AgentQ>();
  muIndustrial = new ArrayList<AgentQ>();
  muDomestic = new ArrayList<AgentQ>();
  muPA = new ArrayList<AgentQ>();
  muMajorRoads = new ArrayList<AgentQ>();
  muMajorPedes = new ArrayList<AgentQ>();
  muMajorPubTransport = new ArrayList<AgentQ>();
  muMajorCycle = new ArrayList<AgentQ>();
  muAttractorQ= new ArrayList<AgentQ>();

  distanceListGreenNetwork = new ArrayList<Integer>();
  distanceListCommercial = new ArrayList<Integer>();
  distanceListIndustrial = new ArrayList<Integer>();
  distanceListDomestic = new ArrayList<Integer>();
  distanceListPA = new ArrayList<Integer>();
  distanceListMajorRoads = new ArrayList<Integer>();
  distanceListMajorPedes = new ArrayList<Integer>();
  distanceListMajorPubTransport = new ArrayList<Integer>();
  distanceListCycle = new ArrayList<Integer>();


  GreenNetworkFloat = new ArrayList<Float>();
  CommercialFloat = new ArrayList<Float>();
  IndustrialFloat = new ArrayList<Float>();
  DomesticFloat = new ArrayList<Float>();
  PAFloat = new ArrayList<Float>();
  MajorRoadsFloat = new ArrayList<Float>();
  MajorPedesFloat = new ArrayList<Float>();
  MajorPubTransportFloat = new ArrayList<Float>();
  CycleFloat = new ArrayList<Float>();
}





void addAgentsQ() {

  ArrayList<Vec3D> positionListGreenNetwork = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/greenNoGo.jpg", positionListGreenNetwork);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListGreenNetwork.get(int(random(0, positionListGreenNetwork.size())));
    AgentQ myAgent = new AgentQ( origin, color(200), false);
    muGreenNetwork.add(myAgent);
  }

  ArrayList<Vec3D> positionListCommercial = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/buildNoGo.jpg", positionListCommercial);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListCommercial.get(int(random(0, positionListCommercial.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muCommercial.add(myAgent);
  }


  ArrayList<Vec3D> positionListIndustrial = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/industrial.jpg", positionListIndustrial);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListIndustrial.get(int(random(0, positionListIndustrial.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muIndustrial.add(myAgent);
  }

  ArrayList<Vec3D> positionListDomestic = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/buildings.jpg", positionListDomestic);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListDomestic.get(int(random(0, positionListDomestic.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muDomestic.add(myAgent);
  }

  ArrayList<Vec3D> positionListPA= new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/policeStations.jpg", positionListPA);
  // importDataQ1("QuarterScale1/tertiaryeducation.jpg", positionListPA);
  // importDataQ1("QuarterScale1/hospitals.jpg", positionListPA);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListPA.get(int(random(0, positionListPA.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muPA.add(myAgent);
  }

  ArrayList<Vec3D> positionListMajorRoads = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/routeNoGo.jpg", positionListMajorRoads);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListMajorRoads.get(int(random(0, positionListMajorRoads.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muMajorRoads.add(myAgent);
  }

  ArrayList<Vec3D> positionListPedes = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/majorwalkwaylinks.jpg", positionListPedes);
  //  importDataQ1("QuarterScale1/routeNoGo.jpg", positionListPedes);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListPedes.get(int(random(0, positionListPedes.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muMajorPedes.add(myAgent);
  }

  ArrayList<Vec3D> positionListPubTrans = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/routeNoGo.jpg", positionListPubTrans);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListPubTrans.get(int(random(0, positionListPubTrans.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muMajorPubTransport.add(myAgent);
  }

  ArrayList<Vec3D> positionListCycle = new ArrayList<Vec3D>();  
  importDataQ2("QuarterScale2/routeNoGo.jpg", positionListCycle);
  //AGENT  CLUSTER
  for (int i = 0; i < 0; i++) {
    Vec3D origin = positionListCycle.get(int(random(0, positionListCycle.size())));
    AgentQ myAgent = new AgentQ(origin, color(200), false);
    muMajorCycle.add(myAgent);
  }

  for (int i = 0; i < imgwidth; i+= stepSize) {
    for (int j =0; j < imgheight; j+= stepSize) {
      Vec3D origin = new Vec3D( i*gridSize, j*gridSize, 0);
      AgentQ myAgent = new AgentQ(origin, color(0, 0, 255), false);
      //  muAttractorQ.add(myAgent);
      //   println(muAttractorQ.size());
    }
  }
}




void runAgentsQ() {

  for (int i = 0; i < lines0pointsList.size(); i++) {
    AgentQ mb = (AgentQ)lines0pointsList.get(i);
    mb.runlines0pointsList();
  }

  for (int i = 0; i < waterList.size(); i++) {
    AgentQ mb = (AgentQ)waterList.get(i);
    mb.runwaterList();
  }

  for (int i = 1; i < (sand1List.size()-1); i++) {
    AgentQ before =  (AgentQ)sand1List.get(i-1);
    AgentQ self =  (AgentQ)sand1List.get(i);
    AgentQ after =  (AgentQ)sand1List.get(i+1);
    Vec3D back = before.loc.sub(self.loc);
    Vec3D front = after.loc.sub(self.loc);
    // self.eroded();
    self.chain(before.loc.x, before.loc.y, after.loc.x, after.loc.y, back, front);

    self.runsand1List();
  }

  for (int i = 1; i < (sand2List.size()-1); i++) {
    AgentQ before =  (AgentQ)sand2List.get(i-1);
    AgentQ self =  (AgentQ)sand2List.get(i);
    AgentQ after =  (AgentQ)sand2List.get(i+1);
    Vec3D back = before.loc.sub(self.loc);
    Vec3D front = after.loc.sub(self.loc);
    // self.eroded();
    self.chain(before.loc.x, before.loc.y, after.loc.x, after.loc.y, back, front);
    self.runsand2List();
  }

  for (int i = 1; i < (sand3List.size()-1); i++) {
    AgentQ before =  (AgentQ)sand3List.get(i-1);
    AgentQ self =  (AgentQ)sand3List.get(i);
    AgentQ after =  (AgentQ)sand3List.get(i+1);
    Vec3D back = before.loc.sub(self.loc);
    Vec3D front = after.loc.sub(self.loc);
    // self.eroded();
    self.chain(before.loc.x, before.loc.y, after.loc.x, after.loc.y, back, front);
    self.runsand3List();
  }

  for (int i = 1; i < (sand4List.size()-1); i++) {
    AgentQ before =  (AgentQ)sand4List.get(i-1);
    AgentQ self =  (AgentQ)sand4List.get(i);
    AgentQ after =  (AgentQ)sand4List.get(i+1);
    Vec3D back = before.loc.sub(self.loc);
    Vec3D front = after.loc.sub(self.loc);
    //  self.eroded();
    self.chain(before.loc.x, before.loc.y, after.loc.x, after.loc.y, back, front);
    self.runsand4List();
  }

  for (int i = 1; i < (sand5List.size()-1); i++) {
    AgentQ before =  (AgentQ)sand5List.get(i-1);
    AgentQ self =  (AgentQ)sand5List.get(i);
    AgentQ after =  (AgentQ)sand5List.get(i+1);
    Vec3D back = before.loc.sub(self.loc);
    Vec3D front = after.loc.sub(self.loc);
    //   self.eroded();
    self.chain(before.loc.x, before.loc.y, after.loc.x, after.loc.y, back, front);
    self.runsand5List();
  }

  for (int i = 0; i < sand1List.size(); i++) {
    AgentQ mb = (AgentQ)sand1List.get(i);
    //   mb.runsand1List();
  }

  for (int i = 0; i < island1List.size(); i++) {
    AgentQ mb = (AgentQ)island1List.get(i);
    mb.runisland1List();
  }

  for (int i = 0; i < island2List.size(); i++) {
    AgentQ mb = (AgentQ)island2List.get(i);
    mb.runisland2List();
  }

  for (int i = 0; i < island3List.size(); i++) {
    AgentQ mb = (AgentQ)island3List.get(i);
    mb.runisland3List();
  }

  for (int i = 0; i < perm1List.size(); i++) {
    AgentQ mb = (AgentQ)perm1List.get(i);
    mb.runperm1List();
  }

  for (int i = 0; i < perm2List.size(); i++) {
    AgentQ mb = (AgentQ)perm2List.get(i);
    mb.runperm2List();
  }

  for (int i = 0; i < sand2List.size(); i++) {
    AgentQ mb = (AgentQ)sand2List.get(i);
    //  mb.runsand2List();
  }

  for (int i = 0; i < sand3List.size(); i++) {
    AgentQ mb = (AgentQ)sand3List.get(i);
    //   mb.runsand3List();
  }

  for (int i = 0; i < sand4List.size(); i++) {
    AgentQ mb = (AgentQ)sand4List.get(i);
    //    mb.runsand4List();
  }

  for (int i = 0; i < sand5List.size(); i++) {
    AgentQ mb = (AgentQ)sand5List.get(i);
    //   mb.runsand5List();
  }

  for (int i = 0; i < con1List.size(); i++) {
    AgentQ mb = (AgentQ)con1List.get(i);
    mb.runcon1List();
  }

  for (int i = 0; i < con2List.size(); i++) {
    AgentQ mb = (AgentQ)con2List.get(i);
    mb.runcon2List();
  }

  for (int i = 0; i < con3List.size(); i++) {
    AgentQ mb = (AgentQ)con3List.get(i);
    mb.runcon3List();
  } 

  for (int i = 0; i < con4List.size(); i++) {
    AgentQ mb = (AgentQ)con4List.get(i);
    mb.runcon4List();
  }



  for (int i = 0; i < muGreenNetwork.size(); i++) {
    AgentQ mb = (AgentQ) muGreenNetwork.get(i);
    mb.runGreenNetwork();
  }

  for (int i = 0; i < muCommercial.size(); i++) {
    AgentQ mb = (AgentQ) muCommercial.get(i);
    mb.runCommercial();
  }

  for (int i = 0; i < muIndustrial.size(); i++) {
    AgentQ mb = (AgentQ) muIndustrial.get(i);
    mb.runIndustrial();
  }

  for (int i = 0; i < muDomestic.size(); i++) {
    AgentQ mb = (AgentQ) muDomestic.get(i);
    mb.runDomestic();
  }

  for (int i = 0; i < muPA.size(); i++) {
    AgentQ mb = (AgentQ) muPA.get(i);
    mb.runPA();
  }

  for (int i = 0; i < muMajorRoads.size(); i++) {
    AgentQ mb = (AgentQ) muMajorRoads.get(i);
    mb.runMajorRoads();
  }

  for (int i = 0; i < muMajorPedes.size(); i++) {
    AgentQ mb = (AgentQ) muMajorPedes.get(i);
    mb.runMajorPedes();
  }

  for (int i = 0; i < muMajorPubTransport.size(); i++) {
    AgentQ mb = (AgentQ) muMajorPubTransport.get(i);
    mb.runMajorPubTransport();
  }

  for (int i = 0; i < muMajorCycle.size(); i++) {
    AgentQ mb = (AgentQ) muMajorCycle.get(i);
    mb.runMajorCycle();
  }
  for (int i = 0; i < trailAgentList.size(); i++) {
    Trail mb = (Trail) trailAgentList.get(i);
    mb.runTrail();
  }



  /*
  ArrayList<AgentQ> muGreenNetwork; //green type network
   ArrayList<AgentQ> muCommercial; //built type cluster
   ArrayList<AgentQ> muIndustrial; //built type cluster
   ArrayList<AgentQ> muDomestic; //built type cluster
   ArrayList<AgentQ> muPA;//built type cluster
   ArrayList<AgentQ> muMajorRoads;// route type
   ArrayList<AgentQ> muMajorPedes;// route type
   ArrayList<AgentQ> muMajorPubTransport;// route type
   ArrayList<AgentQ> muMajorCycle;// route type
   */
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class AgentQ {
  boolean crash = false;
  // GLOBAL VARIABLES
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D(1, 2, 0); 
  Vec3D acc = new Vec3D(0, 0, 0);
  color colour;
  String cha;
  float ht = 300;
  boolean perchBool;
  float repeldist;
  float drag;
  float wandertheta;
  float theta;
  int timeIntervalFlag = 1000;
  float multiplier = 1;
  float maxDis;

  boolean runonce = true;
  boolean trigger1 = true;
  boolean trigger2 = true;
  boolean trigger3 = true;

  //CONSTRUCTOR
  AgentQ(Vec3D _loc, color _colour, boolean _crash) {

    loc = _loc;
    colour = _colour;
    crash = _crash;
  }


  AgentQ(Vec3D _loc, color _colour, float _maxDis) {
    loc = _loc;
    colour = _colour;
  }

 

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////1

  void runlines0pointsList() {
    display();
    cha = "lines0points";
  }


  void runtrailAgentList() {
    display();
    cha = "trail";
  }
  void runwaterList() {
    display();
    move();
    //   void seperate(ArrayList type, float magnitude, float maxdist) {

    current();
    current1();
    current2();
    borderdeath();
    seperate(waterList, 5, 35);
    cohesion(waterList, 0.001, 40);
    align(waterList, 0.03, 30);
    /*
    repel(sand1List, 50, 30);
     repel(sand2List, 50, 30);
     repel(sand3List, 50, 30);
     repel(sand4List, 50, 30);
     repel(sand5List, 50, 30);
     repel(island1List, 50, 30);
     repel(island2List, 50, 30);
     repel(island3List, 50, 30);
     repel(perm1List, 50, 30);
     repel(perm2List, 50, 30);
     */
    repel(sand1List, 100, 15);
    repel(sand2List, 100, 15);
    repel(sand3List, 100, 15);
    repel(sand4List, 100, 15);
    repel(sand5List, 100, 15);
    repel(island1List, 100, 15);
    trail(waterList);

    cha = "water";
  }

  void runsand1List() {
    //display();
    //cha = "sand1";
    eroded(crash);
  }

  void runsand2List() {
    //  display();
    //    cha = "sand2";
    eroded(crash);
  }

  void runsand3List() {
    //  display();
    // cha = "sand3";
    eroded(crash);
  }

  void runsand4List() {
    //  display();
    // cha = "sand4";
    eroded(crash);
  }

  void runsand5List() {
    //  display();
    // cha = "sand5";
    eroded(crash);
  }

  void runcon1List() {
    display();
    cha = "con1";
  }
  void runcon2List() {
    display();
    cha = "con2";
  }
  void runcon3List() {
    display();
    cha = "con3";
  }
  void runcon4List() {
    display();
    cha = "con4";
  }

  void runisland1List() {
    display();
    cha = "island1";
  }

  void runisland2List() {
    display();
    cha = "island2";
  }

  void runisland3List() {
    display();
    cha = "island3";
  }

  void runperm1List() {
    display();
    cha = "perm1";
  }

  void runperm2List() {
    display();
    cha = "perm2";
  }

  void runGreenNetwork() {
  }
  ////////////2
  void runCommercial() {
  }

  ////////////3
  void runIndustrial() {
  }
  ////////////4
  void runDomestic() {
  }
  ////////////5
  void runPA() {
  }
  ////////////6
  void runMajorRoads() {
  }
  ////////////7
  void runMajorPedes() {
  }

  ////////////8
  void runMajorPubTransport() {
  }

  ////////////9
  void runMajorCycle() {
  }



  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  void eroded(boolean crash) {

    Vec3D point1 = new Vec3D(2281, 1544, 0);
    Vec3D point2 = new Vec3D(3000, 1865, 0);
    Vec3D point3 = new Vec3D(4110, 2447, 0);
    Vec3D point4 = new Vec3D(1904, 1324, 0);
    for (int i =0; i < waterList.size(); i++) {
      AgentQ other = (AgentQ)waterList.get(i);

      float diff = loc.distanceTo(other.loc);

      float diff1 = loc.distanceTo(point1);
      float diff2 = loc.distanceTo(point2);
      float diff3 = loc.distanceTo(point3);
      float diff4 = loc.distanceTo(point4);

      if (diff < 18 && other.speed.y > 3 && diff1 > 190 && diff2 > 230   && diff3 > 270     ) {
        Vec3D rec = loc.sub(other.loc);
        rec.normalizeTo(2);
        loc.addSelf(rec);
        noFill();
        //     stroke(255,0,0,70);
        stroke(255, 25);
        line(loc.x, loc.y, loc.x - 4*(-loc.x +other.loc.x), loc.y - 4*(-loc.y + other.loc.y));
        line(4300, loc.y, 4360, loc.y);
        PFont font1;
        
font1 = loadFont("RomanD-30.vlw");
        textFont(font1);
        fill(255,100);
        text(loc.x, 4360, loc.y);
        text(loc.y, 4450+80, loc.y);
      }
      else  if (diff < 18 && other.speed.y > 3 && diff1 < 190 || diff < 18 && other.speed.y > 3   && diff2 < 230  ||diff < 18 && other.speed.y > 3  && diff3 < 270  ||diff < 18  && diff4 < 300   ) {

        Vec3D rec = loc.sub(other.loc);
        rec.normalizeTo(2.5);
        loc.subSelf(rec);
        // stroke(255,0,0,70);
        stroke(255, 25);
        line(loc.x, loc.y, loc.x+ 4*(other.loc.x-loc.x), loc.y+4*(other.loc.y-loc.y));

        line(4300, loc.y, 4360, loc.y);
        PFont font1;
      font1 = loadFont("RomanD-30.vlw");
        textFont(font1);
      fill(255,100);
        text(loc.x, 4360, loc.y);
        text(loc.y, 4450+80, loc.y);
      }
    }
  }


  void current() {
    Vec3D pointa = new Vec3D(3200, -450, 0);
    float distance = loc.distanceTo(pointa);

    if (speed.y <=0 && distance < 2000) {
      acc = new Vec3D(0, 0.45, 0);
    }
    if (speed.y <=5  && distance < 4000 ) {
      acc = new Vec3D(0.05, 0.15, 0);
    }
  }

  void current1() {
    Vec3D pointb = new Vec3D(2679, 1649, 0);
    float distance = loc.distanceTo(pointb);
    if (speed.y >= 0 && distance < 250) {
      Vec3D diff = loc.sub(pointb);
      diff.normalizeTo(0.05);
      acc.addSelf(diff);
    }
  }

  void current2() {
    Vec3D pointb = new Vec3D(3750, 1200, 0);
  
    float distance = loc.distanceTo(pointb);
    if (speed.y >= 0 && distance < 200) {
      Vec3D diff = loc.sub(pointb);
      diff.normalizeTo(0.3);
      acc.addSelf(diff);
    }
  }

  void borderdeath() {
    if (loc.x > 4358) {
      waterList.remove(this);
    }
    if (loc.y > 2745) {
      waterList.remove(this);
    }
    if (loc.x < 0) {
      waterList.remove(this);
    }
    if (loc.y < 0) {
      waterList.remove(this);
    }
  }

  //    self.anchor(before.x, before.y, after.x, after.y);
  void chain(float beforex, float beforey, float afterx, float aftery, Vec3D back, Vec3D front) {
    float diff1 = sqrt(sq(loc.x - beforex)+sq(loc.y-beforey));
    float diff2 = sqrt(sq(loc.x - afterx)+sq(loc.y-aftery));
    noFill();
    stroke( 255, 0, 0, 25);
    line(loc.x, loc.y, loc.x+back.x, loc.y+back.y);
    if (diff1 > 6 && diff1 <= 12 ) {
      back.normalizeTo(0.1);
      loc.addSelf(back);
    }
    if (diff1 > 12 ) {
      back.normalizeTo(0.3);
      loc.addSelf(back);
    }
    if (diff2 > 6 && diff2 <= 12) {
      front.normalizeTo(0.1);
      loc.addSelf(front);
    }
    if (diff2 > 12) {
      front.normalizeTo(0.3);
      loc.addSelf(front);
    }
    noFill();
    stroke( 255, 0, 0, 50);
    line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
    line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
  }

  boolean crash() {
    //  boolean crash = crash;
    return crash;
  }


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////OLD STUFF STARTS/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void triggera() {
    if (trigger1) {  
      runonce = true;
      trigger1 = false;
    }
  }

  void triggerb() {
    if (trigger2) {  
      runonce = true;
      trigger2 = false;
    }
  }

  Vec2D Pos() {
    Vec2D pos = new Vec2D(loc.x, loc.y);
    return pos;
  }







  void attractField(ArrayList<Integer> inpListDistance, float magnitude) {

    //println("inpListDistance size ="+inpListDistance.size());
    //println("muAttractorDistance size ="+muAttractor.size());


    Vec3D steer = new Vec3D();
    int count = 0;
    for (int j = 0 ; j < muAttractorQ.size(); j++) {
      AgentQ other = (AgentQ)muAttractorQ.get(j);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < 5.5*sqrt(2)*stepSize*gridSize) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(inpListDistance.get(j));
        //diff.scaleSelf(pow(2.718, (-(pow(distance, 2)/2*10000))) );
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);

    acc.subSelf(steer);
  }

  void repel(ArrayList type, float magnitude, float repeldist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int j = 0 ; j < type.size(); j++) {
      AgentQ other = (AgentQ)type.get(j);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < repeldist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
        if (crash == false) {
          crash = true;
        }
        else {
          crash = false;
        }
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  int[][] combineNest(int sum[][], int result[][]) {
    for (int i=0;i<imgwidth;i++) {
      for (int j=0;j<imgheight;j++) {
        result[i][j]+=sum[i][j];
      }
    }
    return result;
  }

  ////////////////////////////////////BEHAVIOUR/////////////////////////////////
  void seeLine(ArrayList type, color colour) {
    for ( int i = 0; i < type.size();i++) {
      stroke(colour);
      line(3*speed.x+loc.x, 3*speed.y+loc.y, loc.x, loc.y);
    }
  }

  void wander(ArrayList type, float maxradius, float maxdist, float maxchange, float magnitude) {
    Vec3D steer = new Vec3D();
    float change = (random(-(maxchange), maxchange));
    theta = theta + change;
    Vec3D circledirection = new Vec3D((maxradius*sin(theta)), (maxradius*cos(theta)), 0);
    Vec3D direction = speed.sub(loc);
    direction.normalizeTo(maxdist);
    Vec3D circleLoc = direction.add(circledirection);
    circleLoc.normalizeTo(magnitude);
    acc.addSelf(circleLoc);
  }

  void align(ArrayList type, float magnitude, float maxdist) {
    Vec3D front = new Vec3D();
    int count = 0;
    for (int i =0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < maxdist ) {
        front.addSelf(other.speed);
        count++;
      }
    }
    if (count>0) {
      front.scaleSelf(1.0/count);
    }
    front.scaleSelf(magnitude);
    acc.addSelf(front);
  }

  void seperate(ArrayList type, float magnitude, float maxdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < maxdist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void cohesion(ArrayList type, float magnitude, float maxdist) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < maxdist) { 
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0 ) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.normalizeTo(1.0);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void attract(ArrayList type, float magnitude, float attractdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int j = 0; j < type.size(); j++) {
      AgentQ other = (AgentQ)type.get(j);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < attractdist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance+0.1);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.subSelf(steer);
  }

  void seek(ArrayList type, float magnitude, float minSeekRange, float seekRange, float seekRangeAngle) {
    Vec3D steer = new Vec3D();

    //     Vec3D normalspeed = direction.normalizeTo(0.1);
    // Vec3D newloc = loc.add(normalspeed);
    int count =0;
    for (int i = 0; i < type.size() ; i++) {
      Trail other = (Trail) type.get(i);
      float distance = loc.distanceTo(other.loc());
      if (distance > minSeekRange && distance < seekRange) {
        //Vec3D vector = loc.sub(other.loc);
        Vec3D vector = new Vec3D(   (other.loc.x-loc.x), (other.loc.y-loc.y), 0);
        Vec3D direction = new Vec3D(   (speed.x-loc.x), (speed.y-loc.y), 0);

        float lengthDirection = sqrt(direction.x*direction.x+direction.y*direction.y);
        float lengthVector = sqrt(vector.x*vector.x+vector.y*vector.y);

        float dotproduct = (direction.x*vector.x) + (direction.y*vector.y);
        float result = acos(dotproduct / (lengthVector*lengthDirection));
        // println(dotproduct / (lengthVector*lengthDirection));
        //  float resultmag = sqrt(pow(result, 2));

        // if (resultmag >= 0 && resultmag < seekRangeAngle) {
        if (result >= 0 && result < seekRangeAngle) {
          //    vector.normalizeTo(1.0);
          steer.addSelf(vector);
          count++;
        }
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }


  void collisionprevention(ArrayList type, color colour, float magnitude, float seekRange, float seekRangeAngle) {
    Vec3D steer = new Vec3D();

    //     Vec3D normalspeed = direction.normalizeTo(0.1);
    // Vec3D newloc = loc.add(normalspeed);
    int count =0;
    for (int i = 0; i < type.size() ; i++) {
      Trail other = (Trail) type.get(i);
      float distance = loc.distanceTo(other.loc());
      if (distance > 30 && distance < seekRange) {
        //Vec3D vector = loc.sub(other.loc);
        Vec3D vector = new Vec3D(   (other.loc.x-loc.x), (other.loc.y-loc.y), 0);
        Vec3D direction = new Vec3D(   (speed.x-loc.x), (speed.y-loc.y), 0);

        float lengthDirection = sqrt(direction.x*direction.x+direction.y*direction.y);
        float lengthVector = sqrt(vector.x*vector.x*vector.y*vector.y);

        float dotproduct = (direction.x*vector.x) + (direction.y*vector.y);
        float result = acos(dotproduct / (lengthVector*lengthDirection))-PI/2;
        float resultmag = sqrt(pow(result, 2));

        if (resultmag >= 0 && resultmag < seekRangeAngle) {
          steer.subSelf(vector);
          count++;
        }
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void flee(ArrayList type, float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >= 0 && distance < 80) {
        Vec3D direction = loc.sub(other.loc);
        direction.normalizeTo(1.0/distance);
        steer.addSelf(direction);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void trail(ArrayList type) {
    if (millis() > lastTimeCheck + timeIntervalFlag) {
      for (int i = 0; i < type.size();i++) {
        AgentQ other = (AgentQ)type.get(i);
        lastTimeCheck = millis ();
        if (frameCount>10) {
          trailAgentList.add(new Trail(other.loc.copy()));
        }
      }
    }
  }



  void spawn(ArrayList type) {

    if (millis() > lastTimeCheck + timeIntervalFlag) {
      int count = 0;
      lastTimeCheck = millis (); 
      if (frameCount>200) {
        for (int i = 0; i < type.size();i++) {
          AgentQ other = (AgentQ)type.get(i);
          float distance = loc.distanceTo(other.loc);
          if (distance >= 0 && distance < 250) {
            count++;
          }
          if (count > 70) {
            spawnAgentList.add(new Spawn(loc.copy()));
          }
        }
      }
    }
  }


  void friction(float magnitude) {
    Vec3D steer = new Vec3D();
    Vec3D vector = new Vec3D(speed);
    // for (int i =0; i < type.size(); i++) {
    steer.addSelf(speed);        
    float speedlength = sqrt(pow((speed.x), 2)+pow((speed.y), 2));
    steer.scaleSelf(magnitude);
    acc.subSelf(steer);
    drag = drag + (sqrt(pow(steer.x, 2)+ pow(steer.y, 2)));
  }



  void bounce() {
    if (loc.x >
      width) {
      speed.x = speed.x  * -1;
    }
    if (loc.x < 
      0) {
      speed.x  = speed.x  * -1;
    }
    if (loc.y >
      height) {
      speed.y = speed.y * -1;
    }
    if (loc.y < 
      0) {
      speed.y = speed.y * -1;
    }
  }

  void borders() {
    if (loc.x < 0) loc.x = width;
    if (loc.y < 0) loc.y = height;
    if (loc.x > width) loc.x = 0;
    if (loc.y > height) loc.y = 0;
  }






  void move() {
    /*
        Vec3D normspeed = speed.normalizeTo(1.0);
     Vec3D normacc = acc.normalizeTo(1.0);
     
     //  println("speed" + speed);
     //  println("acc" + acc);
     float lengthDirection = sqrt(normspeed.x*normspeed.x+normspeed.y*normspeed.y);
     float lengthVector = sqrt(normacc.x*normacc.x+normacc.y*normacc.y);
     
     //  println(lengthDirection);
     //  println(lengthVector);
     
     float dotproduct = (normspeed.x*normacc.x) + (normspeed.y*normacc.y);
     float result = acos(dotproduct / (lengthVector*lengthDirection));
     println((lengthVector*lengthDirection));
     */

    //    if (result > 0 && result < (PI/6) ){

    speed.addSelf(acc);
    // constrain(drag, 0.0, 2.0);
    speed.limit(4);

    loc.addSelf(speed);
    acc.clear();
    //   }
    //   else if (result >PI/6){
    //   acc.scaleSelf(0.3);
    //     speed.addSelf(acc);
    //   constrain(drag, 0.0, 2.0);
    //   speed.limit(2-drag);
    //    loc.addSelf(speed);
    //    acc.clear();


    //    }
  }


  void perch(ArrayList type, float perchthreshold) {
    for (int i = 0; i < type.size();i++) {
      perchBool = false;
      Vec3D steer = new Vec3D();
      float perchspeed = sqrt( pow((speed.x), 2) + pow((speed.y), 2));
      if (perchspeed > perchthreshold) {
        perchBool=true;
        if (perchBool=true) {
          float timer = random(350, 550);
          while (timer > 0 ) {
            timer = timer-1;
            //     steer.x = -speed.x;
            //steer.y = -speed.y;
            speed.scaleSelf(0);
          }
        }
      }
    }
  }

  void lineBetween(ArrayList type, float maxdist) {
    int counter = 0;
    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ) type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 12 && distance < 15) {
        stroke(0, 255, 0);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  String cha() {
    return cha;
  }


  void display() {


    if (cha == "lines0points") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }


    else if (cha == "island1") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }
    else if (cha == "island2") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }
    else if (cha == "island3") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }

    else if (cha == "perm1") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }

    else if (cha == "perm2") {
      noFill();
      stroke(100, 255, 100, 35);
      //    stroke( 255, 0,0,25);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }
    else               if (cha == "trail") {
      noFill();
      stroke( 30, 30, 255, 25);
      ellipse(loc.x, loc.y, 1, 1);
    }
    else if (cha == "water") {
      noFill();
      stroke( 30, 30, 255, 50);
      ellipse(loc.x, loc.y, 1, 1);
    }

    else if (cha == "sand1") {
      noFill();
        strokeWeight(4);
      stroke( 255, 0, 0, 25);
   //  line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
  //   line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }

    else if (cha == "sand2") {
      noFill();
      strokeWeight(4);
      stroke( 255, 0, 0, 25);
 //    line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
 //    line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }

    else if (cha == "sand3") {
      noFill();
      strokeWeight(4);
      stroke( 255, 0, 0, 25);
  //    line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
  //    line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }

    else if (cha == "sand4") {
      noFill();
      strokeWeight(4);
      stroke( 255, 0, 0, 25);
  //    line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
  //    line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }  
    else if (cha == "sand5") {
      noFill();
      strokeWeight(4);
      stroke( 255, 0, 0, 25);
  //    line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
  //    line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
      
    }


    else if (cha == "con1") {
      noFill();
      strokeWeight(1);
      //stroke(0, 255, 0, 17);
      stroke(255, 17);
      line(loc.x-1, loc.y-1, loc.z, loc.x+1, loc.y+1, loc.z);
      line(loc.x-1, loc.y+1, loc.z, loc.x+1, loc.y-1, loc.z);
    }
    else if (cha == "con2") {
      noFill();
      //stroke(0, 255, 0, 14);
      stroke(255, 17);
      line(loc.x-1, loc.y-1, loc.z, loc.x+1, loc.y+1, loc.z);
      line(loc.x-1, loc.y+1, loc.z, loc.x+1, loc.y-1, loc.z);
    }
    else if (cha == "con3") {
      noFill();
      // stroke(0, 255, 0, 11);
      stroke(255, 17);
      line(loc.x-1, loc.y-1, loc.z, loc.x+1, loc.y+1, loc.z);
      line(loc.x-1, loc.y+1, loc.z, loc.x+1, loc.y-1, loc.z);
    }
    else if (cha == "con4") {
      noFill();
      // stroke(0, 255, 0, 8);
      stroke(255, 17);
      line(loc.x-1, loc.y-1, loc.z, loc.x+1, loc.y+1, loc.z);
      line(loc.x-1, loc.y+1, loc.z, loc.x+1, loc.y-1, loc.z);
    }


    else if (cha == "greenNetwork") {
      noFill();
      stroke(0, 255, 0);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y+1);
      line(loc.x-1, loc.y+1, loc.x+1, loc.y-1);
    }



    else if (cha == "commercial") {
      noFill();
      stroke(255, 150, 0);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y-1 );
      line(loc.x-1, loc.y+1, loc.x+1, loc.y+1 );
      line(loc.x-1, loc.y-1, loc.x-1, loc.y+1 );
      line(loc.x+1, loc.y+1, loc.x+1, loc.y-1 );
    }

    else  if (cha == "domestic") {
      noFill();
      stroke(255, 0, 0);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y-1 );
      line(loc.x-1, loc.y+1, loc.x+1, loc.y+1 );
      line(loc.x-1, loc.y-1, loc.x-1, loc.y+1 );
      line(loc.x+1, loc.y+1, loc.x+1, loc.y-1 );
    }

    else    if (cha == "PA") {
      noFill();
      stroke(255, 0, 0);
      line(loc.x-1, loc.y-1, loc.x+1, loc.y-1 );
      line(loc.x-1, loc.y+1, loc.x+1, loc.y+1 );
      line(loc.x-1, loc.y-1, loc.x-1, loc.y+1 );
      line(loc.x+1, loc.y+1, loc.x+1, loc.y-1 );
    }

    else       if (cha == "majorRoads") {
      noFill();
      stroke(0, 0, 255);
      ellipse(loc.x, loc.y, 3, 3);
    }

    else            if (cha == "majorPedes") {
      noFill();
      stroke(0, 0, 160);
      ellipse(loc.x, loc.y, 3, 3);
    }

    else              if (cha == "majorPedes") {
      noFill();
      stroke(0, 50, 255);
      ellipse(loc.x, loc.y, 3, 3);
    }

    else            if (cha == "majorPublicTransport") {
      noFill();
      stroke(50, 0, 255);
      ellipse(loc.x, loc.y, 3, 3);
    }

    else               if (cha == "cycle") {
      noFill();
      stroke(100, 0, 255);
      ellipse(loc.x, loc.y, 3, 3);
    }
  }
}


