
import java.awt.Polygon; 

// --- Different "Windows" ----
public Map map;
public Filter filter;
public Overlay overlay;

public static color background;
private StateWindow stateWindow;
 //true if number, false if percentage
public static boolean numOrPerc;

public static int dataType;
//1 for alone
//2 for carpooled
//3 for public
//4 for walked
//5 for other
//6 for home


public PFont font48;
public PFont font36;
public PFont font24;
public PFont font14;

public static Draw draw;

public static int filterOn;

private int width;
private int height;
String[] typeName = {"Drove Alone","Carpooled","Public Trans.","Walked","Other","Home"};

ControlP5 cp5;
      
color[] typeColor;

int filterWindowY;


void setup(){
  draw = new Draw();
  
  filterOn = 1;
  filterWindowY= 550;
  
  cp5 = new ControlP5(this);
  colorMode(HSB,100);
  
  color blue = color(55,76,100); 
  color green = color(24,100,100); 
  color purple = color(77,80,100);
  color orange = color(9,100,100);
  color magenta = color(90,80,100);
  color red = color(100,83,100);
  
  color[] typeColorTemp = {blue,green,purple,orange, magenta, red};
  typeColor= typeColorTemp;
  
  background = color(0,0,100);
  
  // --- Canvas Setup ----
  height = 900;
  width = 1200;
  size(width,height);
  background(background);
  noStroke();
  
  // --- Text Setup ----
  fontLoad();
  
  // --- Create Map ----
  int marginTop = 130;
  int mapWidth = 800;
  map = new Map();
  stateWindow = new StateWindow(mapWidth, marginTop);
  
  // --- Start with Numbers ----
  numOrPerc = true;
  overlay = new Overlay(map);
  filter = new Filter(overlay, typeName, typeColor, 50,filterWindowY, cp5);
  
  
   //(and other stuff)
  
  

}

void fontLoad(){
  font48 = loadFont("SofiaProLight-48.vlw");
  font36 = loadFont("SofiaProLight-36.vlw");
  font24 = loadFont("SofiaProLight-24.vlw");
  font14 = loadFont("SofiaProLight-14.vlw");
}

void mouseMoved(){
  
  if (draw.within(10,150,720,800)){
    
    if(filterOn==0){
      map.mouseMoved();
      overlay.reset();
    }
    else{
      overlay.mouseMoved();
    }
  }
  else{
    map.reset();
    overlay.reset();
    
  }

  if (draw.within(800,200,width,height)){
    stateWindow.mouseMoved();
  }
  

}


void mousePressed(){
  
     // --- Mouse is pressed on Map ----
  map.mousePressed();

  
  //window box check
  if (draw.within(50,filterWindowY,width,height)){
    filter.mousePressed();
  }
  //if ((10,150,720,800)){
    if(filterOn==1){
        overlay.mousePressed();
      }
  //}
}


// --- Exists so Draw isn't called every time ----
void redraw(){
}

void draw(){
  draw.draw();
}

// --- This is the CP5 Controller that hooks to the slider ----
void controlEvent(ControlEvent theEvent){
  if(theEvent.getId()!=-1){
    overlay.setMax(theEvent.getId(), (int)theEvent.getValue());
   
  }
}
import  java.awt.geom.Ellipse2D;

public class CircleData implements Comparable<CircleData>{
  
  Ellipse2D circleBound;
  float dataValue;
  State st;
  int dataType;
  color col;
  int diameter;
  int value;
  boolean brushing;
  
  public CircleData(State st, int diameter, int dataType, int value, color col) {
    this.dataValue = (float)(st.getStateData().getDataArray()[dataType]);
    this.dataType = dataType;
    this.st =st;
    this.col = col;
    this.diameter = diameter;
    this.value = value;
    this.circleBound = new Ellipse2D.Float(st.getCenterX()-diameter/2, st.getCenterY()-diameter/2, diameter, diameter);
    brushing = false;
  }
  
  int getDataType(){
    return dataType;
  }
  
  void setBrushing(boolean tf){
    brushing = tf;
  }
  int getValue(){
    return value;
  }
  void draw() {
    if(brushing){
      stroke(100);
      fill(col);
    }
    else{
      stroke(col);
      fill(col,30);
    }
    strokeWeight(2);
    ellipse(st.getCenterX(), st.getCenterY(), diameter, diameter);  
    st.drawName();
  }
  
