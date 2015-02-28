
import java.awt.event.*;

ArrayList<dataBox> data = new ArrayList<dataBox>();
float camZ;

void setup(){
  size(700,700,P3D);
  background(0);
  fill(150);
  camZ = height/2 / tan(PI/6);
  addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
    }});
  color[] options = new color[4];
  for(int i = 0; i < options.length; i++)
    options[i] = color(new Float((Math.random()*255)), new Float((Math.random()*255)), new Float((Math.random()*255)), new Float((Math.random()*255)));
  for(int i = 0; i < 150; i++){
    float a = new Float((Math.random() * 400));
    float b = new Float((Math.random() * 400));
    float c = new Float((Math.random() * 400));
    float w = new Float((Math.random() * 30));
    data.add(new dataBox(a, b, c, w, options[(int) (Math.random()*options.length)]));
  }
  smooth();
}

void draw(){
  background(0);
  if(mousePressed)
    camera(mouseX  - width/2, mouseY - height/2, camZ, mouseX, mouseY, 0, 0, 1, 0);
  else
    camera((mouseX - width/2) * 2, (mouseY - height/2) * 2, camZ, width/2, height/2, 0, 0, 1, 0);
  fill(150, 20);
  pushMatrix();
  translate(215, 215, 215);
  box(430);
  popMatrix();
  for(int i = 0; i < data.size(); i++){
    pushMatrix();
    fill(data.get(i).g);
    translate(data.get(i).x + data.get(i).f/2, data.get(i).y + data.get(i).f/2, data.get(i).z + data.get(i).f/2);
    noStroke();
    box(data.get(i).f);
    popMatrix();
  }
}

void mouseWheel(int delta) {
  if(delta < 0 ? camZ > (height/2) / tan(PI/4) : true)
    camZ += delta * 100;
}

class dataBox{
  float x, y, z, f;
  color g;
  
  public dataBox(float a, float b, float c, float w, color v){
    x = a;
    y = b;
    z = c;
    f = w;
    g = v;
  }
}

