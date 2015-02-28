
Maxim maxim = new Maxim(this);

//left-side control variables

AudioPlayer a, a_, b, c, c_, d, d_, e, f, f_, g, g_;
AudioPlayer bass1, bass2, clap, crash, hh1, hh2, kick, snare1, snare2, snare3;

boolean [] ra = new boolean[12];
boolean [] ra_ = new boolean[12];
boolean [] rb = new boolean[12];
boolean [] rc = new boolean[12];
boolean [] rc_ = new boolean[12];
boolean [] rd = new boolean[12];
boolean [] rd_ = new boolean[12];
boolean [] re = new boolean[12];
boolean [] rf = new boolean[12];
boolean [] rf_ = new boolean[12];
boolean [] rg = new boolean[12];
boolean [] rg_ = new boolean[12];
boolean [][] rows = {ra, ra_, rb, rc, rc_, rd, rd_, re, rf, rf_, rg, rg_};

boolean [] r1 = new boolean[12];
boolean [] r2 = new boolean[12];
boolean [] r3 = new boolean[12];
boolean [] r4 = new boolean[12];
boolean [] r5 = new boolean[12];
boolean [] r6 = new boolean[12];
boolean [] r7 = new boolean[12];
boolean [] r8 = new boolean[12];
boolean [] r9 = new boolean[12];
boolean [] r0 = new boolean[12];
boolean [][] BRows = {r1, r2, r3, r4, r5, r6, r7, r8, r9, r0};

int buttonSize;
int startHeight;
int gridWidth;
int current;

//right-side control variables

AudioPlayer beat1, beat2, bells, ambience;
Slider filter;
Slider tempo;

PImage TV;
PImage [] recordPlayer;
boolean deck1Playing, deck2Playing, bellsPlaying, bellButtonPressed, bgPlaying, bgButtonPressed;
int tvx, tvy, deck1x, deck1y, deck2x, deck2y, controly, half_controly;
int count = 0;
float rotateDeck1 = 0;
float rotateDeck2 = 0;
float speedAdjust = 1.0;
float filter_x = 1.0;