  State getState(){
    return st;
  }
  
  boolean contains(){
    return circleBound.contains(mouseX,mouseY);
  }
  
  public int compareTo(CircleData other)
  {
    return other.diameter-this.diameter;//populationDensity.comparetTo(other.populationDensity);
  }
  
}
/*
public class CircleComparator implements Comparator<CireData> {
   
    @Override
    public int compare(CircleData c1, CircleData c2) {  
       return c2.diameter - c1.diameter;
    }
}
*/

public class Draw{
  
  public Draw(){
    //draw();
  }
  
  public void title(){
    fill(34);
    noStroke();
    rect(0,0,width,100);
    fill(background);
    textFont(font48, 48);
    textAlign(CENTER);
    text("U.S. Commuting by State", width/2, 65);  
  }
  
  public void draw(){
    background(background);
    title();
    map.drawMap();
    stateWindow.drawWindow();
    filter.drawFilter();
    if(filterOn==1){
      overlay.drawOverlay();
    }
  }
  
  public void brushMap(State state){
    //background(background);
    map.brush(state);
    
  }
  
  public void filterChange(){
    draw.draw();
  }
  
  public void setWindowState(State state){
    map.brush(state);
    stateWindow.setState(state);
  }
  
  public void setOverlayState(State state, int dataType){
    overlay.setOverlayState(state, dataType);
  }
  
  //--if brushing on an overlay
  public void windowCheck(State state, int dataType){
      stateWindow.windowCheck(state, dataType);
  }

 public void pieReset(){
      stateWindow.pieReset();
  }
 
 public void overlayText(String overlay){
     if(overlay!=null && !"".equals(overlay)){
       noStroke();
       fill(0,60);
       textFont(font14,14);
       textAlign(LEFT,BOTTOM);
       rect(mouseX-5,mouseY-20,textWidth(overlay)+10,20);
       fill(100);
       text(overlay, mouseX, mouseY);
     }
   }
 
//saves processing power by only checking when near an object
boolean within(int x1, int y1, int x2, int y2){
  if (mouseX>x1 && mouseX<x2 && mouseY>y1 && mouseY<y2){
    return true;
  }
    return false;
}
  
}

import java.awt.Rectangle;
import controlP5.*;

public class Filter{
 
  
  String[] typeName;
  color[] typeColor;
  int x;
  int y;
  
  int moduleTop = 80;
  int moduleWidth = 350;
  int marginLeft = 40;
  
  int onOffMargin = 200;
   
  ArrayList<Module> module;
  ControlP5 cp5;
  
  
  Button buttonOn;
  Button buttonOff;
  
  Button buttonNum;
  Button buttonPerc;

  int buttonSize;
  
  int marginTop;
  Overlay overlay;
   
  public Filter(Overlay overlay, String[] typeName, color[] typeColor, int x, int y, ControlP5 cp5){
    
    this.overlay= overlay; 
    marginTop = 100;
    this.cp5 = cp5;
    
     this.typeColor = typeColor;
     this.typeName = typeName;
     this.x = x;
     this.y = y;
     module = new ArrayList<Module>(6);
     
     for (int i=0; i<typeName.length/3; i++){
      module.add(new Module(i,x,y+marginTop, cp5));
      }
      for (int i=typeName.length/3; i<2*(typeName.length/3); i++){
        module.add( new Module(i,x+(moduleWidth+marginLeft),y+marginTop, cp5));
      }
      for (int i=2*(typeName.length/3); i<typeName.length; i++){
        module.add(new Module(i,x+2*(moduleWidth+marginLeft),y+marginTop, cp5));
      }
      this.buttonSize =50;
      
      this.buttonOn= new Button("On",x+onOffMargin,y,buttonSize,buttonSize, filterOn ); //if filter is already on, turn off
      this.buttonOff= new Button("Off",x+onOffMargin+buttonSize,y,buttonSize,buttonSize, filterOn ^ 1);

     int numPercSwitch = 0;
      if(numOrPerc)
        numPercSwitch = 1;
        
      this.buttonNum= new Button("#",x+2*onOffMargin,y,buttonSize,buttonSize, numPercSwitch);
      this.buttonPerc= new Button("%",x+2*onOffMargin+buttonSize,y,buttonSize,buttonSize, numPercSwitch ^ 1);
   }
   
