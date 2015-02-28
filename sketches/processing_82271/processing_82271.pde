

//import proxml.*;

/*
TRJNS Open Resource P4D
 A 3D object hierarchy, render engine and collada-io engine for Processing. 
 Create 3d geometry in processing and export it to for example c4d for high-end rendering. Or design geometry and bring it to Processing in a fully accesible hierarchy.
 
 Use o/l j/k p/; y/h f/g to change camera position
 Press s to save .dae file

 v02_0 | Handles 1 polygon and 1 material organised in a set of classes Object, Polygon, Material, Vertex. Writes this to a collada xml that opens correctly in c4d
 v02_1 | Handles multiple materials and polygons.
 v02_7 | Handles multiple materials, polygons, object hierarchy.
 v03_0 | Handles any number of materials, object hierarchy, rotation, position, scale
 v04_1 | Cleaned up code, work started on collada import.
 
Things to do:

Write collada import engine.



 // Note: it may be necessary to manually select all 'phong' tags in c4d and either set the phong angle or delete them altogether.
 */


/* @pjs preload="kooning.bmp"; */
/* @pjs preload="picasso2.bmp"; */



Engine engine;
Generate generate;
Generate02 generate02;
ColladaEngine colladaEngine;


Scene myScene;

boolean reDraw=true;

PVector screenCenter;

void setup() {
  size(1024, 768, P3D);

 colorMode(RGB, 1);
  screenCenter=new PVector(width/2, height/2);


  engine = new Engine();
  myScene = new Scene();
//  generate = new Generate();
//
//  generate.boxMaterials();
//  generate.boxes();

generate02 = new Generate02();

generate02.createTree();
generate02.populateTree();
generate02.parseTree();

}





void draw () {
  if (reDraw) {
    background(.75);
       noStroke();
    fill (0);
        text (" Use o/l j/k p/; y/h f/g to change camera position. Press s to save collade .dae file.",10,15);
    translate (screenCenter.x, screenCenter.y, 0);
    scale (1, -1,1);
 
    engine.drawScene(myScene);

    reDraw=false;
  }
}


void keyReleased () {

  switch (key) {
  case 's':
    println ("Save");

    colladaEngine = new ColladaEngine(this);
    colladaEngine.debugOn();
    colladaEngine.objectToCollada(myScene);
//    colladaEngine.branchMaterials(); // Add all materials
//    colladaEngine.walkTree(myScene.root); // Add all geometry
//    colladaEngine.branchLibVisScn(myScene.root); // Build scene
    
    colladaEngine.writeFile();

    break;

  case 'o':
    engine.camPY+=10;
    reDraw=true;
    break;

  case 'l':
    engine.camPY-=10;
    reDraw=true;
    break;

  case 'j':
    engine.camPX-=10;
    reDraw=true;
    break;

  case 'k':
    engine.camPX+=10;
    reDraw=true;
    break;  

  case 'p':
    engine.camPZ-=10;
    reDraw=true;
    break;

  case ';':
    engine.camPZ+=10;
    reDraw=true;
    break;  

  case 'y':
    engine.camRX-=10;
    reDraw=true;
    break;

  case 'h':
    engine.camRX+=10;
    reDraw=true;
    break;  

  case 'f':
    engine.camRY-=10;
    reDraw=true;
    break;

  case 'g':
    engine.camRY+=10;
    reDraw=true;
    break;
  }
}



void ping (String message) {
  println (message);
}

class ColladaEngine {
  // Class to create a collada xml tree, and populate it with the data from a scene.
  PApplet parent;

  Scene theScene;

  XMLElement collada, asset, library_geometries, library_effects, library_materials, library_visual_scenes, scene;

  String materialID;
  String[] materialIDs;
  Integer[] materialsInObject;

  XMLInOut xmlInOut;
  int idIndex;

  int i, count;
  String rawData;

  boolean debug=false;

  ColladaEngine (PApplet _parent) {
    parent = _parent;
  }

