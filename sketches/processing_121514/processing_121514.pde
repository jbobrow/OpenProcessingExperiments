
ArrayList <Module> modules = new ArrayList <Module>();

import controlP5.*;
ControlP5 cp5;
Accordion accordion;

Textlabel myTextlabelB;

color c;
float bx;
float by;
int boxSize = 20;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0;
float yOffset = 0.0;
int cont_comb=1, cont_fan=1, cont_comp=1, cont_turb=1, cont_nozz=1, num_el;
boolean flag_unir = true, flag_connect=false;
int c1, c2, opcion;
float n, n1;

Data data;

void setup()
{
  size(1000, 700);
  smooth();
  frame.setTitle("Aircraft Engine Simulatior");
  bx = 50;
  by = 650;
  rectMode(RADIUS);
  gui();
  myTextlabelB = new Textlabel(cp5, "", (int)bx, (int)by, 400, 200);

  cp5.addButton("Connect")
    .setValue(0)
      .setPosition(100, 620)
        .setSize(100, 19)
          ;

  // and add another 2 buttons
  cp5.addButton("Script")
    .setValue(100)
      .setPosition(100, 640)
        .setSize(100, 19)
          ;
}

void draw()
{
  background(0);
  myTextlabelB.draw(this); 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
    mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if (!locked) { 
      stroke(255); 
      fill(153);
    }
  } 
  else {
    stroke(153);
    fill(153);
    overBox = false;
  }

  drawModules();

  // Draw the box
  fill(c);
  rect(bx, by, boxSize, boxSize*2);
  rect(50, 650, boxSize, boxSize*2);

  if (overBox) {
    locked = true;
    fill(255, 255, 255);
  } 
  else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}

void mouseDragged() {
  if (locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset;
  }
}

class Module {
  int type_mod;
  float x, y;
  color col;
  boolean locked=false;
  boolean isConnected[];
  int connections[];
  String name;

  Textlabel label;

  Module(float ax, float ay, color col_in, String str, int n) {
    x=ax;
    y=ay;
    isConnected=new boolean[2];
    col=col_in;
    connections=new int[2];
    connections[0]=-1;
    connections[1]=-1;
    name=str;
    label=new Textlabel(cp5, str, (int)ax-15, (int)ay-3*boxSize, 400, 200);
    type_mod=n;
  }

  int getType_mod()
  {
    return type_mod;
  }

  String name()
  {
    return name;
  }

  void setConnectionsin(int x)
  {
    connections[0]=x;
  }

  void setConnectionsout(int y)
  {
    connections[1]=y;
  }

  int getConnectionsin()
  {
    return connections[0];
  }

  int getConnectionsout()
  {
    return connections[1];
  }

  float getx()
  {
    return x;
  }

  float gety()
  {
    return y;
  }

  Textlabel getLabel()
  {
    return label;
  }

  void move(float ax, float ay)
  {
    x=ax;
    y=ay;
  }

  void display() {
    label.setPosition(x-15, y-3*boxSize);
    fill(col);
    rect(x, y, boxSize, 2*boxSize);
  }

  void setconnect_in()
  {
    isConnected[0]=true;
  }

  void setconnect_out()
  {
    isConnected[1]=true;
  }
  boolean getconnect_in()
  {
    return isConnected[0];
  }

  boolean getconnect_out()
  {
    return isConnected[1];
  }  

  void resetconnect_in()
  {
    isConnected[0]=false;
  }

  void resetconnect_out()
  {
    isConnected[1]=false;
  }


  void display_line()
  {
    if (isConnected[1])
    {
      line(x+boxSize, y, x+(modules.get(connections[1]).getx()-x)/2, y);
      line(x+(modules.get(connections[1]).getx()-x)/2, y, x+(modules.get(connections[1]).getx()-x)/2, modules.get(connections[1]).gety());
      line(x+(modules.get(connections[1]).getx()-x)/2, modules.get(connections[1]).gety(), modules.get(connections[1]).getx()-boxSize, modules.get(connections[1]).gety());
    }

    if (isConnected[0])
    {
      line(x-boxSize, y, x+(modules.get(connections[0]).getx()-x)/2, y);
      line(x+(modules.get(connections[0]).getx()-x)/2, y, x+(modules.get(connections[0]).getx()-x)/2, modules.get(connections[0]).gety());
      line(x+(modules.get(connections[0]).getx()-x)/2, modules.get(connections[0]).gety(), modules.get(connections[0]).getx()+boxSize, modules.get(connections[0]).gety());
    }
  }
}



