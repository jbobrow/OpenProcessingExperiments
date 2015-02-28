

class Category {
  String name;
  int id;
  
  Category parent;
  
  ArrayList<Category> categories;
  ArrayList<Node> nodes;
  int current;
  
  int imageNum;
  
  Category(Category parentCat, XMLElement parent, int id) {
    this.id = id;
    name = "";
    current = -1;
    
    this.parent = parentCat;
    
    categories = new ArrayList<Category>();
    nodes = new ArrayList<Node>();
    
    int over = 0;
    for(int i = 0; i < parent.getChildCount(); i ++) {
      if((parent.getChild(i)).getName().equals("text")) {
        name = (parent.getChild(i)).getContent();
      }
      if((parent.getChild(i)).getName().equals("category")) {
        categories.add(new Category(this, parent.getChild(i), over += 1));
      }
      if((parent.getChild(i)).getName().equals("node")) {
        nodes.add(new Node(this, parent.getChild(i), over += 1));
      }
      if((parent.getChild(i)).getName().equals("imagepath")) {
        PImage temp = loadImage(parent.getChild(i).getContent());
        temp.resize(150, 120);
        images = (PImage[]) append(images, temp);
        imageNum = images.length - 1;
      }
    }
  }
  
  boolean isTop() {
    if(current == -1) return true;
    else return false;
  }
  
  void elevate() {
    if(currentType()) {
      if(getCurrentCategory().current == -1) current = -1;
      else getCurrentCategory().elevate();
    } else if(!currentType()) {
      current = -1;
    }
  }
  
  void update() {
    int prevCurrent = current;
    
    if(current == -1) {
      ArrayList<String> values = getList();
      
      int[] imagesToUse = new int[0];
      boolean doable = true;
      
      for(int i = 0; i < values.size(); i ++) {
        if(values.get(i).length() > 13 && values.get(i).substring(0, 13).equals("ESCAPE:IMAGE:")) {
          imagesToUse = append(imagesToUse, int(values.get(i).charAt(13)) - 48);
        } else {
          doable = false;
          break;
        }
      }
      
      if(doable) {
        for(int i = 0; i < values.size(); i ++) {
          if(millis() - lastClick > 500 && mousePressed && mouseX > 40 + (i % 4) * 190 && mouseX < 190 + (i % 4) * 190 && mouseY > 70 + i / 4 * 160 && mouseY < 190 + i / 4 * 160) {
            current = i + 1;
            lastClick = millis();
            break;
          }
        }
      } else {
        current = checkClicks(getList(), 0);
      }
    } else if(currentType()) getCurrentCategory().update();
    
    if(prevCurrent != current) offset = (int) LIST_ITEM_HEIGHT;
  }
  
  ArrayList<String> getList() {
    ArrayList<String> list = new ArrayList<String>();
    
    if(current == -1) list = getNames();
    else if(currentType()) list = getCurrentCategory().getList();
    else if(!currentType()) {
      list.add("ESCAPE:FINAL");
      list.add(getCurrentNode().getPositive());
    }
    
    return list;
  }
  
  Object getCurrent() {
    Object o = new Object();
    for(int i = 0; i < categories.size(); i ++) {
      if((categories.get(i)).getId() == current) o = categories.get(i);
    }
    for(int i = 0; i < nodes.size(); i ++) {
      if((nodes.get(i)).getId() == current) o = nodes.get(i);
    }
    
    return o;
  }
  
  boolean currentType() {
    for(int i = 0; i < categories.size(); i ++) {
      if((categories.get(i)).getId() == current) return true;
    }
    for(int i = 0; i < nodes.size(); i ++) {
      if((nodes.get(i)).getId() == current) return false;
    }
    return false;
  }
  
  ArrayList<String> getNames() {
    ArrayList<String> names = new ArrayList<String>();
    for(int i = 0; i < categories.size(); i ++) {
      if(categories.get(i).imageNum == -1) names.add((categories.get(i)).getName());
      else names.add("ESCAPE:IMAGE:" + categories.get(i).imageNum + ":" + (categories.get(i)).getName());
    }
    for(int i = 0; i < nodes.size(); i ++) {
      names.add((nodes.get(i)).getNegative());
    }
    return names;
  }
  
  String getName() {
    return name;
  }
  
  Category getCurrentCategory() {
    for(int i = 0; i < categories.size(); i ++) {
      if(categories.get(i).getId() == current) return categories.get(i);
    }
    return null;
  }
  
  Node getCurrentNode() {
    for(int i = 0; i < nodes.size(); i ++) {
      if(nodes.get(i).getId() == current) return nodes.get(i);
    }
    return null;
  }
  
  int getId() {
    return id;
  }
  
  ArrayList<String> search(String text) {
    ArrayList<String> results = new ArrayList<String>();
    
    for(int i = 0; i < nodes.size(); i ++) {
      if(nodes.get(i).search(text)) results.add(nodes.get(i).getNegative());
    }
    
    for(int i = 0; i < categories.size(); i ++) {
      results.addAll(categories.get(i).search(text));
    }
    
    return results;
  }
  
  Node getNodeFromNegative(String negative) {
    for(int i = 0; i < nodes.size(); i ++) if(nodes.get(i).getNegative().equals(negative)) return nodes.get(i);
    for(int i = 0; i < categories.size(); i ++) {
      Node theNode = categories.get(i).getNodeFromNegative(negative);
      try { //Use this to see if "theNode" is null, nothing else works
        if(theNode.equals(null)) theNode = theNode;
        return theNode;
      } catch(NullPointerException e) {
        continue;
      }
    }
    
    return null;
  }
  
  void disableSelection() {
    current = -1;
    for(int i = 0; i < categories.size(); i ++) categories.get(i).disableSelection();
  }
  
  void setCurrent(int id) {
    current = id;
    try {
      parent.setCurrent(this.id);
    } catch(NullPointerException e) {}
  }
}