  void objectToCollada (Scene _theScene) {

    theScene = _theScene; // Set the targeted scene for this ColladaEngine

    xmlInOut = new XMLInOut(parent); // Create xml i/o object for xml file reading and writing !!!! THIS SHOULD GO OUTSIDE THIS CLASS

    idIndex=0; // Set collada xml node index counter to zero.

    // Start set up a collada xml tree.
    collada = new XMLElement("COLLADA"); 
    collada.addAttribute("xmlns", "http://www.collada.org/2005/11/COLLADASchema");
    collada.addAttribute("version", "1.4.1");

    collada.addChild(new XMLElement("asset"));
    asset = collada.getChild(0);
    asset.addChild(new XMLElement("contributor"));
    asset.getChild(0).addChild(new XMLElement("authoring_tool"));
    asset.getChild(0).getChild(0).addChild(new XMLElement("TRJNS Open Resource P4D", true));
    asset.addChild(new XMLElement("created"));
    asset.getChild(1).addChild(new XMLElement(year()+"-"+month()+"-"+day()+"T"+hour()+"-"+minute()+"-"+second()+"Z", true));
    asset.addChild(new XMLElement("modified"));
    asset.getChild(2).addChild(new XMLElement(year()+"-"+month()+"-"+day()+"T"+hour()+"-"+minute()+"-"+second()+"Z", true));
    asset.addChild(new XMLElement("unit"));
    asset.getChild(3).addAttribute("name", "meter");
    asset.addChild(new XMLElement("up_axis"));
    asset.getChild(4).addChild(new XMLElement("Y_UP", true));
    collada.addChild(new XMLElement("library_animations"));
    collada.addChild(new XMLElement("library_physics_scenes"));
    collada.addChild(new XMLElement("library_lights"));
    collada.addChild(new XMLElement("library_images"));
    collada.addChild(new XMLElement("library_materials"));
    library_materials=collada.getChild(5);
    collada.addChild(new XMLElement("library_effects"));
    library_effects=    collada.getChild(6);
    collada.addChild(new XMLElement("library_geometries"));
    library_geometries =collada.getChild(7);
    collada.addChild(new XMLElement("library_controllers"));
    collada.addChild(new XMLElement("library_visual_scenes"));
    library_visual_scenes =collada.getChild(9);
    collada.addChild(new XMLElement("scene"));
    scene =collada.getChild(10);
    // End set up a collada xml tree.

    parseAllMaterials();
    parseAllGeometry(theScene.root); // Recursively walk through object-tree down from the root object and handle any geometry found
    parseAllObjects(theScene.root); // Recursively walk object tree down and build scene hierarchy
  }

void parseAllMaterials () {

    //    int materialIndex=0;
    materialIDs = new String[theScene.NumberOfMaterials()];
    ping ("Materials: "+theScene.NumberOfMaterials());

    // Loop through the materials and create xml code for them.

    for (int mi=0;mi<theScene.NumberOfMaterials();mi++) {

      library_effects.addChild(new XMLElement("effect"));
      String effectID = generateID();
      XMLElement effect = library_effects.getChild(mi);

      // Create effect 'blinn'
      effect.addAttribute ("id", effectID);
      effect.addChild(new XMLElement("profile_COMMON"));
      effect.getChild(0).addChild(new XMLElement("technique"));

      XMLElement technique =effect.getChild(0).getChild(0);
      technique.addAttribute("sid", "COMMON");
      technique.addChild(new XMLElement("blinn"));

      technique.getChild(0).addChild(new XMLElement("diffuse"));
      addColour (technique.lastChild().getChild(0), theScene.GetMaterial(mi).diffuse);
      technique.getChild(0).addChild(new XMLElement("specular"));
      addColour (technique.lastChild().getChild(1), 0.2, 0.2, .2, 1);
      technique.getChild(0).addChild(new XMLElement("shininess"));
      addFloat (technique.lastChild().getChild(2), 0.5);

      // And list it to the material library

      library_materials.addChild(new XMLElement("material"));
      materialIDs[mi]=generateID();

      XMLElement material = library_materials.getChild(mi);

      material.addAttribute("id", materialIDs[mi]);
      material.addAttribute("name", theScene.GetMaterial(mi).name);

      material.addChild(new XMLElement("instance_effect"));
      material.getChild(0).addAttribute("url", "#"+effectID);
    } // end loop

    materialID=materialIDs[0];
  }


  void parseAllGeometry (Object theObject) { // A recursive loop that walks down the object tree and processes any geometry it finds.

    int i=0;
    while (i<theObject.childNodes.size ()) {
      Object currentObject = ((Object) theObject.childNodes.get(i));

      // If it has geometry, create a collada branch for that geometry.
      if (currentObject.hasGeometry) {
        branchGeometry(currentObject);
      }
      // And recursively walk the object-branches downward from this child.
      parseAllGeometry (currentObject);
      i++;
    }
  }