void drawModules()
{
  for (int i=0;i<modules.size();i++)
  {
    modules.get(i).display();
    modules.get(i).display_line();
    modules.get(i).getLabel().draw(this);
    if (flag_unir&&flag_connect&&mousePressed)
      display_linemouse(modules.get(num_el).getx(), modules.get(num_el).gety());

    if (mouseX > modules.get(i).getx()-boxSize && mouseX < modules.get(i).getx()+boxSize && 
      mouseY > modules.get(i).gety()-boxSize && mouseY < modules.get(i).gety()+boxSize) {
      stroke(255); 
      fill(153);
      if (mousePressed)
      {
        if (mouseButton == RIGHT)
        {
          flag_connect=false;
          if (modules.get(i).getconnect_in())
            modules.get(modules.get(i).getConnectionsin()).resetconnect_out();
          if (modules.get(i).getconnect_out())
            modules.get(modules.get(i).getConnectionsout()).resetconnect_in();

          modules.remove(i);
        }          
        else if (flag_unir)
        {

          if (flag_connect && num_el!=i)
          {
            modules.get(num_el).setConnectionsout(i);
            modules.get(num_el).setconnect_out();
            modules.get(i).setConnectionsin(num_el);
            modules.get(i).setconnect_in();
            flag_connect=false;
          }
          else
          {
            num_el=i;
            flag_connect=true;
          }
        }
        else
        {
          modules.get(i).move(mouseX, mouseY);
        }
      }
    }
  }
}



void display_linemouse(float x, float y)
{

  line(x+boxSize, y, x+(mouseX-x)/2, y);
  line(x+(mouseX-x)/2, y, x+(mouseX-x)/2, mouseY);
  line(x+(mouseX-x)/2, mouseY, mouseX, mouseY);
}


void mouseReleased() {
  if (locked&&mouseY<500)
  {
    bx = 50; 
    by = 650;
    switch(opcion)
    {
    case 1:
      modules.add(new Module(mouseX, mouseY, c, "Comp"+nf(cont_comp++, 2), 1));
      break;
    case 0: 
      modules.add(new Module(mouseX, mouseY, c, "Fan"+nf(cont_fan++, 2), 0)); 
      break;
    case 2: 
      modules.add(new Module(mouseX, mouseY, c, "Comb"+nf(cont_comb++, 2), 2)); 
      break;
    case 3: 
      modules.add(new Module(mouseX, mouseY, c, "Turb"+nf(cont_turb++, 2), 3)); 
      break;
    case 4: 
      modules.add(new Module(mouseX, mouseY, c, "Nozz"+nf(cont_nozz++, 2), 4)); 
      break;
    }
  }
  locked = false;
}

void gui() {

  cp5 = new ControlP5(this);
  // group number 2, contains a radiobutton
  Group g2 = cp5.addGroup("Modules")
    .setBackgroundColor(color(0, 64))
      .setBackgroundHeight(150)
        ;

  cp5.addRadioButton("radio")
    .setPosition(10, 20)
      .setItemWidth(20)
        .setItemHeight(20)
          .addItem("Fan", 0)
            .addItem("Compressor", 1)
              .addItem("Combustor", 2)
                .addItem("Turbine", 3)
                  .addItem("Nozzle", 4)
                    .setColorLabel(color(255))
                      .activate(1)
                        .moveTo(g2)
                          ;

  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
    .setPosition(230, 550)
      .setWidth(200)
        .addItem(g2);
}

void radio(int theC) {
  opcion=theC;
  switch(theC) {
    case(0):
    c=color(204, 102, 0);
    myTextlabelB.setText("Fan");
    myTextlabelB.setPosition(40, 590);
    break;
    case(1):
    myTextlabelB.setText("Compressor");
    myTextlabelB.setPosition(25, 590);
    c=color(255, 0, 0, 200);
    break;
    case(2):
    myTextlabelB.setText("Combustor");
    myTextlabelB.setPosition(25, 590);
    c=color(0, 200, 140, 200);
    break;
    case(3):
    myTextlabelB.setText("Turbine");
    myTextlabelB.setPosition(30, 590);
    c=color(0, 128, 255, 200);
    break;
    case(4):
    myTextlabelB.setText("Nozzle");
    myTextlabelB.setPosition(35, 590);
    c=color(50, 128);
    break;
  }
}

public void controlEvent(ControlEvent theEvent) {
  n = 0;
}

public void Connect(int theValue) {
  flag_unir=!flag_unir;
  flag_connect=false;
  println(flag_unir);
}

