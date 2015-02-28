
public class Owl{
   
  //Constructor
  public Owl(String name )
  {
    print("Making an owl named: "+name);
    owlColor = color(random(255), random(255), random(255));
    scale = 1;
    position = new PVector(250, 250);
  }
  
  private String name;
  private color owlColor;
  public float scale;
  public PVector position;
  
  public void changeColor()
  {
    owlColor = color(random(255), random(255), random(255));
  }
  public void changeColor(float r, float g, float b)
  {
    owlColor = color(r,g,b);
  }
  
  
//created function
  public void display()
  {
    
    pushMatrix();
       
    translate(position.x, position.y);
    scale(scale);
    stroke(0);
    //thickness of the line
    strokeWeight(70);
    //body of owl
    line(0, -35, 0, -65);
    //stroke now turned off
    noStroke();
    //left eye dome
    //random fill on left eye dome
    fill(owlColor);
    ellipse(-17.5, -65, 35, 35);
    //right eye dome
    //random fill on right eye dome
    fill(owlColor);
    ellipse(17.5, -65, 35, 35);
    //chin and random fill
    fill(owlColor);
    arc(0, -65, 70, 70, 0, PI);
    //black fill
    fill(0);
    //left eye
    ellipse(-14, -65, 8, 8);
    //right eye
    ellipse(14, -65, 8, 8);
    //beak
    fill(0);
    quad(0, -58, 4, -51, 0, -44, -4, -51);
    
    popMatrix();
    
  }
  
}

Owl hedwig;
Owl jobe;

void setup(){
  
  size(500,500);
  background(255);
  smooth();
  
  hedwig = new Owl("Hedwig");
  jobe   = new Owl("Jobe");
  
  hedwig.position = new PVector(150, 150);
  jobe.position = new PVector(350, 200);
  
}


void draw(){
  
  background(color(220));
  
  hedwig.display();
  jobe.display();
  
  hedwig.scale = map( sin(frameCount*.1), -1, 1, .5, 1.5 );
  
}


void keyPressed(){
  if( key == 'A' )
    hedwig.changeColor();
  if( key == 'S' )
    jobe.changeColor();
}