  void branchGeometry (Object theObject) { // Create a collada branch for the geometry present in an object. (Assumes there is such geometry, no check)

    // Create a String with all the flat x/y/z vertex data.
    rawData="";
    count=theObject.vertices.size();

    for (int i=0;i<count;i++) {
      Vertex currentVertex=(Vertex) theObject.vertices.get(i);
      rawData += currentVertex.x +" ";
      rawData += currentVertex.y +" ";
      rawData += (-1*currentVertex.z) +" ";
    } 
    i=rawData.length()-1;
    rawData = rawData.substring(0, i);
    // End create flat vertex data string


    library_geometries.addChild(new XMLElement("geometry"));  // Now create a collada 'geometry' node
    XMLElement currentNode = library_geometries.lastChild();  // And get a reference to the xml node we've just created.

    theObject.geometryIDref=generateID();  // Create a Collada ID for the current object and add it to the object.
    currentNode.addAttribute("id", theObject.geometryIDref);     // And add it to the Collada geometry node we've created


    // Add a collada 'mesh' node and get a refence to it.
    currentNode.addChild(new XMLElement("mesh"));
    XMLElement mesh = currentNode.firstChild();

    // And a collada 'source' node with the vertice xyz info.
    String sourceID= createXYZSource("Geom_"+theObject.name, mesh, rawData, count, 3);

    // Now add the collada nodes to explain that the information in the source node is vertices.
    mesh.addChild(new XMLElement("vertices"));
    String vertexID = generateID();
    mesh.lastChild().addAttribute("id", vertexID);
    mesh.lastChild().addChild(new XMLElement("input"));
    mesh.lastChild().lastChild().addAttribute("semantic", "POSITION");
    mesh.lastChild().lastChild().addAttribute("source", "#"+ sourceID);


    // We want to sort the polygons by material so we can create collada branches for them per material.

    ping ("Sorting polygons by material for "+theObject.name);

    Hashtable theMaterials = new Hashtable();

    for (int i=0;i<theObject.polygons.size();i++) {
      Polygon tP = (Polygon) theObject.polygons.get(i);
      int tM=tP.material;

      ping (""+tM);

      if (!theMaterials.containsKey(tM)) {
        theMaterials.put(tM, new ArrayList());
      }
      ArrayList tA = (ArrayList)theMaterials.get(tM);
      tA.add(i);
    }

    ping (""+theMaterials.size());
    //    ping ("Writing sets to collada.");

    // Get a set containing all the keys in the hashtable. Convert that set to an array of int representing material-indexes.
    Set allMaterials = theMaterials.keySet();
    //    Integer[] materialsInObject = (Integer[]) allMaterials.toArray( new Integer[0]);
    theObject.materialsInObject = (Integer[]) allMaterials.toArray( new Integer[0]);

    // Cycle through the list of used materials
    for (int m=0;m<theObject.materialsInObject.length;m++) {
      Integer tM=theObject.materialsInObject[m];
      //      ping (""+tM);
      // Get arraylist with polygons in this material.
      ArrayList tA = (ArrayList)theMaterials.get(tM);

      // Create a String with all the flat polygon point data.
      rawData="";
      count=tA.size();

      for (int i=0;i<count;i++) {
        Integer tP = (Integer) tA.get(i);
        Polygon currentPolygon=(Polygon) theObject.polygons.get(tP);
        rawData += currentPolygon.points[0] +" ";
        rawData += currentPolygon.points[1] +" ";
        rawData += currentPolygon.points[2] +" ";
      } 

      i=rawData.length()-1;
      rawData = rawData.substring(0, i);

      mesh.addChild(new XMLElement("triangles"));
      mesh.lastChild().addAttribute("count", count);

      mesh.lastChild().addAttribute("material", theScene.GetMaterial(tM).name);

      mesh.lastChild().addChild(new XMLElement("input"));
      mesh.lastChild().lastChild().addAttribute("offset", 0);

      mesh.lastChild().lastChild().addAttribute("semantic", "VERTEX");
      mesh.lastChild().lastChild().addAttribute("source", "#"+vertexID);
      mesh.lastChild().addChild(new XMLElement("p"));
      mesh.lastChild().lastChild().addChild(new XMLElement(rawData, true));
    }
  }


  void parseAllObjects (Object theObject) {

    // Add a 'visual_scene' branch to library_visual_scens, this will contain our  scene.
    library_visual_scenes.addChild (new XMLElement ("visual_scene"));
    String visual_sceneID = generateID();
    library_visual_scenes.getChild(0).addAttribute("id", visual_sceneID);

    // Start branching out objects. We begin with the passed object (root), and start at the visual_scene branch we've just created. The code will recursively branch out further.
    branchObject (theObject, library_visual_scenes.getChild(0));

    // Now add a reference to this visual scene in the collada scene branch.
    scene.addChild (new XMLElement ("instance_visual_scene"));
    scene.getChild(0).addAttribute("url", "#"+ visual_sceneID  );
  }