   void drawFilter(){
      textFilter();
      textAlign(LEFT, TOP);
      textFont(font24,24);
      
      buttonOn.draw();
      buttonOff.draw();
      
       buttonNum.draw();
      buttonPerc.draw();
      
      if (filterOn==1){
        filterOn();
      }
      

  }
  
    
  void filterOn(){
    textAlign(LEFT,TOP);
    for(Module mod: module){
        mod.drawModule();
      }
      
     
  }
  


  void setMax(){
    
    for (Module mod: module){
      mod.setSliderMax();
    }
  }
  

  void textFilter(){
    textAlign(LEFT, TOP);
    fill(0);
    textFont(font36,36);
    text("Filter", x, y);
  }
  
  void mousePressed(){

    if(buttonOn.contains(mouseX, mouseY) && filterOn==0){
      filterOn=1;
      buttonOn.setActive(1);
      buttonOff.setActive(0);
    }
    else if(buttonOff.contains(mouseX, mouseY) && filterOn==1){
      filterOn=0;
      
      buttonOn.setActive(0);
      buttonOff.setActive(1);
      
      filterOn(); //redraws to not include slider 
    }
    
    if(buttonNum.contains(mouseX, mouseY) && numOrPerc==false){
  
      numOrPerc=true;
      overlay.fillLists();
      setMax();
      resetModule();
      buttonNum.setActive(1);
      buttonPerc.setActive(0);
      
      
      
      draw.draw();
    }
    else if(buttonPerc.contains(mouseX, mouseY) && numOrPerc){

      numOrPerc=false;
      overlay.fillLists();
      setMax();
      resetModule();
      buttonNum.setActive(0);
      buttonPerc.setActive(1);
      
      draw.draw();
    }
    
    if(filterOn==1){
      for(Module mod: module){
        mod.squareContains();
       // mod.sliderContains();
      }
      
      
    }
  }
  
  void resetModule(){
    for(Module mod: module){
      mod.resetSquare();
    }
  }

  
  private class Module{
    
    int y;
    int x;
    int dataType;
    int visible;
    float textWidth;
 
    int rectSize = 30;
    Rect square;
    Rectangle textBound;
    
    private Slider slider;
    
    private color myColor;
   // Rect square;
    //Rect text;
    ControlP5 cp5;
    
    
    public Module(int dataType, int x, int y, ControlP5 cp5){
      
        this.cp5 = cp5;
        int iy =y;
        if((dataType&1)==1){ // if odd y+height, if even if I is even, y
          iy += moduleTop + rectSize;
        }
        
        
        this.textWidth = textWidth(typeName[dataType]);
        this.myColor = typeColor[dataType];
        this.y = iy;
        this.x = x;
        this.dataType = dataType;
        visible = 1;
        
         // add a horizontal sliders, the value of this slider will be linked
        // to variable 'sliderValue' 
        slider = cp5.addSlider(""+dataType);
        slider.hide()
           .setWidth(200)
           .setHeight(20)
           .setDecimalPrecision(1)
           .setId(dataType)
           .setPosition( (int)(this.x+2*rectSize), this.y+rectSize )
           .setTriggerEvent(Slider.RELEASE) ;
            
            
           setSliderMax();
          
           
        
        
         //--- Mini Box's Rectangle---
      square = new Rect(this.x,this.y, rectSize, rectSize);
      textBound = new Rectangle(this.x+2*rectSize, this.y, rectSize, (int)textWidth);
      
      //slider = new Slider((int)(this.x+textWidth+rectSize), this.y+rectSize, 200, 0, 100, myColor);
      
    }
    
    void setFiltering(boolean tf){
      //filtering = tf;
    }
        
    void drawModule(){
      if(filterOn==1){
        noStroke();
        fill(myColor);
        textFont(font24, 24);
        text(typeName[dataType], x+2*rectSize, y);
        
        
        
        //-- draw square --
        if (visible==0){
          fill(background);
          strokeWeight(2);
          stroke(myColor);
          cp5.getController(""+dataType).hide();
        }
        else{
          cp5.getController(""+dataType).show();
        }
      
        square.draw();
      }
      else{
        cp5.getController(""+dataType).hide();
      }
    }
    
    void setSliderMax(){
      float max =overlay.getFilterMax()[dataType];
      slider.setRange(0f,max).setValue(max);
    }
    
    void squareContains(){
      if(filterOn==1 && square.contains(mouseX,mouseY)){
        visible ^= 1;
        overlay.setFilterToggle(dataType,visible);
        //--User has selected a filter-- 
        draw.filterChange();
      }
    }
    