void setup(){
  
  size(1024, 661);
  background(0);
  
  //loading left-side sound files and setting settings
  
  a = maxim.loadFile("piano-notes-octave/piano-a.wav");
  a_ = maxim.loadFile("piano-notes-octave/piano-a-sharp.wav");
  b = maxim.loadFile("piano-notes-octave/piano-b.wav");
  c = maxim.loadFile("piano-notes-octave/piano-c.wav");
  c_ = maxim.loadFile("piano-notes-octave/piano-c-sharp.wav");
  d = maxim.loadFile("piano-notes-octave/piano-d.wav");
  d_ = maxim.loadFile("piano-notes-octave/piano-d-sharp.wav");
  e = maxim.loadFile("piano-notes-octave/piano-e.wav");
  f = maxim.loadFile("piano-notes-octave/piano-f.wav");
  f_ = maxim.loadFile("piano-notes-octave/piano-f-sharp.wav");
  g = maxim.loadFile("piano-notes-octave/piano-g.wav");
  g_ = maxim.loadFile("piano-notes-octave/piano-g-sharp.wav");
  
  a.setLooping(false);
  a_.setLooping(false);
  b.setLooping(false);
  c.setLooping(false);
  c_.setLooping(false);
  d.setLooping(false);
  d_.setLooping(false);
  e.setLooping(false);
  f.setLooping(false);
  f_.setLooping(false);
  g.setLooping(false);
  g_.setLooping(false);
  
  bass1 = maxim.loadFile("beats/bass1.wav");
  bass2 = maxim.loadFile("beats/bass2.wav");
  clap = maxim.loadFile("beats/clap.wav");
  crash = maxim.loadFile("beats/crash.wav");
  hh1 = maxim.loadFile("beats/hh1.wav");
  hh2 = maxim.loadFile("beats/hh2.wav");
  kick = maxim.loadFile("beats/kick.wav");
  snare1 = maxim.loadFile("beats/snare1.wav");
  snare2 = maxim.loadFile("beats/snare2.wav");
  snare3 = maxim.loadFile("beats/snare3.wav");
  
  bass1.setLooping(false);
  bass2.setLooping(false);
  clap.setLooping(false);
  crash.setLooping(false);
  hh1.setLooping(false);
  hh2.setLooping(false);
  kick.setLooping(false);
  snare1.setLooping(false);
  snare2.setLooping(false);
  snare3.setLooping(false);
  /*
  crash.volume(1.5);
  clap.volume(1.5);
  hh2.volume(1.5);
  hh1.volume(1.5);
  kick.volume(1.5);
  snare3.volume(1.5);
  snare2.volume(1.5);
  snare1.volume(1.5);
  bass2.volume(1.5);
  bass1.volume(1.5);*/
  
  //left-side control variables
  
  //frameRate(60);
  buttonSize = 30;
  startHeight = height - buttonSize*10;
  gridWidth = buttonSize * 12;
  current = 0;
  
  //loading right-side sound files
  beat1 = maxim.loadFile("sounds/beat.wav");
  beat2 = maxim.loadFile("sounds/hip_hop.wav");
  bells = maxim.loadFile("sounds/bells.wav");
  ambience = maxim.loadFile("sounds/background.wav");
  
  //right-side control variables
  
  imageMode(CENTER);
  recordPlayer = loadImages("black-record/black-record_", ".png", 36);
  TV = loadImage("TV.png");
  
  deck1x = recordPlayer[0].width/2 + 60 + gridWidth;
  deck1y = height - recordPlayer[0].height/2 - 10;
  deck2x = deck1x + recordPlayer[0].width + 5;
  deck2y = deck1y;
  controly = height - recordPlayer[0].height - 20;
  half_controly = height - 10 - recordPlayer[0].height/2;
  
  //background filter
  filter = new Slider("filter", 1, 0, 5000, deck2x + recordPlayer[0].height/2 + 10,
                      controly + 30, 30, height - controly - 40, VERTICAL);
  
  //speed slider
  tempo = new Slider("tempo", 10, 60, 5, gridWidth + 20, controly + 20, 30,
                     height - controly - 40, VERTICAL);
  
}