  void branchObject (Object theObject, XMLElement theBranch) {
    // This will create an object branch for the passed Object. It will add this in the collada tree at the passed XMLElement

    ping("Branching object: "+theObject.name);


    theBranch.addChild (new XMLElement ("node"));
    XMLElement node =theBranch.lastChild();

    String nodeID=generateID();
    node.addAttribute("id", nodeID);
    node.addAttribute("name", theObject.name);

    // Add attributes/nodes for position, rotation, etc.
    node.addChild(new XMLElement("translate"));
    node.getChild(0).addAttribute("sid", "translate" );
    node.getChild(0).addChild(new XMLElement(theObject.tx+" "+theObject.ty+" "+(-1*theObject.tz), true));

    node.addChild(new XMLElement("rotate"));
    node.getChild(1).addAttribute("sid", "rotateY" );
    node.getChild(1).addChild(new XMLElement("0 1 0 "+theObject.ry, true));

    node.addChild(new XMLElement("rotate"));
    node.getChild(2).addAttribute("sid", "rotateX" );
    node.getChild(2).addChild(new XMLElement("1 0 0 "+theObject.rx, true));

    node.addChild(new XMLElement("rotate"));
    node.getChild(3).addAttribute("sid", "rotateZ" );
    node.getChild(3).addChild(new XMLElement("0 0 1 "+(1*theObject.rz), true));

    node.addChild(new XMLElement("scale"));
    node.getChild(4).addAttribute("sid", "scale" );
    node.getChild(4).addChild(new XMLElement(theObject.sx+" "+theObject.sy+" "+(theObject.sz), true));


    // Add an 'instance_geometry' node, this will contain a reference to the geometry. If the object does not have any, we don't create this node.

    if (theObject.hasGeometry) {

      node.addChild(new XMLElement("instance_geometry"));
      XMLElement intance_geometry = node.lastChild();

      intance_geometry.addAttribute("url", "#" + theObject.geometryIDref);

      intance_geometry.addChild(new XMLElement("bind_material"));
      intance_geometry.getChild(0).addChild(new XMLElement("technique_common"));
      XMLElement technique_common = intance_geometry.getChild(0).getChild(0);

      for (int m=0;m<theObject.materialsInObject.length;m++) {
        technique_common.addChild(new XMLElement("instance_material"));
        technique_common.getChild(m).addAttribute("symbol", theScene.GetMaterial(theObject.materialsInObject[m]).name);
        technique_common.getChild(m).addAttribute("target", "#"+materialIDs[theObject.materialsInObject[m]]);
      }
    } // end if 'has geometry'


    // Pass all childnodes back into this method recursively to branch out the entire collada object tree.
    int i=0;
    while (i<theObject.childNodes.size ()) {
      Object currentObject = ((Object) theObject.childNodes.get(i));
      branchObject (currentObject, node);
      i++;
    }
  }





  


  void addColour (XMLElement _target, float r, float g, float b, float x) {
    _target.addChild(new XMLElement("color"));
    _target.getChild(0).addChild(new XMLElement((r+" "+g+" "+b+" "+x), true));
  }

  void addColour (XMLElement _target, color _colour) {
    _target.addChild(new XMLElement("color"));
    _target.getChild(0).addChild(new XMLElement((red(_colour)+" "+green(_colour)+" "+blue(_colour)+" "+alpha(_colour)), true));
  }

  void addFloat (XMLElement _target, float v) {
    _target.addChild(new XMLElement("float"));
    _target.getChild(0).addChild(new XMLElement(""+v, true));
  }



  String createXYZSource (String _name, XMLElement target, String _rawData, int _count, int _stride) {
    // Adds a collada 'source' node as a child to the given target.

    target.addChild (new XMLElement("source"));
    XMLElement source = target.lastChild();

    String sourceID=generateID();
    source.addAttribute("id", sourceID);
    source.addAttribute("name", _name);

    String float_arrayID=generateID();

    source.addChild(new XMLElement("float_array"));

    source.firstChild().addAttribute("id", float_arrayID);
    source.firstChild().addAttribute("count", ""+_count*_stride);
    source.firstChild().addChild(new XMLElement(_rawData, true));

    source.addChild(new XMLElement("technique_common"));
    source.getChild(1).addChild(new XMLElement("accessor"));

    XMLElement accessor = source.getChild(1).firstChild();
    accessor.addAttribute("count", _count);
    accessor.addAttribute("source", "#"+float_arrayID);
    accessor.addAttribute("stride", _stride);
    accessor.addChild(new XMLElement("param"));
    accessor.addChild(new XMLElement("param"));
    accessor.addChild(new XMLElement("param"));
    accessor.getChild(0).addAttribute("name", "X");
    accessor.getChild(0).addAttribute("type", "float");
    accessor.getChild(1).addAttribute("name", "Y");
    accessor.getChild(1).addAttribute("type", "float");
    accessor.getChild(2).addAttribute("name", "Z");
    accessor.getChild(2).addAttribute("type", "float");

    return (sourceID);
  }

  String generateID () {
    idIndex++;
    return ("ID_"+idIndex);
  }


  // IO
  void writeFile () {
    xmlInOut.saveElement(collada, "colladaFile.dae");
  }