    void resetSquare(){
      visible = 1;
        overlay.setFilterToggle(dataType,visible);
        //--User has selected a filter-- 
        draw.filterChange();
    }
    

   
  }//end Module
  
}//end Filter
import java.awt.Polygon; 

public class Map{
  
 
  
  private ArrayList<State> stateList = new ArrayList<State>(50);
  // not exactly x and y
  
  XML xml;
  
  public Map(){ 
    
    xml = loadXML("statesCoord.xml");
    JSONArray stateData = loadJSONArray("map.json");
    
    XML[] state = xml.getChildren("state");
    
    int relX = 1550;
    int relY = 900;
    int scaleX = 12;
    int scaleY = -15;
    
    //make Hawaii
    makeState(state, stateData, 0, 2260, 750, 13, -13);
    
    //make Alaska
     makeState(state, stateData, 1, 700, 850, 4, -6);
    
    for(int i=2; i<state.length; i++){ //draw Hawaii and Alaska separately
      makeState(state, stateData, i, relX, relY, scaleX, scaleY);
    }

     
    for (State st: stateList){
      st.draw();
    }  
  }
  
  public void makeState(XML[] state, JSONArray stateData, int i, int relX, int relY, int scaleX, int scaleY){
      
      XML[] point = state[i].getChildren("point");
      int pointCount = point.length;
      
      int centerX = relX+int(scaleX* state[i].getFloat("lng"));
      int centerY = relY+int(scaleY* state[i].getFloat("lat"));
      
      int[] x = new int[pointCount];
      int[] y = new int[pointCount];
      for(int j=0; j<pointCount; j++){
        x[j]= relX+int(scaleX* point[j].getFloat("lng"));
        y[j]= relY+int(scaleY* point[j].getFloat("lat"));
        
      }
      Poly shape = new Poly(x,y,pointCount);
      
      JSONObject jsonState = stateData.getJSONObject(i);
     
      int alone = jsonState.getInt("alone");
      int carpool = jsonState.getInt("carpool");
      int publicTrans = jsonState.getInt("public");
      int walk = jsonState.getInt("walk");
      int other = jsonState.getInt("other");
      int home = jsonState.getInt("home");
      
      String name = jsonState.getString("name");
      int workers = alone+carpool+publicTrans+walk+other+home;
      float travel = 0.0;
      
       State aState = new State(name, state[i].getString("abb"), 
          shape, centerX, centerY, workers, alone, carpool, publicTrans, walk, other, home, travel);
      
      stateList.add(aState);
  }
  
  public void brush(State state){
    for (State aState: stateList){
      aState.setBrushing(false);
    }
    int index = stateList.indexOf(state);
    if (index!=-1){
      State myState = stateList.get(index);
      myState.setBrushing(true);

    }
  }
  
  // --- What Parameter is being looked at ----
  public void setView(){
  }
  
  public void reset(){
    for(State st: stateList){
      st.setHighlight(false);
    }
  }
  
  public void mouseMoved(){
    reset();
    for(State st: stateList){
      if (st.contains(mouseX, mouseY)){
        break;
      }
    }
    drawMap();
  }
  
  public void mousePressed(){
    for(State st: stateList){
      if (st.highlight){
        draw.setWindowState(st);
        //return st;
      }
    }
   // return null;
  }
  
   public void drawMap(){
   /* fill(background);
    noStroke();
    rect(0,0, mapWidth, 600);*/
    State selected = null;
    
    for (State st: stateList){
      State oneState = st.draw();
      if (oneState!=null){
        selected = oneState;
      }
    }
   /* if (selected!=null){
      selected.dataBox();
    }*/
    
  }
  
  
  public ArrayList<State> getStateList(){
    return stateList;
  }
}
import java.util.*;

public class Overlay{
  
  Map map;
  float filterMax[];
  float filterValue[];
  int filterToggle[];
  
  //--These are shallow arraylist copies of StateList, in
  // various orders
  ArrayList<ArrayList<State>> arrayList;
  
  //top 3
  ArrayList<ArrayList<State>> stateData;
  
  
  CircleData[] circleData;
  
  int topNo =3;
 