void draw(){
  
  imageMode(CENTER);
  rectMode(CORNER);
  
  //background(0);
  noStroke();
  fill(0);
  rect(0, 0, gridWidth, height);
  rect(0, controly, width, height - controly);
  
  //note boxes
  stroke(255);
  strokeWeight(1);
  for (int i = 0; i < 13; i++){
    line(0, i * buttonSize, buttonSize*12, i * buttonSize);
    line(i * buttonSize, 0, i * buttonSize, height);
  }
  
  //beat boxes
  for (int i = 0; i < 11; i++){
    line(0, i * buttonSize + startHeight, buttonSize*12, i * buttonSize + startHeight);
  }
  
  //draw notes
  noStroke();
  for (int c = 0; c < rows.length; c++){
    
    fill(100, 100, 250);
    for (int r = 0; r < rows.length; r++){
      if (rows[r][c]){
        rect(c * buttonSize, r * buttonSize, buttonSize, buttonSize);
      }
    }
    
    fill(250, 100, 100);
    for (int r = 0; r < BRows.length; r++){
      if (BRows[r][c]){
        rect(c * buttonSize, r * buttonSize + startHeight, buttonSize, buttonSize);
      }
    }
    
  }
  
  //increment beat
  count++;
  if (count % (int) tempo.get() == 0){
    count = 0;
    current++;
    current %= 12;
    a.stop();
    a_.stop();
    b.stop();
    c.stop();
    c_.stop();
    d.stop();
    d_.stop();
    e.stop();
    f.stop();
    f_.stop();
    g.stop();
    g_.stop();
    
    /*bass1.stop();
    bass2.stop();
    clap.stop();
    crash.stop();
    hh1.stop();
    hh2.stop();
    kick.stop();
    snare1.stop();
    snare2.stop();
    snare3.stop();*/
    
    //play note(s)
    if (rows[10][current]){
      a.cue(0);
      a.play();
    }
    if (rows[9][current]){
      a_.cue(0);
      a_.play();
    }
    if (rows[8][current]){
      b.cue(0);
      b.play();
    }
    if (rows[7][current]){
      c.cue(0);
      c.play();
    }
    if (rows[6][current]){
      c_.cue(0);
      c_.play();
    }
    if (rows[5][current]){
      d.cue(0);
      d.play();
    }
    if (rows[4][current]){
      d_.cue(0);
      d_.play();
    }
    if (rows[3][current]){
      e.cue(0);
      e.play();
    }
    if (rows[2][current]){
      f.cue(0);
      f.play();
    }
    if (rows[1][current]){
      f_.cue(0);
      f_.play();
    }
    if (rows[0][current]){
      g.cue(0);
      g.play();
    }
    if (rows[11][current]){
      g_.cue(0);
      g_.play();
    }
    
    //play drum sound(s)
    if (BRows[9][current]){
      bass1.cue(0);
      bass1.play();
    }
    if (BRows[8][current]){
      bass2.cue(0);
      bass2.play();
    }
    if (BRows[7][current]){
      snare1.cue(0);
      snare1.play();
    }
    if (BRows[6][current]){
      snare2.cue(0);
      snare2.play();
    }
    if (BRows[5][current]){
      snare3.cue(0);
      snare3.play();
    }
    if (BRows[4][current]){
      kick.cue(0);
      kick.play();
    }
    if (BRows[3][current]){
      hh1.cue(0);
      hh1.play();
    }
    if (BRows[2][current]){
      hh2.cue(0);
      hh2.play();
    }
    if (BRows[1][current]){
      clap.cue(0);
      clap.play();
    }
    if (BRows[0][current]){
      crash.cue(0);
      crash.play();
    }
    
  }
  
  //draw pointers
  fill(200, 0, 0, 120);
  rect(current * buttonSize, 0, buttonSize, buttonSize*12);
  fill(0, 0, 200, 120);
  rect(current * buttonSize, startHeight, buttonSize, buttonSize*12);
  
  //draw DJ control area
  fill(128);
  stroke(64);
  strokeWeight(5);
  rect(gridWidth + 5, height - recordPlayer[0].height - 20, width - gridWidth - 9, recordPlayer[0].height + 17);
  image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height);
  image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);
  imageMode(CORNER);
  image(TV, gridWidth+2, 0, width - gridWidth - 4, controly);
  
  //speed controls
  if (deck1Playing || deck2Playing){
    beat1.speed(speedAdjust);
    beat2.speed(beat2.getLengthMs() / beat1.getLengthMs() * speedAdjust);
  }
  if (deck1Playing){
    rotateDeck1 += speedAdjust;
    if (rotateDeck1 >= recordPlayer.length){
      rotateDeck1 = 0;
    }
  }
  if (deck2Playing){
    rotateDeck2 += speedAdjust;
    if (rotateDeck2 >= recordPlayer.length){
      rotateDeck2 = 0;
    }
  }
  
  //draw buttons, change color depending on whether pressed
  noStroke();
  if (bellButtonPressed) {fill(250, 0, 0);} else {fill(200, 0, 0);}
  ellipse(width - 80, half_controly - 50, 60, 60);
  if (bgButtonPressed) {fill(250, 0, 0);} else {fill(200, 0, 0);}
  ellipse(width - 80, half_controly + 50, 60, 60);
  
  //draw slider widgets
  fill(255);
  strokeWeight(1);
  text("ambience", deck2x + recordPlayer[0].height/2 + 10, controly + 30);
  filter.display();
  tempo.display();
  
  //update slider widgets
  if (mousePressed){
    filter.mouseDragged();
    tempo.mouseDragged();
  }
  
  //background filter
  ambience.setFilter((float) filter.get(), filter_x);
  
}

