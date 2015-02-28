
import muehlseife.evolutions.*;
import toxi.geom.*;

//Declare the model with the object class you want to evaluate (in thie case toxi.geom.Polygon2D)
EAModel<Polygon2D> model;
int generation = 0;
//count of generations
int genCount = 150;

void setup() {
  size(800, 600, JAVA2D);
  smooth();
  		
  registerMouseEvent(this);
  setupModel();
}
	
void setupModel() {
  //EAModel<Type>(referenced object, count of generations);
  //referenced object = the object, where the function 'evolutionsEvent(EAEvent event)' can be found (in this case: PApplet.this)
  model = new EAModel<Polygon2D>(this, 200);
  generation = model.next();
}

void draw() {
  background(255);
  
  float step = 620f / (float)genCount;
  
  
  //create the next generation. The function gives back the count of generations so far
  if (generation < genCount)
    generation = model.next();
  
  Polygon2D best = null;

  if (generation < genCount) {
    if (model.best() != null)
      best = model.best();
  } else {
    Variant<Polygon2D> disp = model.generation.get(0);
    float xx = 620f - 50f;
    
    boolean first = true;
    while (disp.hasParents() && xx + 75 > mouseX) {
      xx -= step;
      disp = disp.getParents().iterator().next();
    }
    best = disp.get();
  }
    //draw the polygon
    beginShape();
    fill(200);
    for (Vec2D vec :best.vertices)
      vertex(vec.x + width/2, vec.y + height/2 - 50);
    vertex(best.vertices.get(0).x + width/2, best.vertices.get(0).y + height/2 - 50);
    endShape();
    
    //draw the points
    pushStyle(); strokeWeight(8);
    for (Vec2D vec : best.vertices)
      point(vec.x + width/2, vec.y + height/2 - 50);
    popStyle();
    
    //draw some text
    if (model.result != null) {
      pushStyle(); fill(0);
      text("click mouse to restart", 10, 14);
      text("generation " + generation + ": " + model.result.value, 10, 30);
      popStyle();
    }
  
  //draw the graph on the bottom of the screen
  strokeWeight(1); stroke(0);
  line(25, 575, 25 + 750, 575);
  line(25 + model.chart.size() * step, 450, 25 + model.chart.size() * step, 600);
  strokeWeight(2);
  
  if (generation >= genCount) {
    line(constrain(mouseX, 25, 25 + model.chart.size() * step), 450, constrain(mouseX, 25, 25 + model.chart.size() * step), 600);
  }
  //In model.chart you can find information for every past generation:
  //getV(int i) get the value of the best Variant in the Generation
  //getM(int i) get the slope of the value graph at the position i (index of generation);
  fill(0);
  text("value: " + model.chart.getV(model.chart.size() - 1), 25 + model.chart.size() * step + 5, 575 - model.chart.getV(model.chart.size() - 1) * 1000f);
  text("generation: " + model.chart.size(), 25 + model.chart.size() * step + 5, 590);
  		
  fill(255, 0, 0); text("m: " + model.chart.getM(model.chart.size() - 1), 25 + model.chart.size() * step + 5, 575 - model.chart.getM(model.chart.size() - 1) * 1000f);
  noFill();
  
   //draw my path;
  float startX = 25 + (model.chart.size()) * step + step;
  Variant<Polygon2D> var = model.generation.get(0);
  strokeWeight(2); stroke(120);
  float lastResult = 0;
  
  boolean first = true;
  while (var.hasParents()) {
    var = var.getParents().iterator().next();
    float y2 = 0;
    if (var.hasResult()) y2 = var.getResult().value;

    if (!first) line(startX, 575 - lastResult * 1000f, startX-step, 575 - y2 * 1000f);
    first = false;
    startX -= step;
    
    lastResult = y2;
  }
  
  float lastV = 0, lastM = 0;
  for (int i = 0; i < model.chart.size(); i++) {
    float v = model.chart.getV(i);
    float m = model.chart.getM(i);
    stroke(0); line(25 + i * step + step, 575 - v * 1000f, 25 + (i - 1) * step + step, 575 - lastV * 1000f);//point(25 + i, 575 - v * 1000f);
    stroke(255, 0, 0); line(25 + i * step + step, 575 - m * 1000, 25 + (i - 1) * step + step, 575 - lastM * 1000); //point(25 + i, 575 - m * 1000);
    lastM = m; lastV = v;
  }
  stroke(0); strokeWeight(2);
}

//mouse events: mouse released = new setup;
void mouseEvent(MouseEvent event) {
  if (event.getID() == MouseEvent.MOUSE_RELEASED) setupModel();
}

//this is the most important function. the library will give you events.
//the three basic types of events are:
//--------------------------------------------------------------
//FIRST: how should the first polygons be created??
//You must return the new object by calling
//.setResult(Polygon2D)
//--------------------------------------------------------------
//CREATE: how should new polygons be created??
//the event will give you the following information for creating new polygons:
//.getVariant(index i): Get a variant (Variant<Polygon2D>) from the last generation (index 0 = the best, index 1 = the second best, ...)
//.getVariant(): Get the best variant from the last generation;
//.getObject(index i): Get a object (Polygon2D) from the last generation
//.getObject(): get the best object from the last generation;
//.getIndex(): the index of the Variant created right now (so you could say create 50% of the Polygons by method 1 and 50% by method 2)
//You must return the new object by calling
//.setResult(Polygon2D)
//--------------------------------------------------------------
//EVALUATE: how to calculate the value for each polygon (in this case: (area of the polygon) / (cirumference)²
//You must set the value by calling
//.setValue(float v);
//

void evolutionsEvent(EAEvent<Polygon2D> event) {
  switch (event.getID()) {
    case EAEvent.FIRST:
      //create the first polygon with random points
      Polygon2D start = new Polygon2D();
      for (int i = 0; i < 10; i++) start.add(new Vec2D(random(-160, 160), random(-160, 160)));
      event.setResult(start);
    break;
    
    case EAEvent.CREATE:
      Polygon2D oo = event.getObject((int)random(4)); //lets give the best 4 of the last generation a chance to improve!
      float variance = (float)event.getIndex() / 4;
      Polygon2D nn = new Polygon2D();
      
      for (Vec2D vec : model.best().vertices)
      nn.add(vec.copy().addSelf(new Vec2D(random(-variance, variance), random(-variance, variance))));
      event.setResult(nn);
    break;
    
    case EAEvent.EVALUATE:
      Polygon2D res = event.getObject();
      float p = res.getCircumference();
      event.setValue(res.getArea() / (p * p));
    			  
    break;
  }
}


