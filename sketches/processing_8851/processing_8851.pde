

import controlP5.*;

ControlP5 controlP5;

CheckBox checkbox;

int myColorBackground;
void setup() {
  size(400,400);
  smooth();
  controlP5 = new ControlP5(this);
  checkbox = controlP5.addCheckBox("checkBox",300,300);  
  checkbox.setColorForeground(color(50));
  checkbox.setColorActive(color(100));
  checkbox.setColorLabel(color(50));
  checkbox.setItemsPerRow(2);
  checkbox.setSpacingColumn(20);
  checkbox.setSpacingRow(20);

  
  checkbox.addItem("1",50);
  checkbox.addItem("2",75);
  checkbox.addItem("3",200);
  checkbox.addItem("4",5);
}

void keyPressed() {
  println(char(1)+" / "+keyCode);
  if(key==' '){
    checkbox.deactivateAll();
  } else {
    for(int i=0;i<6;i++) {
    if(keyCode==(48 + i)) { 
        checkbox.toggle(i);
    println("toggle "+checkbox.getItem(i).name());
       
      }
    }
  }
}
// kleur van rondjes
void draw() {
  background(myColorBackground);
  fill(255,0,0);
  stroke (100);
  ellipse(50,50,20,50);
  
  fill(0,255,0);
  stroke (100);
  ellipse(100,100,50,20);
  
  fill(0,0,255);
  stroke (100);
  ellipse(150,50,20,50);
  
  fill(255,0,0);
  stroke (100);
  ellipse(200,100,50,20);
  
  fill(0,255,0);
  stroke (100);
  ellipse(250,50,20,50);
  
  fill(0,0,255);
  stroke (100);
  ellipse(200,100,50,20);
  
  fill(0,0,255);
  stroke (100);
  ellipse(350,50,20,50);
  
  fill(0,255,0);
  stroke (100);
  ellipse(300,100,50,20);
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    myColorBackground = 0;
    print("got an event from "+theEvent.group().name()+"\t");
    for(int i=0;i<theEvent.group().arrayValue().length;i++) {
      int n = (int)theEvent.group().arrayValue()[i];
      print(n);
      if(n==1) {
        myColorBackground += ((RadioButton)theEvent.group()).getItem(i).internalValue();
      }
    }
    println();
  }
}




