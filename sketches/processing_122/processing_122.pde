
class Tag {
  Vector3D loc;
  float mass;
  String tagName;
  float tagWidth;
  boolean dragging = false;
  boolean rollover = false;
  Vector3D drag;  // holds the offset for when object is clicked on
  float radius;
  
  Tag[] et; // all existing tags
  Tag[] rt; // related tag

  Tag(String t_,Vector3D l, Tag[] existingTags) {
    loc = l.copy();
    tagName = t_;
    tagWidth = textWidth(tagName);
    mass = tagWidth + 2;
    radius = mass/2;
    drag = new Vector3D(0.0,0.0);
    et = existingTags; //all the tags
  }


  // Main method to operate object
  void go() {
    render();
    drag();
  }


  // Method to display
  void render() {
    ellipseMode(CENTER);
    textAlign(CENTER);
    noStroke();
    if(dragging){
      fill(250,250,150,90);
      ellipse(loc.x,loc.y,mass,mass);
      fill(0, 102, 153);//text color
      text(tagName, loc.x, loc.y+7);
    } 
    else if (rollover){
      fill(230,230,100,90);
      ellipse(mouseX,mouseY,mass,mass);
      fill(0);//text color
      text(tagName, mouseX, mouseY+7);
    } 
    else {
      fill(250,90);
      ellipse(loc.x,loc.y,mass,mass);
      fill(0, 102, 153);//text color
      text(tagName, loc.x, loc.y+7);
    }

    if (showVectors) {
      //drawVector(new Vector3D(random(width),random(height)),new Vector3D(random(width),random(height)), 0.88);
     drawVector(loc,loc,0);
     
    }
   
   
    
    for (int i = 0; i < rt.length; i++){  //for all related tags connect their points
     // print(tagName + ":");
      //println(rt[i].tagName + ":" + rt[i].loc.x + ":" + rt[i].loc.y);
      line( loc.x, loc.y,  rt[i].loc.x, rt[i].loc.y);
    }



  }
 

  void clicked(int mx, int my) {
    float d = dist( mx, my,loc.x,loc.y);
    if (d < radius) {
      dragging = true;
      drag.x = loc.x-mx;
      drag.y = loc.y-my;
    }
  }

  void rollover(int mx, int my) {
    float d = dist(mx, my,loc.x,loc.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      loc.x = mouseX + drag.x;
      loc.y = mouseY + drag.y;
    }
  }

  public void loadRelatedTags()
  {
    String myURL = "http://www.platohelper.com/vis/tagRelation.php?tag=" + tagName;
    String[] lines = loadStrings(myURL); //to retrive everything
    String[] tags = new String[0]; //to store the tags after parsing all
    for (int i=0; i < lines.length; i++) {
      tags = splitTokens(lines[i], " ");
    }

    rt = new Tag[tags.length];
    for (int i=0; i < tags.length; i++) // for all the strings in the related tag array
    { 
      for (int e=0; e < et.length; e++) // for all the tags that exist
      {
        
        if (et[e].tagName.equals(tags[i])) //if a tag has value equal 
        {        
          //println(et[e].tagName);
          rt[i] = et[e];
        } 
      }
    }
  }
  
  //adding functionality
  void setLoc(Vector3D v) {
    loc = v.copy();
  }
}

