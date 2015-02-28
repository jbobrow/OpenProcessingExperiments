

class Controller {
  color bckCol = color(#1a1a1a);
  color overCol = color(#FFCC22);
  color normCol = color(#B9B9B9);

  int id;
  ArrayList sliders;
  PVector pos;
  boolean ready = false;
  GUI parent;
  TheEngine engine;
  PGraphics rohy[];
  PGraphics roh;
  ArrayList ctlFields;

  float percent = 0;

  int w = 127;

  int cx = -10;
  int cy = -10;
  int wx = 85;

  String name;

  Object unit;
  Class<?> myClass;
  Field[] fields;

  Controller(GUI _parent, int _id) {
    parent = _parent;
    engine = parent.parent;
    

    harvestFields();
    
    
    // randomize default vaues for each picture
    for(int i =0  ; i < parent.defaults.length;i++)
    if(!parent.DEFAULT_NAMES[i].equals("x")||!parent.DEFAULT_NAMES[i].equals("y"))
      parent.defaults[i] *= random(.7,1.);
    
    id = _id;


    roh =  createGraphics(8,8,JAVA2D);
   roh.beginDraw();
       roh.noSmooth();
      roh.fill(bckCol);
      roh.stroke(normCol);
      roh.ellipse(7,7,14,14);
      roh.endDraw();
    
    
    rohy = new PGraphics[4];

    for (int i = 0 ; i < rohy.length;i++) {
      rohy[i] = createGraphics(roh.width, roh.height, JAVA2D);
      rohy[i].beginDraw();
      rohy[i].noSmooth();
      rohy[i].imageMode(CENTER);
      rohy[i].translate(roh.width/2, roh.height/2);
      rohy[i].rotate(HALF_PI*i);
      rohy[i].image(roh,0,0);
      
      
      rohy[i].endDraw();
    }

    name = engine.getUnit(id).name+"";

    pos = new PVector(engine.layoutX[id], engine.layoutY[id]);

    initSliders();

    for (int i =0 ;i<50;i++)
      addToPipeline();
  }
  
  
    void draw() {
    ready = engine.getUnit(id).ready;
    percent = engine.getUnit(id).percent;

    //if (ready)
      updateFields();


    drawBorder();
        

    for (int i =0 ; i < sliders.size(); i++) {
      Slider s = (Slider)sliders.get(i);
      s.draw();
    }
  }
  
  

  void addToPipeline() {
    ImageMasher tmp = (ImageMasher)engine.getUnit(id);
    tmp.addFilter((int)random(15));
    //println(tmp.pipeline.size());
  }

  void harvestFields() {

    ctlFields = new ArrayList();

    unit = engine.getUnit(id);
    myClass = unit.getClass();
    fields = myClass.getDeclaredFields();


      for (int ii = 0; ii < parent.DEFAULT_NAMES.length; ii++) {
        for (int i = 0; i < fields.length; i++) {
        if (fields[i].getName().equals(parent.DEFAULT_NAMES[ii])) {
          //println("got "+parent.DEFAULT_NAMES[ii]);
         
          ctlFields.add(fields[i]);
        }
      }
    }
  }


  void initSliders() {
    sliders = new ArrayList();

    harvestFields();

    for (int i =0;i<ctlFields.size();i++) {
      Field tmp = (Field)ctlFields.get(i);
      sliders.add(new Slider(this, tmp.getName(), 0, parent.rozpal*i, parent.mins[i], parent.maxs[i], parent.defaults[i]));
    }
  }

  void updateFields() {
    for (int i =0;i<ctlFields.size();i++) {
      Field tmp = (Field)ctlFields.get(i);
      Slider s = (Slider)sliders.get(i);

      try {
        tmp.set(unit, s.val);
      }
      catch(IllegalAccessException e) {
      }
    }
  }

  void drawBorder() {

    rectMode(CORNER);
    fill(bckCol);
    noStroke();
    rect(pos.x+cx+roh.width, pos.y+cy, wx+w-roh.width, parent.rozpal*sliders.size()+roh.height);
    rect(pos.x+cx, pos.y+cy+roh.height, wx+w+roh.width, parent.rozpal*sliders.size()-roh.height);

    stroke(255);

    image(rohy[0], pos.x+cx, pos.y+cy);
    image(rohy[1], pos.x+w+wx+cx, pos.y+cy);
    image(rohy[2], pos.x+w+wx+cx, pos.y+sliders.size()*parent.rozpal+cy);
    image(rohy[3], pos.x+cx, pos.y+sliders.size()*parent.rozpal+cy);

    // horizontal
    line(pos.x+cx+roh.width, pos.y+cy, pos.x+cx+wx+w, pos.y+cy);
    line(pos.x+cx+roh.width, pos.y+cy+parent.rozpal*sliders.size()+roh.height-1, pos.x+cx+wx+w, pos.y+cy+parent.rozpal*sliders.size()+roh.height-1);

    // vertical
    line(pos.x+cx, pos.y+cy+roh.height, pos.x+cx, pos.y+cy+parent.rozpal*sliders.size() );
    line(pos.x+cx+wx+roh.width+w-1, pos.y+cy+roh.height, pos.x+cx+wx+roh.width+w-1, pos.y+cy+parent.rozpal*sliders.size() );

    noStroke();
    fill(255);

    if (!ready) {
      arc(pos.x+cx+wx+w-2, pos.y+cy+10, 10, 10, 0, map(percent, 0, 100, 0, TWO_PI));
    }
  }


}


