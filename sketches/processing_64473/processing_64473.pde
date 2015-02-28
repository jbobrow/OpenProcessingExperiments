
import muehlseife.menue.*;

ArrayList<Smiley> theSmileys;
ObjectMenue menue;

PFont font;

public void setup(){
  registerMouseEvent(this);
  size(500,500,JAVA2D);
  smooth();
  
  font = createFont("SansSerif",10);
  
  theSmileys = new ArrayList<Smiley>();
  theSmileys.add(new Smiley(90, 90, 70, "Smiley1"));
  theSmileys.add(new Smiley(300, 200, 50, "Smiley2"));
  theSmileys.add(new Smiley(100, 300, 60, "Smiley3"));

}

public void draw(){ 
  background(255);
  for(Smiley theSmiley : theSmileys)
    theSmiley.display();
}


public void mouseEvent(MouseEvent event) {  	
  switch (event.getID()) {
    case MouseEvent.MOUSE_RELEASED:
      switch (event.getButton()) {
        case MouseEvent.BUTTON3:
        println("openMenue");
          if(menue != null) menue.delete();
          for(Smiley theSmiley : theSmileys){
            if(dist(mouseX,mouseY,theSmiley.posX,theSmiley.posY)<theSmiley.radius){
              menue = new ObjectMenue(this, theSmiley, mouseX, mouseY);
              break;
            }
          }
          break;
          
        case MouseEvent.BUTTON1:
          if(menue != null)
           if(!menue.overMenue(mouseX,mouseY)) menue.delete();
          break;
        }
      break;
    }
  }
  

public class Smiley implements ObjectMenueInterface{
  
  public String name;
  
  public float posX;
  public float posY;
  
  public int radius;
  public Color theColor;
  
  public Eye leftEye;
  public Eye rightEye;
  
  public boolean smile;
  
  Smiley(float xx, float yy, int rr, String name_){
    name = name_;
    
    posX = xx;
    posY = yy;
    radius = rr;
    
    theColor = new Color(255,255,0,200);
    
    leftEye = new Eye();
    rightEye = new Eye();
  }
  
  void display(){
    fill(theColor.get());
    stroke(0);
    
    //the body
    ellipse(posX,posY,radius*2,radius*2);
    
    //the name
    fill(0);
    textFont(font);
    textAlign(LEFT,CENTER);
    text(name, posX + radius,posY + radius * 0.5);
    
    //the smile
    noFill();
    beginShape();
    curveVertex(posX - radius/2, posY +radius/2);
    curveVertex(posX - radius/2 + 10, posY +radius/2);
    if(smile)
      curveVertex(posX, posY + radius/1.5);
    else
      curveVertex(posX, posY + radius/3);
    curveVertex(posX + radius/2 - 10, posY +radius/2);
    curveVertex(posX + radius/2, posY +radius/2);
    endShape();
    
    
    //the Eyes
    fill(leftEye.theColor.get());
    ellipse(posX - radius/5,posY - radius/5,leftEye.size,leftEye.size);
    if(leftEye.angry)  line(posX - radius/3, posY - radius/3 - leftEye.size/2, posX - radius/6, posY - radius/4 - leftEye.size/2);
    fill(rightEye.theColor.get());
    ellipse(posX + radius/5,posY - radius/5,rightEye.size,rightEye.size);
    if(rightEye.angry)  line(posX + radius/3, posY - radius/3 - rightEye.size/2, posX + radius/6, posY - radius/4 - rightEye.size/2);
  }
  
  public ArrayList<Entry> getElements() {
    ArrayList<Entry> vvs = new ArrayList<Entry>();
    vvs.add(new Entry("Smiley:"));
    vvs.add(new Editable<String>("name").setEditable());
    vvs.add(new Editable<Float>("posX", 0f, (float)width));
    vvs.add(new Editable<Float>("posY", 0f, (float)height));
    vvs.add(new Editable<Integer>("radius", 50, 100));
    vvs.add(new Editable<Boolean>("smile").setEditable());
    vvs.add(new SubMenue("leftEye"));
    vvs.add(new SubMenue("rightEye"));
    vvs.add(new SubMenue("theColor"));
    return vvs;
  }
}

public class Color implements ObjectMenueInterface{
  public int r, g, b, a;
  public int theColor;
  
  Color(int r, int g, int b, int a){
    
    registerDraw(this);
    
    this.r = r; 
    this.g = g;
    this.b = b;
    this.a = a;
 
    theColor = color(r,g,b,a);
  }
  
  public void draw(){
    theColor = color(r,g,b,a);
  }
  
  public void randomColor(){
    r = (int)random(0,255);
    g = (int)random(0,255);
    b = (int)random(0,255);
    a = 255;
  }

  
  public int get(){
    return theColor; 
  }
  
  public ArrayList<Entry> getElements() {
    ArrayList<Entry> vvs = new ArrayList<Entry>();
    vvs.add(new Entry("ColorMaker:"));
    vvs.add(new Editable<Integer>("r", 0, 255));
    vvs.add(new Editable<Integer>("g", 0, 255));
    vvs.add(new Editable<Integer>("b", 0, 255));
    vvs.add(new Editable<Integer>("a", 0, 255));
    vvs.add(new Invokable("randomColor"));
    return vvs;
  }
}

public class Eye implements ObjectMenueInterface{
  public float size = 5;
  
  public Color theColor;
  
  public boolean angry;
  
  public Eye(){
    theColor = new Color(0,0,0,200);
  }
  
  public ArrayList<Entry> getElements() {
    ArrayList<Entry> vvs = new ArrayList<Entry>();
    vvs.add(new Entry("Eye:"));
    vvs.add(new Editable<Float>("size",1f,25f));
    vvs.add(new SubMenue("theColor"));
    vvs.add(new Editable<Boolean>("angry").setEditable());
    return vvs;
  }
}