  void ping (String message) {
    if (debug) {
      println (message);
    }
  }
  void debugOn () {
    debug=true;
  }
  void debugOff () {
    debug=false;
  }
}

class ColladaEngineIn {
  // A class to parse a collada xml tree into a P4D scene.
  
  boolean debug=true;
  XMLInOut xmlInOut;
  XMLElement collada;
    PApplet parent;

  ColladaEngineIn (PApplet _parent) {
    parent = _parent;
  }
  
  
  
}

class Generate02 {

  Octtree octtree;
  Data data;

  Generate02() {
    data = new Data();
  }

  void createTree () {
    octtree = new Octtree(data);
  }// createtree

  void populateTree() {
    octtree.populate();
  }

  void parseTree() {
    octtree.parseGeometry();
  }
}


class Data {
  int ml = 4;
  float[] rr = {
    50, 35, 15, 10, 5, 3, 1
  };
  int[] ss = {
    5, 5, 4, 4, 3, 3
  };
  float[] hh = {
    175, 150, 100, 50, 25, 15, 10
  };
  float[] axax = {
    .4, .4, .4, .4, .4, .2, .2, .2, 0
  };

  float[]ayay = {
    0, .4, .8, 1.2, 1.6, 0, .667, 1.223, 0
  };

  Data () {
  }
}


class Octtree {
  Octbranch root;
  Object theObject;
  Data data;
  PImage source;
  int tp=0;



  Octtree (Data theData) {
    data = theData;
    root = new Octbranch(theData);
//    source = loadImage ("picasso2.bmp");
        source = loadImage ("kooning.bmp");

  }

  void populate () {
    source.loadPixels();  

    int w = source.width;
    int h = source.height;



    for (int i=0;i<w*h;i+=1) {
      root.pixelWalk(source.pixels[i]);
      tp++;
    }
  }

  void parseGeometry () {
    theObject = myScene.root.addChild("OcttreeRoot");
    parseBranchGeometry (root, theObject,0);
  }

  void parseBranchGeometry (Octbranch theBranch, Object targetObject, float offset) {

    float r = theBranch.tr/theBranch.tp;
    float g = theBranch.tg/theBranch.tp;
    float b = theBranch.tb/theBranch.tp;



    // Create a material for this branch.
    myScene.AddMaterial (new Material ( color(r/255, g/255, b/255, 1), "ML#"+theBranch.level+"I#"+theBranch.index));
    int mi = myScene.NumberOfMaterials()-1;

    theBranch.h=data.hh[theBranch.level]*(1+.3*(theBranch.tp*pow(3, theBranch.level)/tp));


    //get the x and z position on a circle for all the sides
    for (int i=0; i < theBranch.sides; i++) {
      float angle = TWO_PI / (theBranch.sides) * i;
      float x = sin(angle) * theBranch.r1;
      float z = cos(angle) * theBranch.r1;
      float x2 = sin(angle) * theBranch.r2;
      float z2 = cos(angle) * theBranch.r2;

      targetObject.addVertex(new Vertex(x, 0, z));
      targetObject.addVertex(new Vertex(x2, theBranch.h, z2));
    }
    targetObject.ty=offset;
    targetObject.rx=theBranch.rx*180;
    targetObject.ry=theBranch.ry*180;
    

    // Add polygons
    int n=0;
    while ( n+2 < theBranch.sides*2) {
      // We loop until the vertices we're connecting to are out of range, which means we need to connect back to the first 2.
      targetObject.addPolygon(n, n+1, n+2, mi);
      targetObject.addPolygon(n+1, n+2, n+3, mi);
      n+=2;
    }
    // Connect back to the first edge.
    targetObject.addPolygon(n, n+1, 0, mi);
    targetObject.addPolygon(n+1, 0, 1, mi);



    // Now recursively branch the children of the current branch.
    int i=0;
    while (i<theBranch.children.size ()) {
      Octbranch childBranch =(Octbranch) theBranch.children.get(i);
      
      // Create a child object to be the new branch.
      theObject = targetObject.addChild("Branch#"+childBranch.index);
      // And shape it.
      parseBranchGeometry(childBranch, theObject,theBranch.h);
      i++;
    }
  } // end parse geometry
}



class Octbranch {
  int level, index;
  Octbranch parent;
  ArrayList children;
  int[] childrenList = {
    8, 8, 8, 8, 8, 8, 8, 8
  };

  float r1, r2, h;
  float rx, ry;
  int sides;
  Data data;

  int tr, tg, tb=0;
  int tp=0;

  Octbranch (Data theData) {
    // Create the root branch.
    data = theData;
    children = new ArrayList();
    level = 0;
    index=8;
    visualise();
  }
  Octbranch (Data theData, int theLevel, int theIndex, Octbranch theParent) {
    // Create the root branch.
    data = theData;
    children = new ArrayList();
    level = theLevel;
    index=theIndex;
    parent = theParent;
    visualise();
  }

