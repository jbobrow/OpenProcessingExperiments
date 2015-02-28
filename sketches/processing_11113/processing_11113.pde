
/**
 *               MD2 Model loader and viewer
 *                     by Peter Lager
 * 
 * This program demonstrates how a MD2 model file can be loaded and viewed.
 * MD2 is open file format created and used by Quake for their character 
 * animations.
 *
 * A 2D control panel has been created that allows you to rotate, scale
 * and select the animation sequence to be shown. Try 'flip' and rotate
 * the model so it is facing away from you!
 *
 * The 2D GUI was created using the 'GUI 4 Processing' library which you
 * can get from gui4processing.lagers.org.uk
 *
 * I take absolutely no credit for the MD2 model used, look in the
 * txt file accompanying the model files for more info about the model.
 * 
 * There are 2 models (the Ogro and the weapon) which between them have
 * 85,968 points (i.e. XYZ coordinates) and require ~1MB of RAM to
 * store the model data and that excludes the textures. Even so I have had
 * had frame rates between 8 and 60 fps. This will depend on your processor and
 * other programs/tasks loaded/running.
 *
 * Whatever framerate your computer achieves the speed the model is animated
 * is kept constant and is still fairly smooth even at 8fps.
 * 
 */

import guicomponents.*;

GButton btnResetRotScale;
GPanel pnl;
GHorzSlider sx,sy, sz;
GVertSlider mscale;
GOptionGroup optgState;
GOption[] optStates;
GLabel lblFps;
GCheckbox cbxWire;

PMatrix3D dmat, dmatOrg;

int rotX = 90, rotY = 0, rotZ = 90;
float initZoom = 5.5f, zoom;
float interpolate = 0.1;
boolean showWire = false;

// Remember last slider values
int lastSx, lastSy, lastSz;
int currSx, currSy, currSz;

// Used to remember PGraphics3D transformation matrix
PGraphics3D g3;

MD2_Loader loader;
MD2_Model model1, model2;

long counter = 0;

void setup() {
  size(600,520,P3D);

  zoom = initZoom;

  // The matrix that will be used for rendering the model  
  dmat = new PMatrix3D((PMatrix3D)getMatrix()); // copy the initial matrix
  dmat.translate(width * 0.5f, height * 0.6f);
  dmat.rotateX(radians(rotX));
  dmat.rotateY(radians(rotY));
  dmat.rotateZ(radians(rotZ));
  // Make a copy so we can reset the rotations to init values
  dmatOrg = new PMatrix3D(dmat);

  // Create a loader to load MD2 model
  loader = new MD2_Loader(this);
  model1 = loader.loadModel("models/ogro/ogro.md2", "models/ogro/ogrobase.jpg");
  model2 = loader.loadModel("models/ogro/weapon.md2", "models/ogro/weapon.jpg");

  loader = null; // loader no lomger required so get rid of it to release RAM

  G4P.setTextMode(SCREEN); 
  G4P.messagesEnabled(false);

  // Sets the colour scheme for the GUI components 
  // Schemes available are 
  // BLUE_SCHEME, GREEN_SCHEME, RED_SCHEME, GREY_SCHEME
  // YELLOW_SCHEME, CYAN_SCHEME, PURPLE_SCHEME
  // Defaults to BLUE_SCHEME 
  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.GREEN_SCHEME);

  /* GFont.getFont() - parameters
   * 1) this (always)
   * 2) font name (see below)
   * 3) font size
   *
   * The font name will depend on the OS used and fonts installed. It should be the same
   * as those listed in the 'Create Font' tool in processing. Alternatively use
   * println(PFont.list());
   * in a Processing sketch
   */
  GComponent.globalFont = GFont.getFont(this, "Georgia", 10);

  // Create a collapsible panel
  // (this, tab title, x, y, width, height)
  pnl = new GPanel(this, "Model Controller (click to hide/show)", 0,0,width,height-16);
  pnl.setOpaque(false);
  pnl.setCollapsed(false);

  // Create a horizontal slider
  // (this, x, y, width, height)
  // default value limits 0-100 and initial value 50
  sx = new GHorzSlider(this, 10, 8, width - 20, 16);
  // set slider value limits (initial value, min, max)
  sx.setLimits(0,-180,180);
  // Set thumb inertia for nice visual effect - acceptable
  // values 1 to 100 (default = 1  i.e. no inertia)
  //sx.setInertia(6);
  sx.setBorder(1);

  sy = new GHorzSlider(this, 10, 28, width - 20, 16);
  sy.setLimits(0,-180,180);
  //sy.setInertia(6);
  sy.setBorder(1);

  sz = new GHorzSlider(this, 10, 48, width - 20, 16);
  sz.setLimits(0,-180,180);
  //sz.setInertia(6);
  sz.setBorder(1);

  mscale = new GVertSlider(this, width - 26, 68, 16, height - 98);
  mscale.setLimits((int)zoom*10,10,100);
  //mscale.setInertia(3);
  mscale.setBorder(1);

  btnResetRotScale = new GButton(this, "RESET", width - 120, 68, 90, 16);

  cbxWire = new GCheckbox(this,"Wire frame", width - 220, 68, 90);
  cbxWire.setBorder(1);
  cbxWire.setTextAlign(GAlign.CENTER);

  lblFps = new GLabel(this, "", 260, 68, 100, 16);
  lblFps.setBorder(1);

  // Add the various components to the panel; x,y coordinates are now 
  // relative to the top left of the panel open area below the tab
  pnl.add(sx);
  pnl.add(sy);
  pnl.add(sz);
  pnl.add(mscale);
  pnl.add(btnResetRotScale);
  pnl.add(cbxWire);
  pnl.add(lblFps);

  // Dynamically create option buttons for model states
  optgState = new GOptionGroup();
  if(model1 != null){ 
    MD2_ModelState[] mdlStates = model1.getModelStates();
    optStates = new GOption[mdlStates.length];
    for(int i = 0; i < mdlStates.length; i++){
      optStates[i] = new GOption(this, mdlStates[i].name, 10, 70 + i * 18, 100);
      optgState.addOption(optStates[i]);
      pnl.add(optStates[i]);
    }
    optStates[0].setSelected(true);
  }
  if(model1 != null) model1.setState(0);
  if(model2 != null) model2.setState(0);

  // Remember PGraphics3D transformation matrix
  g3 = (PGraphics3D)g;

  registerPre(this);
}

