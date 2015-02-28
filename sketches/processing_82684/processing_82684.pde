
// The following short XML file called "honda_civic_2000.xml" is parsed 
// in the code below. It must be in the project's "data" folder.
//
// <?xml version="1.0"?>
// <milestones>
//  <milestone date="20000101" miles="50" maintenance="Bought Car New" maintenancecost="12900" avggalgas="1.3" ></milestone>
//  <milestone date="20000501" miles="3000" maintenance="Oil Change" maintenancecost="16" avggalgas="1.45" ></milestone>
//  <milestone date="20001105" miles="6050" maintenance="Oil Change" maintenancecost="16" avggalgas="1.58" ></milestone>
//  <milestone date="20010301" miles="9100" maintenance="Oil Change" maintenancecost="16" avggalgas="1.47" ></milestone>
// </milestones>


Handle[] handles;
int totalEntries;


XML xml;

void setup() {
  
  size(900, 480);
  
  
  xml = loadXML("honda_civic_2000.xml");
  XML[] children = xml.getChildren("milestone");
  
  totalEntries = children.length - 1; // This was set to -1 because of the way miles per period is being calculated
  handles = new Handle[totalEntries];
  
  
  float maxcostgas = 0;
  
  float xPos = 0;
  

  // A little loop before we do anything that can determine the highest cost of gas in the data set
  for (int i = 0; i < children.length; i++) {
    
    float curcost = children[i].getFloat("avggalgas");
    
    if (curcost > maxcostgas) {
      maxcostgas = curcost;
      println("A new high gas cost was found: " + maxcostgas);
      // If the cost per gallon is greater than the one recorded so far,
      // capture the current amount in that variable
    }
  } 
   // END OF LOOP THAT DETERMINES THE MOST EXPENSIVE GALLON OF GAS


  // This loop steps through the data points and extracts the info that will draw rectangles
  
  for (int i = 0; i < children.length - 1; i++) {
    String curdate = children[i].getString("date");
    float curmiles = children[i+1].getInt("miles") - children[i].getInt("miles");
    
    //float curmiles = children[i].getInt("miles");
    float curcost = children[i].getFloat("avggalgas");
        
    float rectHeight = ((curmiles / 6000) * 300);
    
    
    // The dynamic height is based on a percentage of the highest value of 6000 miles in a period
    // The * 300 (multiply by 300) keeps the max height of a box to 300 pixels
    // Could you add variables to this sketch to control the max height of a rect permitted
    // probably some percentage of the sketch height.  Like height * .9
    // float rectHeight = ((curmiles / 6000) * (height *.9));
    
    println(curmiles); // some helpful debugging info on these two lines
    println(curmiles / 107200);
   
    //fill(204, 102, 0, 255); // orange with full opacity
 
    float variableRed = (curcost / maxcostgas) * 255;
    
    float rectWidth = width / totalEntries;
        

    
    handles[i] = new Handle(xPos, 400 - rectHeight, rectWidth, rectHeight, handles, variableRed, "datapoint" + i, curmiles);
    
    // The y position above is using the known height of the rectangle
    // to offset it based on a starting baseline.
    // In this current form the baseline is 400.
    // To position at bottom of sketch use 480 - rectHeight
    
    xPos += rectWidth;
    
    // Set the next x position to draw the box based on the previous width
    
  }
}

void draw() {
  background(153);
  
  
  for(int i=0; i<totalEntries; i++) {
    handles[i].update(); // These are the methods that drive everything
    handles[i].display();  // .update  and  .display  are methods 
                          // a special kind of function inside of the Handle class
  }
  
  fill(0);
  
}


void mouseReleased()  {
  for(int i=0; i<totalEntries; i++) {
    handles[i].releaseEvent();
  }
}


class Handle {
  
  float x, y;
  float handleheight, handlewidth;
  float boxx, boxy;
  float length;
  float size;
  String dataPointName;
  float periodMiles;
  
  float redColor;
  
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Handle[] others;
  
  Handle(float ix, float iy, float iw, float ih, Handle[] o, float passedredColor, String name, float passedMiles) {
    x = ix;
    y = iy;
    handleheight = ih;
    handlewidth = iw;
    boxx = x;
    boxy = y;
    others = o;
    dataPointName = name;
    periodMiles = passedMiles;
    
    redColor = passedredColor;
    
  }
  
  void update() {
    boxx = x;
    boxy = y;
    
    for(int i=0; i<others.length; i++) {
      if(others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }  
    }
    
    if(otherslocked == false) {
      overEvent();
      pressEvent();
    }
    
    if(press) {
      println("mouse clicked down");  //
      //length = lock(mouseX-width/2-size/2, 0, width/2-size-1);
    }
  }
  
  void overEvent() {
    if(overRect(boxx, boxy, handlewidth, handleheight)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void pressEvent() {
    if(over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }
  
  void releaseEvent() {
    locked = false;  //
  }
  
  void display() {
    line(x, y, x+length, y);
    fill(redColor, 120, 0);
    stroke(0);

    rect(boxx, boxy, handlewidth, handleheight);
    
    if(over || press) {
      line(boxx, boxy, boxx+handlewidth, boxy+handleheight);
      line(boxx, boxy+handleheight, boxx+handlewidth, boxy);
      
      textSize(36);
      text("Miles driven: " + int(periodMiles), 20, 40);
      
      fill(0);
      text("Data Milestone " + dataPointName, 20, 80);
    }

  }
}

boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

float lock(float val, float minv, float maxv) { 
  return  min(max(val, minv), maxv); 
} 