  public Overlay(Map map){
    
    this.map = map;
    filterMax = new float[6];
    filterValue = new float[6];
    filterToggle = new int[6];
    arrayList = new ArrayList<ArrayList<State>>(6);
    
    circleData = new CircleData[6];
    stateData = new ArrayList<ArrayList<State>>(6);
    
    fillLists();
    /*
    
    //-- future update: try passing functions.
    */
  }
  
   //-- Gets called also when percentage turns to numbers and vice versa
  void fillLists(){

    for(int i=0; i<filterMax.length; i++){
      stateData.add(new ArrayList<State>(3));
      
      //int dataType = i+1; //data array in stateData starts with num workers
      arrayList.add(new ArrayList<State>(map.getStateList()));
   
      Collections.sort(arrayList.get(i), new StateComparator( numOrPerc ,i));
      float max = arrayList.get(i).get(0).getStateData().getDataArray()[i];
      filterMax[i] = max;
      setMax(i, max, true);
      
      filterValue[i]=filterMax[i];
      filterToggle[i]=1;

    }
    
    makeCircles();
    
  }
  
  float[] getFilterMax(){
    return filterMax;
  }  
  
  void setMax(int dataType, float max){
    setMax(dataType, max, false);
    makeCircles();
  }
  
    void setMax(int dataType, float max, boolean firstTime){
    filterValue[dataType]=max;
    
    //change what gets displayed
    int top = topInRange(dataType);
    topState(dataType, top);

  }
  
  void topState(int dataType, int start){
    ArrayList<State> topData = new ArrayList<State>(topNo);
     
    //if(start != -1){ //if there's something in this range
      for(int i =0; i< topNo; i++){
        
        if(start+i < arrayList.get(dataType).size() && start+i >= 0){
          topData.add(arrayList.get(dataType).get(start+i));
        }
      }   
      stateData.set(dataType,topData);
      
      //if it doesn't exist, stateData will have an arraylist of nulls.
  }
  
  int topInRange(int dataType){
    for (int i =0; i<arrayList.get(dataType).size();i++){
      if(arrayList.get(dataType).get(i).getStateData().getDataArray()[dataType] <= filterValue[dataType]){ //data array in stateData starts with num workers
        return i;
      }
    }
    return -1;
  }
  
  void setFilterToggle(int dataType, int visible){
    filterToggle[dataType]=visible;
    
  }
  
  void makeCircles(){
     int j =0;
     //ArrayList<CircleData> circles = new ArrayList<CircleData>(topNo);
     
     PriorityQueue<CircleData> pqCircle = new PriorityQueue<CircleData>();
     for(int i=0; i< stateData.size(); i++){
       for(State st: stateData.get(i)){
             if (st!=null){
                color col = typeColor[i];
                
                int multiplier1 = 0;
                int multiplier2 =0;
                  
                if(numOrPerc){
                   multiplier1 = 75;
                   multiplier2 =30;
                }
                else{
                   multiplier1 = 50;
                   multiplier2 =20;
                }
                float dataValue = (float)(st.getStateData().getDataArray()[i]);
                
                int diameter = j *10 + (int) (multiplier1*(dataValue/filterMax[i])) +(int)(multiplier2*dataValue/filterMax[0]);
                
           
                pqCircle.add(new CircleData(st, diameter, i, (int)dataValue, col));
                j++;
             }
       }
       j=0;
     }
     
     circleData = pqCircle.toArray(new CircleData[6*topNo]);
     
     //circleData.set(dataType, circles);
   
      
    
    }
  
  String overlay="";
  
  void drawOverlay(){
     for (int i=0; i< circleData.length; i++){
       if(circleData[i]!=null && filterToggle[circleData[i].getDataType()]==1){
         circleData[i].draw();
       }
     }
     draw.overlayText(overlay);
    }//end draw Overlay
    


   void mousePressed(){
        //check from lowest diameter to highest
        boolean pass = true;
       for(int i = circleData.length-1; i>=0; i--){
         if(circleData[i]!=null && circleData[i].contains() && filterToggle[circleData[i].getDataType()]==1){
              draw.setWindowState(circleData[i].getState());
              //mouseMoved();
              pass = false;
              break;         
         }
      }
      
      if(pass)
        reset();
   }
   
  
   void setOverlayState(State state, int dataType){
     if(filterToggle[dataType]==1){
       for(int i = circleData.length-1; i>=0; i--){
             if(circleData[i].getState()==state && circleData[i].getDataType()==dataType){
                  circleData[i].setBrushing(true);
                  break;         
             }
       }
     }
   }
   
