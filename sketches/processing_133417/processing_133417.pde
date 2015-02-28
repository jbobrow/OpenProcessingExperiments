
import controlP5.*;
import java.util.Calendar;

ControlP5 cp5;
ColorPicker cp;

int StrokeWeight = 1;
boolean hideCursorState;
boolean visible;
int ang;

void setup()
{
  size(1300, 700);

  background(255, 255, 255);
  noStroke();
  fill(150, 150, 150, 150);
  rect(5, 5, 300, 195);

  cp5 = new ControlP5(this);
  
        
 //if (visible)
  //{
  cp5.addSlider("StrokeWeight")
    .setPosition(20, 50)
      .setSize(100, 20)
        .setRange(0.25, 10)
          .setValue(1)
            ;
  cp = cp5.addColorPicker("picker")
    .setPosition(20, 80)
      .setColorValue(color(0, 0, 0, 128))
      // press key 2 and ALT to hide circles
  ;
  //}
  //line(width/2, height/2, width/2, height/2);
}

void draw()
{
  stroke(cp.getColorValue());
  strokeWeight(StrokeWeight);
  smooth();
  //line(mouseX, mouseY, pmouseX, pmouseY);
  if (hideCursorState == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    //line(1300-mouseX, 500-mouseY, 1300-pmouseX, 500-pmouseY);
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    
    pushMatrix();
  
  translate(mouseX, mouseY);
  rotate(radians(ang));
  ang=ang+5;
   
   float arm = random(100);
   
  noFill();
  stroke(0, 0, 0, 50);
  strokeWeight(0.25);
  beginShape();
  vertex(0, 50);
  vertex(arm, 50);
  vertex(arm, arm*2);
  vertex(0, arm*2);
  endShape(CLOSE);
  
  popMatrix();
    //line();
    /*stroke(cp.getColorValue());
    strokeWeight(0.5);
    ellipse(mouseX, mouseY, 50, 50);
    ellipse(width-pmouseX, height-pmouseY, 50, 50);*/
  }else {}
  
}

void keyPressed()
{
  if (key == 'h' || key == 'H') hideCursorState = !hideCursorState;
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'g' || key == 'g') ;
  
  /*cp5.mapKeyFor(new ControlKey() 
  {
  public void keyEvent() 
   {
     visible = false;
   }
  }, ALT,'2');
  
  cp5.mapKeyFor(new ControlKey() 
  {
  public void keyEvent() 
   {
     visible = true;
   }
  }, ALT,'1');*/
    
  
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



