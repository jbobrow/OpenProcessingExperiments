
int GUIwidth = 100;
int GUIheight = 508;
PGraphics GUIFrame = createGraphics(GUIwidth, GUIheight, P3D);
PFont GUIfont;
color GUIbackground = color(50);

void mouseClicked(){
  if(drawGUI && (mouseX > width-GUIwidth && mouseY < GUIheight)){
    int mX = mouseX-(width-GUIwidth);
    int mY = mouseY;
//    println(mX+", "+mY);
    for(int i = 0; i<GUIelements.size(); i++){ //give the input to each GUI element
      ((GUIelement)GUIelements.get(i)).takeInput(mX,mY);
    }
  }
  else{ //not in the GUI
//    if(mouseX > width-50 && mouseY >height-50){//clicking in the lower-right toggles the GUI
//      drawGUI = !drawGUI;
//      if(!drawGUI)
//        eraseGUI();
//    }
//    else{
      //start over
      prepForNewRun();
//    }
  }
}


ArrayList GUIelements = new ArrayList();

void populateGUI(){
  GUIelements.add(new Spacer(3));
  GUIelements.add(new Slider("N of movers",7));
  
  GUIelements.add(new Spacer());
  GUIelements.add(new Checkbox("random start",2));
  GUIelements.add(new Checkbox("overlap paths",6));
  GUIelements.add(new Checkbox("respawn",7));

  GUIelements.add(new Spacer());  
  GUIelements.add(new Checkbox("in color",0));
  GUIelements.add(new Checkbox("smooth colors",1));
  
  GUIelements.add(new Spacer());
  GUIelements.add(new Slider("speed",0));
  GUIelements.add(new Checkbox("curve lines",3));
  GUIelements.add(new Checkbox("constant arcs",11));
  GUIelements.add(new Slider("curliness",1));
  
  GUIelements.add(new Spacer());
  GUIelements.add(new Checkbox("sharp turns",4));
  GUIelements.add(new Slider("angle size",3));
  GUIelements.add(new Slider("side length",4));
  
  GUIelements.add(new Spacer());
  GUIelements.add(new Slider("size",2));
  GUIelements.add(new Checkbox("shrink",9));
  GUIelements.add(new Slider("shrinking time",9));
  GUIelements.add(new Checkbox("sinusoidal size",5));
  GUIelements.add(new Slider("size ratio",5));
  GUIelements.add(new Slider("wavelength",6));
  
  GUIelements.add(new Spacer());
  GUIelements.add(new Checkbox("fade",8));
  GUIelements.add(new Slider("fade speed",8));

  GUIelements.add(new Spacer());
  GUIelements.add(new Checkbox("wiggle",10));
  GUIelements.add(new Slider("wiggle size",10));
  GUIelements.add(new Slider("wiggle length",11));
  
  
  //set positions
  int yPosition = 0;
  for(int i = 0; i<GUIelements.size(); i++){
    ((GUIelement)GUIelements.get(i)).setYpos(yPosition);
    yPosition += ((GUIelement)GUIelements.get(i)).getHeight();
  }
  println("GUI height: "+yPosition);
}

void eraseGUI(){
  fill(minColor);
  rect(width-GUIwidth,0,GUIwidth,GUIheight);
}

void drawGUI(){
  GUIFrame.beginDraw();
  GUIFrame.background(GUIbackground);
  GUIFrame.endDraw();

  for(int i = 0; i<GUIelements.size(); i++)
    ((GUIelement)GUIelements.get(i)).draw();
}