  void pixelWalk (color pc) {
    int r = pc>>16 & 0xFF;
    int g = pc>>8 & 0xFF;
    int b = pc>>0 & 0xFF;
    tr+=r;
    tg+=g;
    tb+=b;
    tp++;

    //    Go down a level, until maxlevels is reached.

    if (level<data.ml) {

      int msk = 128;
      int j=0;

      while (j<level) {
        j++;
        msk=msk>>1;
      }

      int r2 = r & msk;
      int g2 = g & msk;
      int b2 = b & msk;

      int shft = 7-level;

      int index = (r2>>shft)*4 + (g2 >>shft)*2 +(b2>>shft)*1;


      if (childrenList[index]==8) {
        // If this childbranch does not exist yet, create it.
        ping ("New branch#"+index);

        children.add(new Octbranch(data, level+1, index, this));
        int ci = children.size()-1;
        // And update the index list
        childrenList[index]=ci;
      }

      // And walk the pixel down into the right branch.
      Octbranch walkDown = (Octbranch) children.get(childrenList[index]);
      walkDown.pixelWalk(pc);
    }
  }

  void visualise() {
    // Create a - basic - description of the branch's geometry. Get radius, height, number of sides from table.
    r1=data.rr[level];
    r2=data.rr[level+1];
    h=data.hh[level];
    sides=data.ss[level];
    if (level==0) {// for root level set rotation to 0
      ry=0;
      rx=0;
    } 
    else { // for all other levels get rotation from table and add randomness
      ry=data.ayay[index]+(random(-1, 1)*.0)*PI;
      rx=data.axax[index]+(random(-1, 1)*.0)*PI;
    }
  }
}


class Generate {

  Object object01, object02, object03;



  Generate () {
  }

  void boxMaterials() {
    myScene.AddMaterial (new Material ( color(1, 0, 1, 1), "Purple"));
    myScene.AddMaterial (new Material ( color(.5, 1, 0, 1), "Lime"));
    myScene.AddMaterial (new Material ( color(0, .25, 1, 1), "Blue"));
  }

  void boxes () {


    Object xaxis = myScene.root.addChild("xaxis");
    xaxis.addVertex(new Vertex(0, 0, 0));
    xaxis.addVertex(new Vertex(0, 5, 0));
    xaxis.addVertex(new Vertex(500, 0, 0));
    xaxis.addPolygon(0, 1, 2, 0);

    Object yaxis = myScene.root.addChild("yaxis");
    yaxis.addVertex(new Vertex(0, 0, 0));
    yaxis.addVertex(new Vertex(5, 0, 0));
    yaxis.addVertex(new Vertex(0, 500, 0));
    yaxis.addPolygon(0, 1, 2, 1);

    Object zaxis = myScene.root.addChild("zaxis");
    zaxis.addVertex(new Vertex(0, 0, 0));
    zaxis.addVertex(new Vertex(0, 5, 0));
    zaxis.addVertex(new Vertex(0, 0, 500));
    zaxis.addPolygon(0, 1, 2, 2);


    object01 = myScene.root.addChild("Cube0");

    object01.addVertex(new Vertex(25, -0, -25));
    object01.addVertex(new Vertex(25, -0, 25));
    object01.addVertex(new Vertex(-25, -0, -25));
    object01.addVertex(new Vertex(-25, -0, 25));
    object01.addVertex(new Vertex(25, 200, -25));
    object01.addVertex(new Vertex(25, 200, 25));
    object01.addVertex(new Vertex(-25, 200, -25));
    object01.addVertex(new Vertex(-25, 200, 25));

    object01.addPolygon(0, 1, 4, 2);
    object01.addPolygon(1, 4, 5, 2);
    object01.addPolygon(1, 3, 5, 1);
    object01.addPolygon(3, 5, 7, 1);
    object01.addPolygon(2, 3, 6, 2);
    object01.addPolygon(3, 6, 7, 2);
    object01.addPolygon(0, 2, 4, 0);
    object01.addPolygon(2, 4, 6, 0);

    object01.tx=0;
    object01.ty=0;
    object01.tz=0;

    object01.rx=10;
    object01.ry=20;


    object01 = object01.addChild("Cube1");


    object01.addVertex(new Vertex(25, -0, -25));
    object01.addVertex(new Vertex(25, -0, 25));
    object01.addVertex(new Vertex(-25, -0, -25));
    object01.addVertex(new Vertex(-25, -0, 25));
    object01.addVertex(new Vertex(25, 200, -25));
    object01.addVertex(new Vertex(25, 200, 25));
    object01.addVertex(new Vertex(-25, 200, -25));
    object01.addVertex(new Vertex(-25, 200, 25));

    object01.addPolygon(0, 1, 4, 0);
    object01.addPolygon(1, 4, 5, 0);
    object01.addPolygon(1, 3, 5, 1);
    object01.addPolygon(3, 5, 7, 1);
    object01.addPolygon(2, 3, 6, 0);
    object01.addPolygon(3, 6, 7, 0);
    object01.addPolygon(0, 2, 4, 2);
    object01.addPolygon(2, 4, 6, 2);

    object01.tx=0;
    object01.ty=200;
    object01.tz=0;

    object01.rx=30;
    object01.ry=-30;
    object01.rz=0;
    object01.sx=.75;
    object01.sy=.75;
    object01.sz=.75;


    object01 = object01.addChild("Cube2");


    object01.addVertex(new Vertex(25, -0, -25));
    object01.addVertex(new Vertex(25, -0, 25));
    object01.addVertex(new Vertex(-25, -0, -25));
    object01.addVertex(new Vertex(-25, -0, 25));
    object01.addVertex(new Vertex(25, 200, -25));
    object01.addVertex(new Vertex(25, 200, 25));
    object01.addVertex(new Vertex(-25, 200, -25));
    object01.addVertex(new Vertex(-25, 200, 25));

    object01.addPolygon(0, 1, 4, 2);
    object01.addPolygon(1, 4, 5, 2);
    object01.addPolygon(1, 3, 5, 0);
    object01.addPolygon(3, 5, 7, 0);
    object01.addPolygon(2, 3, 6, 1);
    object01.addPolygon(3, 6, 7, 1);
    object01.addPolygon(0, 2, 4, 0);
    object01.addPolygon(2, 4, 6, 0);

    object01.tx=0;
    object01.ty=200;
    object01.tz=0;

    object01.rx=30;
    object01.ry=-30;
    object01.rz=0;
    object01.sx=.75;
    object01.sy=.75;
    object01.sz=.75;



    myScene.root.parseBranchToText(); // Print description to terminal.
  }
}