   //--this is if I'm outside my overlay mousemove check
  void reset(){
    overlay="";
    for(int i = circleData.length-1; i>=0; i--){
         if(circleData[i]!=null){
             circleData[i].setBrushing(false); //reset every time
       }
    }
  }
  
  
  
  void mouseMoved(){
        //check from lowest diameter to highest
      // mousePressed();
       reset();
       draw.pieReset();
     
       for(int i = circleData.length-1; i>=0; i--){
         if( circleData[i]!=null && circleData[i].contains() && filterToggle[circleData[i].getDataType()]==1){
              overlay=typeName[circleData[i].getDataType()]+" : "+circleData[i].getValue();
               circleData[i].setBrushing(true);
              draw.windowCheck(circleData[i].getState(), circleData[i].getDataType());
              break;    
         }          
      }
   }

}//end class


//import java.lang.Math;

public class PieChart{
    

    ArrayList<Arc> arcs = new ArrayList<Arc>(7);
    // data[0] is total, data[1] is alone, etc.
    float xD;
    float yD;
    State state;
    float[] data;
    int display;
    
    public PieChart(int x, int y, int w, int h){
      this.state = state;
      xD = (float)x;
      yD = (float)y;
      
    }
    
    public void setState(State state){
      
      if(state!=null && !state.equals(this.state)){
        arcs = new ArrayList<Arc>(6);

        this.state = state;
        data = state.getStateData().getPercArray();
        
        float angleSum = 0;
        //for(int i = data.length-1; i>0; i--){
        for(int i=0; i<data.length; i++){
          float rad = data[i]/100 * 2*PI;
          
          Arc arc = new Arc(i, xD, yD, 300.0f, 300.0f, angleSum, angleSum+rad, PIE);

          arcs.add(arc);
          angleSum+=rad;
          
        }
      }
    }
    
    int oldDisplay = -1;
    String overlay ="";
    
    void drawPie(){
      ellipseMode(CORNER);
        for (int i=0; i<arcs.size();i++){
          arcs.get(i).draw(); 
        }
        
        
        if(display!=-1 ){
          int type = 1;
          if(numOrPerc){
            type = state.getWorkers();
          }
      
          if(oldDisplay!=display)
            overlay =typeName[display]+" : "+ (int)(Math.ceil((double)type*data[display]/100));
          draw.overlayText(overlay);
          oldDisplay = display;
        }

      ellipseMode(CENTER);
    }
    
    public void mouseMoved(){
    display = -1;
     pieReset();
      for(int i=0; i<arcs.size(); i++){
        if(arcs.get(i).contains()){
          arcs.get(i).setHighlight(true);
          display = i;
          //--Set Overlay to Brush--
          draw.setOverlayState(state, i);
          break;
        }
      }
      draw.draw();
    }
    
    //When brushed in the other view    
    void pieHighlight(int dataType){
      pieReset();
      for(Arc arc: arcs){
        if(arc.dataType==dataType){
          arc.setHighlight(true);
          break;
        }
      }
    }
    
    void pieReset(){
      display = -1;
      for(Arc arc: arcs){
        arc.setHighlight(false);
      }  
     draw.overlayText(null);
    }
    
    
    private class Arc{
  
        int dataType;
        float x;
        float y;
        float widthPie;
        float heightPie;
        float start;
        float stop;
        int fill;
        boolean highlight;
        color col;
        
       
        public Arc(int dataType, float x, float y, float widthPie, float heightPie, float start , float stop , int fill){
       
          this.widthPie = widthPie;
          this.heightPie = heightPie;
          
          this.dataType = dataType;
          this.x = x;
          this.y = y;
          this.col = typeColor[dataType];
          
          this.start = start;
          this.stop = stop;
          this.fill = fill;
          this.highlight = false;

        }
        
         void draw() {
          if(highlight){
            fill(col,50);
            stroke(col);
            strokeWeight(3);
          }
          else{
            fill(col);
            noStroke();
          }
          arc(this.x, this.y, widthPie, heightPie, start, stop, fill);
        }
        
        void setHighlight(boolean tf){
          highlight = tf;
        }
        
         
        
      boolean contains(){
         double angle = getAngle();
          
          if (angle>=start && angle<=stop){
            return true;
          }
          return false;
       }
      
      
       /* Fetches angle relative to screen centre point
       * where 3 O'Clock is 0 and 12 O'Clock is 270 degrees
       * From StackOverflow
       * @param screenPoint
       * @return angle in degress from 0-360.
       */
       
