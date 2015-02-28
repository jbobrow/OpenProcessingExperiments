
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*; 

Physics physics;
Body body, body2;
int teller=0;
int numLinks = 10;
float timer=0;
PFont fontA;
ArrayList bodies= new ArrayList();
TreeMap wordCounter;
BufferedReader reader;

void setup() {
  size(800,600,P2D);
  smooth(); 
  frameRate(100);
  fontA = loadFont("ArialNarrow-48.vlw");
  textAlign(CENTER);
  textFont(fontA, 12);
  physics = new Physics(this, width, height);
  physics.setDensity(1.0); 
  physics.setCustomRenderingMethod(this, "myDraw"); 
  physics.setFriction(0.9); 
  physics.setRestitution(0.9);
  wordCounter = new TreeMap();
  try {
    reader = createReader("words004.txt");
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
  physics.setDensity(1.0);
}

void draw() {
  for (int t=0;t<10;t++) {
    timer+=1.0;
    background(255);
    String word;
    try {
      if((word = reader.readLine()) != null) {
        if (word.equals("the")) {
        } 
        else if (word.equals("and")) {
        } 
        else {
          if (wordCounter.containsKey(word)) {
            float tF=(float)(Float)wordCounter.get(word);
            float tFnew=sqrt(3.14*tF*tF+1000)/3.14;
            wordCounter.put(word,tFnew);
          } 
          else {
            wordCounter.put(word, sqrt(1000.0f)/3.14);
            float x0 = 400+random(-100,100);
            float y0 = 150+random(-100,100);
            Body randomBod = physics.createCircle(x0, y0, sqrt(2000.0f)/3.14);
            Vec2 vel = new Vec2(random(-30.0f,30.0f),random(-30.0f,30.0f));
            randomBod.setLinearVelocity(vel);
            randomBod.setUserData(word);
            bodies.add(randomBod);
          }
        }
      }
      physics.setDensity(1.0);
    } 
    catch (Exception e) {
      e.printStackTrace();
    }

    if(wordCounter!=null) {
      if (timer%10==0) {
        System.out.println(timer+" : "+wordCounter.size()+" : "+frameRate);
        Object[] tO=wordCounter.keySet().toArray();
        for (int i=0; i<tO.length; i++) {
          String tS=(String)tO[i];
          float tF=(float)(Float)wordCounter.get(tS);
          if (tF>0.1f) {
            wordCounter.put(tS,(float)(Float)wordCounter.get(tS)-0.1f);
          } 
          else {
            wordCounter.put(tS,0.0f);
          }
        }
        for (int i=0;i<bodies.size();i++) {
          Body tB = (Body)bodies.get(i);
          String tS = (String)tB.getUserData();
          float tF= (float)(Float)wordCounter.get(tS);
          CircleShape tC = (CircleShape)tB.getShapeList();
          float tR=0.0f;
          if (tC!=null) tR=(tC).getRadius();
          if (tF>=2) {
            if (tC!=null) tB.destroyShape(tC);
            CircleDef tCNew = new CircleDef();
            tCNew.radius=tF/5.0f;
            tB.createShape(tCNew);
          } 
          else {
            if (tC!=null) tB.destroyShape(tC);
            wordCounter.remove(tS);
            bodies.remove(tB);

          }
        }
      }
    }
  }
}

void myDraw(World w) {
  for (Body body = physics.getWorld().getBodyList(); body != null; body = body.getNext()) { 
    org.jbox2d.collision.Shape shape; 
    for (shape = body.getShapeList(); shape != null; shape = shape.getNext()) { 
      if (shape.getType() == ShapeType.CIRCLE_SHAPE) {
        fill(200); 
        noStroke();
        circleDraw(body, shape);
      } 
    }  
  } 
}

void initScene() {
  physics = new Physics(this, width, height);
  physics.setDensity(1.0); 
  physics.setCustomRenderingMethod(this, "myDraw"); 
  physics.setFriction(0.9); 
  physics.setRestitution(0.9);
}

void circleDraw(Body body, org.jbox2d.collision.Shape shape) { 
  CircleShape circle = (CircleShape) shape; 
  Vec2 center = circle.getLocalPosition(); 
  Vec2 wpoint = physics.worldToScreen(body.getWorldPoint(center)); 
  float radius = physics.worldToScreen(circle.getRadius()); 
  String tS = (String)body.getUserData();
  int tC1 = 100;
  int tC2 = 100;
  int tC3 = 100;
  try {
    tC1 = Character.getNumericValue(tS.charAt(0))*5;
    tC2 = Character.getNumericValue(tS.charAt(1))*5;
    tC3 = Character.getNumericValue(tS.charAt(2))*5;
  } 
  catch (Exception e) {
  }
  fill(tC3,tC2,tC1,50); 
  ellipse(wpoint.x,wpoint.y,radius*2,radius*2); 
  fill(0); 
  if (radius>15.0f) {
    textFont(fontA, radius/1.5f);
    text(""+(String)body.getUserData(),wpoint.x,wpoint.y);
  }
}