class Engine {
  float camPX, camPY, camPZ, camRX, camRY, camRZ;
  Scene theScene;

  Engine () {
    camPX=camPY=camPZ=camRX=camRY=camRZ=0;
    camPZ=-400;
    camPY=-80;
  }

  void drawScene (Scene _theScene) {
    theScene = _theScene;
    translate (camPX, camPY, camPZ);

    rotateY((camRY/360)*2*PI);
    rotateX((camRX/360)*2*PI);
    rotateZ((camRZ/360)*2*PI);
    drawObjectTree(theScene.root);
  }


  void drawObjectTree (Object theObject) {

    pushMatrix();
    translate (theObject.tx, theObject.ty, -1*theObject.tz);
    scale (theObject.sx, theObject.sy, theObject.sz);
    rotateY ((theObject.ry/360)*2*PI);
    rotateX ((theObject.rx/360)*2*PI);
    rotateZ ((theObject.rz/360)*2*PI);

    if (theObject.hasGeometry) {
//      theObject.parseToScreen();
      drawToScreen (theObject);
    }

    int i=0;
    while (i<theObject.childNodes.size ()) {
      Object currentObject = ((Object) theObject.childNodes.get(i));
      // And recursively walk the branches downward from this child.
      drawObjectTree (currentObject);
      
      i++;
    }
    popMatrix();
  }

  void drawToScreen (Object drawObject) {

    //    void parseToScreen () {
    // Draw the object to screen


    if (drawObject.polygons.size()>0) {

      for (int i=0;i<drawObject.polygons.size();i++) {
        Polygon thePolygon = (Polygon) drawObject.polygons.get(i);
        //        println (i+": "+thePolygon.points[0]+" "+thePolygon.points[1]+" "+thePolygon.points[2]);

        Vertex v1 = (Vertex) drawObject.vertices.get(thePolygon.points[0]);
        Vertex v2 = (Vertex) drawObject.vertices.get(thePolygon.points[1]);
        Vertex v3 = (Vertex) drawObject.vertices.get(thePolygon.points[2]);

        fill (theScene.GetMaterial(thePolygon.material).diffuse);


        beginShape(TRIANGLES);
        vertex(v1.x, v1.y, -1*v1.z);
        vertex(v2.x, v2.y, -1* v2.z);
        vertex(v3.x, v3.y, -1* v3.z);
        endShape();
      }
    }
    //  }
  }
}

class Scene {
  // A class to hold a scene. A scene has 1 object called root, to which other objects can be added.
  // Scene class holds (an arraylist of) all materials.

  ArrayList materials;
  Object root;

  Scene () {
    root = new Object("root", this);
    materials = new ArrayList();
  }