      public double getAngle(){
        
        
          double dx = mouseX - (this.x+widthPie/2);
          // Minus to correct for coord re-mapping
          double dy = (double)-1*(mouseY - (this.y+heightPie/2));
      
          double inRads = Math.atan2(dy,dx);
      
          // We need to map to coord system when 0 degree is at 3 O'clock, 270 at 12 O'clock
          if (inRads < 0)
              inRads = Math.abs(inRads);
          else
              inRads = 2*Math.PI - inRads;
      
          return inRads;
      }
            
    
       
    }//end arc
  }//end pie


/*
 The class inherit all the fields, constructors and functions 
 of the java.awt.Polygon class, including contains(), xpoint,ypoint,npoint
 http://wiki.processing.org/w/Using_AWT's_Polygon_class
*/
 
public class Poly extends java.awt.Polygon {
  public Poly(int[] x,int[] y, int n) {
    //call the java.awt.Polygon constructor
    super(x, y, n);
  }
 
  void draw() {
    beginShape();
    for (int i = 0; i < npoints; i++) {
      vertex(xpoints[i], ypoints[i]);
    }
    endShape(CLOSE);
  }
}


public class Rect extends java.awt.Rectangle {
  
  int w;
  int h;
  int active;
  String text;
  
  public Rect(int x,int y, int w, int h) {
    //call the java.awt.Polygon constructor
    super(x, y, w,h);

    this.w = w;
    this.h = h;
    
  }
 
  void draw() {

    rect(x,y,w,h);
    
  }

  
}

public class Button extends java.awt.Rectangle {
  
  int w;
  int h;
  int active;
  String text;
  
  public Button(String text, int x,int y, int w, int h, int active) {
    //call the java.awt.Polygon constructor
    super(x, y, w,h);
    this.text = text;
    this.w = w;
    this.h = h;
    this.active = active;
    
  }
 
  void draw() {
    
    stroke(0);
    if(active==1){
      fill(0);
      strokeWeight(2);
    }
    else{
      fill(66); 
      noStroke();
      //strokeWeight(1);   
    }
    rect(x,y,w,h);
    
    noStroke();
    if (active==1){
      fill(100);
      
    }
    else{
      fill(44);
    }  
    textAlign(CENTER,CENTER);
    textFont(font24,24);
    text(text,x+w/2,y+h/2);
    
  }
    
  void setActive(int active){
    this.active = active;
  }
  
}
import java.awt.Polygon; 

public class State{
  private String name;
  private Poly polygon;
  
  private boolean highlight;
  
  // --- If it's being accessed in another window
  private boolean brushing;
  private color stateColor;
  
  private StateData data;
  private int centerX;
  private int centerY;
  private String abb;
  
  public  color highlightColor= color(34,203,100);
  public  color brushingColor= color(0,10,100);
  
  public color gray;

  
  public State(String name, String abb, Poly polygon, int centerX, int centerY, int workers, int alone, int carpooled, int publicTrans, int walked, int other, int home, float travelTime){
    this.name = name;
    this.polygon = polygon;
    
    gray = color(random(75)+25);
    this.abb = abb;
    
    this.centerX = centerX;
    this.centerY = centerY;

    data = new StateData(name, workers, alone, carpooled, publicTrans, walked, other, home, travelTime);
    
    highlight = false;
    brushing = false;
    stateColor = createColor();
  }
  
  public String getName(){
    return name;
  }
  
  public color createColor(){
   // this.stateColor = workers%1000000;
   //int[] saturation = {65, 12, 
    return color(random(100), random(80)+20, random(10)+90); //random(10)+90
  }
  
  public void setHighlight(boolean tf){
    highlight = tf;
  }
  
  public void setBrushing(boolean tf){
    brushing = tf;
  }
  
  public boolean contains(int mx, int my){
    if (filterOn==0 && polygon.contains(mx,my)){
      highlight = true;
    }
    return highlight;
  }
  
  public State draw(){
    State ret = null;
    if(filterOn==1){
      fill(gray);
      noStroke();
      polygon.draw();
    }
    else{
      if (brushing){
        fill(brushingColor);
        strokeWeight(3);
        stroke(stateColor); //work on this
      }
      else if (highlight){
        fill(stateColor);
        strokeWeight(4);
        stroke(color(10,10,100)); //work on this
        ret = this;
      }
      else{
        fill(stateColor);
        noStroke();
      }
      
    }
    
    polygon.draw();
      drawName();
      

    return ret;
  }
  
