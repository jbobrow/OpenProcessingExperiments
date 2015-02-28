
/**
 * This code demonstrates the basic interaction of Byte Light, an 
 * interactive art installation by Jack Kalish and Gabriella Levine.
 */
 
import controlP5.*;

ControlP5 controlP5;

CheckBox checkbox;

int myColorBackground;
void setup() {
  size(425,480);
  smooth();
  controlP5 = new ControlP5(this);
  checkbox = controlP5.addCheckBox("checkBox",20,20);  
  // make adjustments to the layout of a checkbox.
  checkbox.setColorForeground(color(120));
  checkbox.setColorActive(color(255));
  checkbox.setColorLabel(color(128));
  checkbox.setItemsPerRow(24);
  checkbox.setSpacingColumn(5);
  checkbox.setSpacingRow(10);
  // add items to a checkbox.
  
  for(int i = 0; i < 24 ; i++){
     checkbox.addItem("",i);
  }
  
}

void keyPressed() {
  println(char(1)+" / "+keyCode);
  if(key==' '){
    checkbox.deactivateAll();
  } else {
    for(int i=0;i<6;i++) {
      // check if key 0-5 have been pressed and toggle
      // the checkbox item accordingly.
      if(keyCode==(48 + i)) { 
        // the index of checkbox items start at 0
        checkbox.toggle(i);
        println("toggle "+checkbox.getItem(i).name());
        
      }
    }
  }
}

void draw() {
 
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    myColorBackground = 0;
    print("got an event from "+theEvent.group().name()+"\t");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
     String r = "";
     String g = "";
     String b = "";
     
     int rInt = 0;
     int gInt = 0;
     int bInt = 0;
    
    for(int i=0;i<8;i++) {
      int n = (int)theEvent.group().arrayValue()[i];
     // print(n);
       r +=n; 
      
    }
    
   
    
    for(int i=8;i<16;i++) {
      int n = (int)theEvent.group().arrayValue()[i];
      g +=n; 
     
      
    }
    
    for(int i=16;i<24;i++) {
      int n = (int)theEvent.group().arrayValue()[i];
     b +=n; 
      
      
    }
      
       println("r: "+r);
       println("g: "+g);
       println("b: "+b);
      
       rInt = unbinary(r);
       gInt = unbinary(g);
       bInt = unbinary(b);
      
       println("rInt: "+rInt);
       println("gInt: "+gInt);
       println("bInt: "+bInt);
      
      int startX = 20;
      int startY = 50;
      int w = 126;
      int h = 20;
      
      //red
      fill(rInt, 0, 0);
      rect(startX, 50, w, h);
      //green
      fill(0, gInt, 0);
      rect(startX+w, 50, w, h);
      //blue
      fill(0, 0, bInt);
      rect(startX+w*2, 50, w, h);
      
      //combined
      fill(rInt, gInt, bInt);
      rect(startX, startY+h+10, w*3, w*3);
    
    println();
  }
}