  void AddMaterial (Material theMaterial) { // Add new material to the scene.
    materials.add(theMaterial);
  }

  Material GetMaterial (int index) { // Get indexed material from this scene 
    return ((Material) materials.get(index));
  }

  int NumberOfMaterials () { // Get number of materials in this scene
    return (materials.size());
  }
}



class Object {
  // A class to hold and organise a hierarchy of geometry.
  // An object has a name. It can hold a list of vertices, a list of polygons.
  // It has 1 parentNode, and any number of childNodes (including 0)

  String name;
  // Create a string to hold the collada id refernce for this object's geometry. This will be assigned by the colladaEngine.
  String geometryIDref; // For use by colladaEngine.

  // Variables to hold description of geometry, if any.
  boolean hasGeometry;
  ArrayList vertices, polygons;
  float tx, ty, tz, rx, ry, rz, sx, sy, sz;
  Integer[] materialsInObject; // An array to hold which materials are used in this object. For use by colladaEngine.

  // Variables to hold parent/child hierarchy
  ArrayList childNodes;
  Object parentNode;

  Scene theScene;


  // Constructor takes a name for the new object and the scene of which it is part.
  Object (String _name, Scene _theScene) { 
    theScene=_theScene;
    name=_name;
    vertices = new ArrayList();
    polygons = new ArrayList();
    childNodes = new ArrayList();
    tx= ty= tz= rx= ry=rz=0;
    sx=sy=sz=1;
    hasGeometry=false;
  }


  // Method to add child to the current object. 
  Object addChild (String _name) {
    // Add a new object with passed name, and make it inherit the scene ref of the current object.
    childNodes.add(new Object (_name, theScene));
    // Get a reference to the object we've just added..
    Object createdObject =(Object) childNodes.get(childNodes.size()-1);
    // Set the created object'ss parent to the current object
    createdObject.parentNode = this;
    // Return a reference to the childNode object we've just added.
    return (createdObject);
  }

  // Method to add a single vertext to the current object. Takes a vertex as input.
  void addVertex (Vertex _addMe) {
    vertices.add(_addMe);
    hasGeometry=true;
  }

  // Method to add a single polygon to the current object. Takes Points a,b,c and material m as input.
  void addPolygon (int _a, int _b, int _c, int _m) {
    polygons.add(new Polygon(_a, _b, _c, _m));
  }





  void parseBranchToText() {
    // TO BE IMPLEMENTETD: move to engine.
    parseToText();

    if (childNodes.size()>0) {
      // Has children.
      for (int i=0;i<childNodes.size();i++) {
        Object theChild = (Object) childNodes.get(i);
        theChild.parseBranchToText();
      }
    }
  }


  void parseToText () {
    // TO BE IMPLEMENTETD: move to engine.
    // Print a description to the terminal.
    println ("Object description:");
    println ("Name: "+name);

    if (parentNode != null) {
      // Has parent.
      println ("Parent: "+parentNode.name);
    } 



    if (vertices.size()>0) {
      println ("Vertices: "+vertices.size());
      for (int i=0;i<vertices.size();i++) {
        Vertex theVertex = (Vertex) vertices.get(i);
        println (i+": "+theVertex.x+" "+theVertex.y+" "+theVertex.z);
      }
    }

    if (polygons.size()>0) {
      println ("Polygons: "+polygons.size());
      for (int i=0;i<polygons.size();i++) {
        Polygon thePolygon = (Polygon) polygons.get(i);
        println (i+": "+thePolygon.points[0]+" "+thePolygon.points[1]+" "+thePolygon.points[2]);
      }
    }

    if (childNodes.size()>0) {
      println ("Children: "+childNodes.size());
      // Has children.
      for (int i=0;i<childNodes.size();i++) {
        Object theChild = (Object) childNodes.get(i);
        println (i+": "+theChild.name);
      }
    }
  }
}

class Colour {
  float r, g, b, x;
  Colour (float _r, float _g, float _b, float _x) {
    r=_r;
    b=_b;
    g=_g;
    x=_x;
  }
}


class Material {
  String name;
  color diffuse;

  Material (color _diffuse, String _name) {
    diffuse=_diffuse;
    name=_name;
  }
}


class Polygon {
  // A class to hold polygon info. That is: 3 points (index, referring to vertices) and a (n index reffering to a) material.

  int[] points;
  int material;

  Polygon (int _a, int _b, int _c, int _material) {
    points = new int[3];
    points[0]=_a;
    points[1]=_b;
    points[2]=_c;
    material= _material;
  }
}

class Vertex {
  // A class to hold a vertex. It has x,y,z attributes.
  float x, y, z;

  Vertex (float _x, float _y, float _z) {
    x=_x;
    y=_y;
    z=_z;
  }
}