public void Script() {
  int j=0;
  if (modules.size()>1)
  {
    for (int i=0;i<modules.size();i++)
    {
      if (!modules.get(i).getconnect_in()&&modules.get(i).getconnect_out())
      {
        j=i;
        break;
      }
    }

    data=new Data();
    String cd[]=loadStrings("Templete.py");
    data.beginSave();
    for (int q=0;q<cd.length;q++)
    {
      data.add(cd[q]);
    }



    String nameaux=modules.get(j).name();
    String con_aux='\t'+"connect(Fluids,  my_cruisingSpeed, "+nameaux;
    switch(modules.get(j).getType_mod())
    {
    case 0: 
      data.add('\t'+nameaux+" = fan()"); 
      break;
    case 1: 
      data.add('\t'+nameaux+" = combustor()"); 
      break;
    case 2: 
      data.add('\t'+nameaux+" = compressor()"); 
      break;
    case 3: 
      data.add('\t'+nameaux+" = turbine()"); 
      break;
    case 4: 
      data.add('\t'+nameaux+" = nozzle()"); 
      break;
    }
    int aux=modules.get(j).getConnectionsout();
    for (int i=1;i<modules.size();i++)
    {

      nameaux=modules.get(aux).name();
      con_aux+=", "+nameaux;
      switch(modules.get(aux).getType_mod())
      {
      case 0: 
        data.add('\t'+nameaux+" = fan()"); 
        break;
      case 1: 
        data.add('\t'+nameaux+" = combustor()"); 
        break;
      case 2: 
        data.add('\t'+nameaux+" = compressor()"); 
        break;
      case 3: 
        data.add('\t'+nameaux+" = turbine()"); 
        break;
      case 4: 
        data.add('\t'+nameaux+" = nozzle()"); 
        break;
      }
      aux=aux=modules.get(aux).getConnectionsout();
    }
    con_aux+=", my_heatAndWork, my_heatAndWork, my_specificFuelConsumption)";
    data.add(con_aux); 
    data.endSave(
    data.getIncrementalFilename(
    sketchPath("Python/Connections/"+
      java.io.File.separator+
      "Connections####.py")));
  }
}

class Data {
  ArrayList datalist;
  String filename, data[];
  int datalineId;

  // begin data saving
  void beginSave() {
    datalist=new ArrayList();
  }

  void add(String s) {
    datalist.add(s);
  }

  void add(float val) {
    datalist.add(""+val);
  }

  void add(int val) {
    datalist.add(""+val);
  }

  void add(boolean val) {
    datalist.add(""+val);
  }

  void endSave(String _filename) {
    filename=_filename;

    data=new String[datalist.size()];
    data=(String [])datalist.toArray(data);

    saveStrings(filename, data);
    println("Saved data to '"+filename+
      "', "+data.length+" lines.");
  }

  void load(String _filename) {
    filename=_filename;

    datalineId=0;
    data=loadStrings(filename);
    println("Loaded data from '"+filename+
      "', "+data.length+" lines.");
  }

  float readFloat() {
    return float(data[datalineId++]);
  }

  int readInt() {
    return int(data[datalineId++]);
  }

  boolean readBoolean() {
    return boolean(data[datalineId++]);
  }

  String readString() {
    return data[datalineId++];
  }

  // Utility function to auto-increment filenames
  // based on filename templates like "name-###.txt" 

  public String getIncrementalFilename(String templ) {
    String s="", prefix, suffix, padstr, numstr;
    int index=0, first, last, count;
    File f;
    boolean ok;

    first=templ.indexOf('#');
    last=templ.lastIndexOf('#');
    count=last-first+1;

    if ( (first!=-1)&& (last-first>0)) {
      prefix=templ.substring(0, first);
      suffix=templ.substring(last+1);

      // Comment out if you want to use absolute paths
      // or if you're not using this inside PApplet
      if (sketchPath!=null) prefix=savePath(prefix);

      index=0;
      ok=false;

      do {
        padstr="";
        numstr=""+index;
        for (int i=0; i< count-numstr.length(); i++) padstr+="0";
        s=prefix+padstr+numstr+suffix;

        f=new File(s);
        ok=!f.exists();
        index++;

        // Provide a panic button. If index > 10000 chances are it's an
        // invalid filename.
        if (index>10000) ok=true;
      }
      while (!ok);

      // Panic button - comment out if you know what you're doing
      if (index> 10000) {
        println("getIncrementalFilename thinks there is a problem - "+
          "Is there  more than 10000 files already in the sequence "+
          " or is the filename invalid?");
        println("Returning "+prefix+"ERR"+suffix);
        return prefix+"ERR"+suffix;
      }
    }

    return s;
  }
}



