

class Shape {
  ArrayList<Vertex> vertices;
  boolean selected;
  color fillColor;
  
  boolean dragging;
  
  Shape() {
    vertices = new ArrayList<Vertex>();
    fillColor = color(255, 102);
    
    vertices.add(new Vertex());
    selected = true;
  }
  
  Shape(color fillColor) {
    vertices = new ArrayList<Vertex>();
    this.fillColor = fillColor;
  }
  
  boolean update() {
    if(mode == SELECT && isMouseWithin()) {
      if(!(keyPressed && key == CODED && keyCode == CONTROL)) disableSelection();
      
      dragging = true;
      for(int i = 0; i < vertices.size(); i ++) vertices.get(i).update();
      
      selected = true;
    } else if(mode == SELECT) {
      if(!(keyPressed && key == CODED && keyCode == CONTROL)) selected = false;
    }
    
    for(int i = 0; i < vertices.size(); i ++) {
      if(vertices.get(i).update()) selected = true;
    }
    
    if(!selected) return false;
    else {
      if(mode == ADD && mouseInGrid()) {
        if(dist(mouseX, mouseY, vertices.get(vertices.size() - 1).location.x, vertices.get(vertices.size() - 1).location.y) < 10) turnOffSelection();
        else vertices.add(constrain(currentVertex() + 1, 0, vertices.size()), new Vertex());
      }
      return true;
    }
  }
  
  void release() {
    dragging = false;
  }
  
  void updateSelection() {
    if(dragging) {
      boolean working = true;
      
      for(int i = 0; i < vertices.size(); i ++) {
        if(!vertices.get(i).checkUpdateSelection()) {
          working = false;
          break;
        }
      }
      
      if(working) {
        for(int i = 0; i < vertices.size(); i ++) {
          vertices.get(i).updateSelection();
        }
      }
    }
  }
  
  boolean isMouseWithin() {
    PGraphics tempGraphics = createGraphics(800, 800, JAVA2D);
    
    tempGraphics.beginDraw();
    
    tempGraphics.background(0);
    tempGraphics.fill(255);
    tempGraphics.noStroke();
    
    tempGraphics.beginShape();
    for(int i = 0; i < vertices.size(); i ++) {
      tempGraphics.vertex(vertices.get(i).location.x, vertices.get(i).location.y);
    }
    tempGraphics.endShape(CLOSE);
    
    if(tempGraphics.get(mouseX, mouseY) == color(255)) {
      tempGraphics.endDraw();
      return true;
    } else {
      tempGraphics.endDraw();
      return false;
    }
  }
  
  int currentVertex() {
    for(int i = 0; i < vertices.size(); i ++) {
      if(vertices.get(i).selected) {
        return i;
      }
    }
    return -1;
  }
  
  void display() {
    stroke(255);
    
    fill((selected ? color(255, 102) : color(255, 51)));
    stroke(255);
    strokeWeight(1);
    
    beginShape();
    
    if(selected && mode == ADD) vertex(mouseX, mouseY);
    
    for(int i = 0; i < vertices.size(); i ++) {
      vertex(vertices.get(i).location.x, vertices.get(i).location.y);
      vertices.get(i).display();
    }
    
    if(selected && mode == ADD) {
      endShape();
      
      noStroke();
      fill(255, 51);
      
      ellipse(mouseX, mouseY, 3, 3);
    } else {
      endShape(CLOSE);
    }
  }
  
  void turnOffSelection() {
    selected = false;
    for(int i = 0; i < vertices.size(); i ++) vertices.get(i).selected = false;
  }
  
  void turnOffVertexSelection() {
    for(int i = 0; i < vertices.size(); i ++) vertices.get(i).selected = false;
  }
  
  void removeVertex(int remove) {
    vertices.remove(remove);
    
    if(vertices.size() <= 0) {
      shapes.remove(this);
      return;
    }
    
    vertices.get(constrain(remove - 1, 0, vertices.size())).selected = true;
  }
  
  String getOutput() {
    String output = "beginShape();\n";
    for(int i = 0; i < vertices.size(); i ++) output += vertices.get(i).getOutput() + "\n";
    return output + "endShape(CLOSE);";
  }
}

