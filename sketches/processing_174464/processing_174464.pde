

void setup() {
  size(600, 600);
  makeTree();//initialise drawing tree 
  
  for (int i=0; i < drawingList.size(); i++){
   PImage ima = loadImage("../png_test7/brush/"+drawingList.get(i).filename); 
   image(ima,i*50,10,50,50);
  }
}

void draw() {
}



//-----------drawing

class Drawing {
  int id;
  String filename;
  IntList brushes;
  
  Drawing(String name) {
/*
    name = name.replaceAll("myimage", "");
    name = name.replaceAll(".png", "");
    String[] tokens = splitTokens(name, "_");
    
    int id = Integer.parseInt(tokens[0]);
    IntList brushes = new IntList();
    if(tokens.length > 1) {
      for(int i = 1; i < tokens.length; i++) {
        brushes.append(Integer.parseInt(tokens[i]));
      }
    }*/
    this.filename = name;
    this.id = getID(name); //id;
    this.brushes = getBrushes(name); //brushes;
  }
  /*
  Drawing(int id, IntList brushes) {
    this.id = id;
    this.brushes = brushes;
  }*/
  
  String toString() {
    return "Drawing: #" + id + " " + brushes + "\n"; 
  }
}

//--------------make tree
import java.util.ArrayList;
ArrayList<Drawing> drawingList = new ArrayList<Drawing>();

void makeTree() {
  File dir = new File("./Documents/Processing/png_test5/brush");
  File[] files = dir.listFiles();
  StringList fileNames = new StringList();
  for(File f : files) {
    String name = f.getName();
    if (name.indexOf("myimage") != -1)
      fileNames.append(name);
  }
  for(String name : fileNames) {
    drawingList.add(new Drawing(name));
    // find Drawing.id and Drawing.brushes in the file name
    /*
    name = name.replaceAll("myimage", "");
    name = name.replaceAll(".png", "");
    String[] tokens = splitTokens(name, "_");
    
    int id = Integer.parseInt(tokens[0]);
    IntList brushes = new IntList();
    if(tokens.length > 1) {
      for(int i = 1; i < tokens.length; i++) {
        brushes.append(Integer.parseInt(tokens[i]));
      }
    }
    
    // add this drawing to drawingList
    drawingList.add(new Drawing(id, brushes));*/
  }
  println(drawingList);
}

//----------------name_utils

int getID(String name) {
  name = name.replaceAll("myimage", "");
  name = name.replaceAll(".png", "");
  String[] tokens = splitTokens(name, "_");

  return Integer.parseInt(tokens[0]);
}

IntList getBrushes(String name) {
  name = name.replaceAll("myimage", "");
  name = name.replaceAll(".png", "");
  String[] tokens = splitTokens(name, "_");

  IntList brushes = new IntList();
  if (tokens.length > 1) {
    for (int i = 1; i < tokens.length; i++) {
      brushes.append(Integer.parseInt(tokens[i]));
    }
  }
  return brushes;
}