void mousePressed(){
  
  //note controls
  
  if (mouseX < buttonSize * 12){
    
    int index = (int) Math.floor(mouseX / buttonSize);
    int pitch = (int) Math.floor(mouseY / buttonSize);
    
    if (mouseY < buttonSize * 12 && pitch < 12){
      rows[pitch][index] = !rows[pitch][index];
    }
    if (mouseY > buttonSize * 12 && pitch > 11){
      BRows[pitch-12][index] = !BRows[pitch-12][index];
    }
    
  }
  
  //buttons
  if (dist(mouseX, mouseY, width - 80, half_controly - 50) < 30){
    bellButtonPressed = true;
  }
  if (dist(mouseX, mouseY, width - 80, half_controly + 50) < 30){
    bgButtonPressed = true;
  }
  
  //slider widget update
  filter.mousePressed();
  tempo.mousePressed();
  
}

void mouseReleased(){
  
  //buttons
  if (bellButtonPressed){
    if (bellsPlaying){
      bells.stop();
      bellsPlaying = false;
    } else {
      bells.play();
      bellsPlaying = true;
    }
  }
  if (bgButtonPressed){
    if (bgPlaying){
      ambience.stop();
      bgPlaying = false;
    } else {
      ambience.play();
      bgPlaying = true;
    }
  }
  bellButtonPressed = false;
  bgButtonPressed = false;
  
  //update slider
  filter.mouseReleased();
  tempo.mouseReleased();
  
}

void mouseDragged(){
  
  //buttons
  if (dist(mouseX, mouseY, width - 80, half_controly - 50) >= 30){
    bellButtonPressed = false;
  }
  if (dist(mouseX, mouseY, width - 80, half_controly + 50) >= 30){
    bgButtonPressed = false;
  }
  
  //drawing in TV
  
  //TV borders
  int sideMargin = 55;
  int topMargin = 55;
  int bottomMargin = 74;
  
  //colors based on position
  float red = map(mouseX, gridWidth + sideMargin, width - sideMargin, 0, 255);
  float blue = map(mouseY, topMargin, controly - bottomMargin, 0, 255);
  float green = map(dist(mouseX, mouseY, width, controly - bottomMargin), 0,
                    dist(gridWidth + sideMargin, topMargin, width - sideMargin,
                    controly - bottomMargin), 0, 255);
  
  //bells speed based on y-position
  bells.speed((float) (controly - bottomMargin - mouseY)/(controly - bottomMargin - topMargin) * 2);
  
  //line transparency and weight based on speed
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 30, 1);
  lineWidth = constrain(lineWidth, 0, 30);
  
  //drawing the line (in TV only)
  if (mouseX > gridWidth + sideMargin && mouseX < width - sideMargin){
    if (mouseY > topMargin && mouseY < controly - bottomMargin){
      
      //draw line
      strokeWeight(lineWidth);
      stroke(red, green, blue);
      line(pmouseX, pmouseY, mouseX, mouseY);
      
      //set filter variable
      filter_x = (mouseX - gridWidth - sideMargin*2)/width - gridWidth - sideMargin*2;
      
      //changing transparency
      noStroke();
      fill(0, alpha);
      rectMode(CORNER);
      rect(gridWidth + sideMargin, topMargin, width - gridWidth - sideMargin*2,
           controly - bottomMargin - topMargin);
      
    }
  }
  
  //changing speed of beats
  if (mouseX > deck1x - recordPlayer[0].width/2 && mouseX < deck2x + recordPlayer[0].width/2 && mouseY > controly){
    speedAdjust = (mouseX - gridWidth - 40)/(deck2x - deck1x + recordPlayer[0].width);
  }
  
}

void mouseClicked(){
  
  //clicking the record players
  if (dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].height/2){
    deck1Playing = !deck1Playing;
  }
  if (dist(mouseX, mouseY, deck2x, deck2y) < recordPlayer[0].height/2){
    deck2Playing = !deck2Playing;
  }
  
  //playing beats
  if (deck1Playing){
    beat1.play();
  } else {
    beat1.stop();
  }
  if (deck2Playing){
    beat2.play();
  } else {
    beat2.stop();
  }
  
}


int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(float r, float g, float b)
  {
    imageTint = color(r,g,b);
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(i >= names.length)
        break;
      sliders[i].setName(names[i]);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}