void pre(){
  interpolate = PApplet.constrain(3.1/(frameRate + 0.01), 0.001, 0.8);
  if(model1 != null) 
    model1.update(interpolate);
  if(model2 != null)
    model2.update(interpolate);

  lblFps.setText(""+frameRate + " fps ");
}

void draw() {
  pushMatrix();
  setMatrix(dmat);
  scale(zoom);
  background(200,255,200);
  if(showWire){
    stroke(64,128,64);
    strokeWeight(1);
    noFill();
  }
  else {
    noStroke();
    fill(128);
  }
  if(model1 != null) model1.render();
  if(model2 != null) model2.render();
  popMatrix();

  G4P.draw();
}

// Handles slider events for both horizontal and
// vertical sliders
void handleSliderEvents(GSlider slider){
  if(slider == sx){
    currSx = slider.getValue();
    dmat.rotateX((float)Math.toRadians(currSx - lastSx));
    lastSx = currSx;
  }
  if(slider == sy){
    currSy = slider.getValue(); 
    dmat.rotateY((float)Math.toRadians(currSy - lastSy));
    lastSy = currSy;
  }
  if(slider == sz){
    currSz = slider.getValue(); 
    dmat.rotateZ((float)Math.toRadians(currSz - lastSz));
    lastSz = currSz;
  }
  if(slider == mscale){
    zoom = mscale.getValue()/10.0f;
  }
}

void handleButtonEvents(GButton button){
  if(button == btnResetRotScale && button.eventType == GButton.CLICKED){
    lastSx = currSx = 0;
    lastSy = currSy = 0;
    lastSz = currSz = 0;
    sx.setValue(0, true);
    sy.setValue(0, true);
    sz.setValue(0, true);
    dmat = new PMatrix3D(dmatOrg);
    zoom = initZoom;
    mscale.setValue((int)zoom * 10, true);
  }
}

void handleOptionEvents(GOption selected, GOption deselected){
  for(int i = 0; i < optStates.length; i++){
    if(selected == optStates[i]){
      model1.setState(i);
      model2.setState(i);
      break;
    }
  }
}

void handleCheckboxEvents(GCheckbox cbox){
  showWire = cbox.isSelected();
}