  public void drawName(){
     //-- Draw Names of State
    textFont(font14, 14);
    textAlign(CENTER,CENTER);
    fill(0);
    text(abb, centerX, centerY);
  }
  
  public void dataBox(){
    //data.drawBox(mouseX,mouseY);
    data.drawBox(centerX,centerY);
  } 
  
  public StateData getStateData(){
    return data;
  }
  
  public int getCenterX(){
     return centerX;
  }
  
  public int getCenterY(){
     return centerY;
  }
  
  public int getWorkers(){
     return data.getWorkers();
  }
}

public class StateComparator implements Comparator<State> {
    boolean numOrPerc;
    int dataType;
    public StateComparator(boolean numOrPerc, int dataType){
        this.numOrPerc= numOrPerc;
        this.dataType= dataType;
        

    }
    
    @Override
    public int compare(State state1, State state2) {  //number or percentage
        int answer = 0;
        float[] data1 = (state1.getStateData().getDataArray());
        float[] data2 = (state2.getStateData().getDataArray());
        
        

       // if(this.numOrPerc){
          answer = (int)(data2[dataType]-data1[dataType]);
       /*}
        else{
          int worker1 = state.1.getWorkers();
          int worker2 = state.2.getWorkers();
          answer = data2[dataType]/worker1 - data1[dataType]/worker2;
        }*/
       return answer;
    }
}



public class StateData{
  // --- Called during app to populate all states. ----
  
  private float travelTime;
  private float[] dataArray;
  private float[] percArray;
  
  private int workers;
  
  public StateData(String name, int workers, int alone, 
                    int carpooled, int publicTrans, int walked, int other, int home, float travelTime){               
    float workDivide = (float)workers;
    percArray = new float[6];
    
    float[] anArray = {alone, carpooled, publicTrans, walked, other, home};
    
    for(int i=0; i<anArray.length; i++){
      percArray[i] = (100*(anArray[i]/workDivide));
    }
    
    dataArray = anArray;
    
    this.travelTime = travelTime;
    this.workers = workers;
  }
  
  public float[] getDataArray(){
    if(numOrPerc)
      return dataArray;
    else
      return percArray;
  }
  
  public float[] getPercArray(){
      return percArray;
  }
  
  public int getWorkers(){
    return workers;
  }
  
  // --- Draw Hover Box ----
  public void drawBox(int mx, int my){
    fill(2,2,2,60);
    noStroke();
    rect(mx,my, 20, 20);
  }
  
}

public class StateWindow{
  
  //make bar graph for now.
  


  private int x;
  private int y;
  private int width;
  private int height;
  private State state;
  private PieChart pie;
  int pieSize ;
  int pieY;
  int pieX;
  
  private StateWindow(int x, int y){
    this.x = x;
    this.y = y;
    width = 300;
    height = 500;
    defaultText();
    pieSize = 300;
    pieX=x+10;
    pieY = y+100;
    pie = new PieChart(pieX, pieY, pieSize, pieSize);
  }
  
  public void defaultText(){
    textFont(font14,14);
    String s = "Click on a state to see more detail.";
    fill(22);
    text(s, x, y, x+this.width, y+this.height);  // Text wraps within text box
  }
  
  public void mouseMoved(){
    if(draw.within(pieX,pieY,pieX+pieSize,pieY+pieSize)){
      rect(pieX,pieY,pieSize,pieSize);
      pie.mouseMoved();
      draw.brushMap(state);
   }
   else{
      pieReset();
   }
  }
  
  public void setState(State state){
    if (!state.equals(this.state)){
      this.state = state;
      pie.setState(state);
      draw.draw();
    }
  }
  
  public void writeName(){
    fill(0);
    textFont(font36, 36);
    textAlign(CENTER);
    text(state.getName(), x+this.width/2, y+60);
  }
  
  public void drawWindow(){
    if (state!=null){
      writeName();
      pie.drawPie();
      //draw bargraph
    }
    else{
      defaultText();
    }
  }

 public void windowCheck(State myState, int dataType){
   if(state!=null && state.equals(myState)){
     pie.pieHighlight(dataType);
   }
 }
 
 public void pieReset(){
   pie.pieReset();
 }
 

}//end class




