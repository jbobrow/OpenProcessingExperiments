
/**
 Visualise different sorts in action.
 
 Most of the sorting algorithms were created by me 
 based on published algorithms. If the source is known
 it is shown in the source code below.
 
 Some of the sorting implementations were based on actual
 source code created by others. In all cases the code had
 to be adapted by me for this program. The original sources
 appear in the source code below.
 
 created by Peter Lager 2014
 */
import java.awt.Font;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import g4p_controls.*;


GLabel lblSortName;
GGroup optScreen, animScreen;
GImageButton btnToBegin, btnToEnd, btnOptions;
GImageToggleButton btnPlay;
GButton btnPlotter;
GCustomSlider sdrSpeed;

PGraphics pg;

SortType sortType;
DataType dataType;
int dataSetSize;
int dataStep;


public void createAnimScreenGUI() {
  animScreen = new GGroup(this);
  lblSortName = new GLabel(this, 10, 6, 480, 30, "???");
  lblSortName.setFont(new Font("Arial", Font.BOLD, 24));
  lblSortName.setText(sortType.desc);
  int baseY = DataPlotter.HEIGHT + 40;
  btnToBegin = new GImageButton(this, 10, baseY, new String[] { 
    "to_begin1.png", "to_begin2.png"
  } 
  );
  btnPlay = new GImageToggleButton(this, 40, baseY, "play1.png", "play2.png", 2, 1);
  btnToEnd = new GImageButton(this, 70, baseY, new String[] { 
    "to_end1.png", "to_end2.png"
  } 
  );
  sdrSpeed = new GCustomSlider(this, 99, baseY, 302, 30, "bw_speed");
  sdrSpeed.setLimits(1.0f, 1.0f, 10.0f);
  btnOptions = new GImageButton(this, 400, baseY, new String[] { 
    "tool1.png", "tool2.png"
  } 
  );
  btnOptions.tagNo = 2;
}

public void handleButtonEvents(GImageButton button, GEvent event) { 
  if (button == btnOptions) {
    plot.pause(true);
    btnPlay.setState(0);
    animScreen.fadeOut(20, 1000);
    optScreen.fadeIn(500, 1000);
  } else if (button == btnToBegin) {
    plot.gotoBegin();
    btnPlay.setState(0);
  } else if (button == btnToEnd) {
    plot.gotoFinish();
    ;
    btnPlay.setState(0);
  }
}

public void handleToggleButtonEvents(GImageToggleButton button, GEvent event) {
  if (button == btnPlay) {
    // State = 0 pause 1 = play
    if (btnPlay.getState() == 0)
      plot.pause(true);
    else
      plot.pause(false);
  }
}

public void handleButtonEvents(GButton button, GEvent event) { 
  if (button == btnPlotter) {
    plot = new DataPlotter(this, sortType, dataType, dataStep);
    optScreen.fadeOut(20, 1000);
    animScreen.fadeIn(500, 1000);
  }
}

public void handleSliderEvents(GValueControl slider, GEvent event) { 
  plot.setDrag(sdrSpeed.getValueF());
}

public void handleToggleControlEvents(GToggleControl option, GEvent event) {
  int category = (option.tagNo & 0x0f000000) >> 24;
  int step = (option.tagNo & 0x00ff0000) >> 16;
  int picked = (option.tagNo & 0x0000ffff);
  switch(category) {
  case 1:
    sortType = SortType.getType(picked);
    lblSortName.setText(sortType.desc);
    break;
  case 2:
    dataType = DataType.getType(picked);
    updateGraphic();
    break;
  case 4:
    dataStep = step;
    updateGraphic();
    break;
  }
}


DataPlotter plot;

public void setup() {
  size(500, 370);
  createOptionsGUI();
  createAnimScreenGUI();
  animScreen.fadeOut(0, 1);
}

public void draw() {
  background(224, 220, 255);
  if (plot != null) {
    plot.update();
    plot.display(this, 10, 40);
  }
}

public void updateGraphic() {
  Comparable[] data = DataMaker.makeData(dataType, 240/dataStep, 0.1f * pg.height, 0.9f * pg.height);
  pg.beginDraw();
  pg.background(250);
  pg.noStroke();
  for (int i = 0; i < data.length; i++) {
    float v = ((Item)data[i]).value;
    pg.fill(220);
    pg.rect(i*dataStep, pg.height - v, dataStep, v);
    pg.fill(160);
    pg.rect(i*dataStep, pg.height - v, dataStep, dataStep);
  }
  pg.endDraw();
}

public void createOptionsGUI() {
  GPanel p = new GPanel(this, 0, 0, width, height, "_____ Sorting options ____________________________");
  p.setCollapsed(false);
  p.setCollapsible(false);
  p.setDraggable(false);
  optScreen = new GGroup(this);
  optScreen.addControl(p);
  GLabel l = new GLabel(this, 10, 20, 180, 20, "Sort Algorithm" );
  l.setTextBold(); 
  p.addControl(l);
  l = new GLabel(this, 210, 20, 280, 20, "Data set structure / size" );
  l.setTextBold(); 
  p.addControl(l);
  // Create sort types
  GToggleGroup sortGroup = new GToggleGroup();
  SortType[] stypes = SortType.values();
  GOption[] optSort = new GOption[stypes.length];
  for (int i = 0; i < stypes.length; i++) {
    optSort[i] = new GOption(this, 12, 40 + i * 20, 180, 20);
    optSort[i].setText(stypes[i].desc);
    optSort[i].tagNo = 0x01000000 + i;
    sortGroup.addControl(optSort[i]);
    p.addControl(optSort[i]);
  }
  optSort[0].setSelected(true);
  sortType = stypes[0];
  // Data structure types
  GToggleGroup dataGroup = new GToggleGroup();
  DataType[] dtypes = DataType.values();
  GOption[] optData = new GOption[dtypes.length];
  for (int i = 0; i < dtypes.length; i++) {
    optData[i] = new GOption(this, 210, 160 + i * 20, 180, 20);
    optData[i].setText(dtypes[i].desc);
    optData[i].tagNo = 0x02000000 + i;
    dataGroup.addControl(optData[i]);
    p.addControl(optData[i]);
  }
  optData[0].setSelected(true);
  dataType = dtypes[0];
  // Data structure types
  GToggleGroup sizeGroup = new GToggleGroup();
  int[] step = {
    1, 2, 3, 4, 5, 6, 8
  };
  GOption[] optDataSize = new GOption[step.length];
  for (int i = 0; i < step.length; i++) {
    optDataSize[i] = new GOption(this, 410, 160 + i * 20, 180, 20);
    optDataSize[i].setText("" + (480/step[i]));
    optDataSize[i].tagNo = 0x04000000 + 0x00010000 * step[i] + (480/step[i]);
    sizeGroup.addControl(optDataSize[i]);
    p.addControl(optDataSize[i]);
  }
  optDataSize[2].setSelected(true);
  dataSetSize = optDataSize[2].tagNo & 0xffff;
  dataStep = (optDataSize[2].tagNo & 0x00ff0000) >> 16;
  // Data set display
  pg = createGraphics(240, 116, JAVA2D);
  updateGraphic();
  GSketchPad spad = new GSketchPad(this, 212, 42, 240, 116);
  spad.setGraphic(pg);
  p.addControl(spad);
  btnPlotter = new GButton(this, p.getWidth() - 80, p.getHeight() - 30, 76, 26, "PLOTTER");
  p.addControl(btnPlotter);
}

// Basr class for all sorting algorithms
public static abstract class Sort extends Thread {

  protected final Comparable[] data;
  protected boolean finished = false;

  // Placeholder this list must be created outside of
  // this class and passed in the ctor.
  protected final List<Action> actions;

  boolean swap;
  int nPasses, nCompares, nMoves, nSwaps;
  int nDepthMax, nFCalls;
  long time;

  int depth_limit;
  int error_code;

  public Sort(Comparable[] data) {
    this(data, null);
  }

  public Sort(Comparable[] array, List<Action> actions) {
    data = new Comparable[array.length];
    System.arraycopy(array, 0, data, 0, array.length);
    this.actions = actions;
    clearStats();
  }

  public Comparable[] copyData(Comparable[] array) {
    if (array == null || array.length != data.length)
      array = new Comparable[data.length];
    System.arraycopy(data, 0, array, 0, data.length);
    return array;
  }

  public void clearStats() {
    error_code = 0;
    nPasses = nCompares = nMoves = nSwaps = 0;
    nDepthMax = nFCalls = 0;
  }

  public void run() {
    if (finished)
      return;
    logSort();
    finished = true;
  }

  // Overidden in child sorting classes
  protected abstract void logSort();

  /**
   * Returns true if it has stopped sorting. Check the error code
   * to see if it was successful
   * @return
   */
  public boolean hasStopped() {
    return finished;
  }

  /**
   * Get the error code (zero = no error)
   * @return non-zero values means the sort stopped on an error
   */
  public int getErrorCode() {
    return error_code;
  }


  public boolean hasBeenSorted() {
    for (int i = 1; i < data.length; i++)
      if (data[i].compareTo(data[i-1]) < 0) return false;
    return true;
  }

  // Exchange two elements in the array
  protected void exchange_log(Comparable[] a, int p0, int p1) {
    actions.add(new Action(ActionType.SWAP, p0, p1));
    Comparable t = a[p0];
    a[p0] = a[p1];
    a[p1] = t;
    nSwaps++;
    swap = true;
  }

  // Three alternatives to logging < comparisons
  protected boolean lt(Comparable[] d, int idx0, int idx1) {
    actions.add(new Action(ActionType.COMPARE2, idx0, idx1));
    nCompares++;
    return d[idx0].compareTo(d[idx1]) < 0;
  }

  protected boolean lt(Comparable[] d, int idx0, Comparable c0) {
    actions.add(new Action(ActionType.COMPARE1, idx0));
    nCompares++;
    return d[idx0].compareTo(c0) < 0;
  }

  protected boolean lt(Comparable[] d, Comparable c0, int idx0) {
    actions.add(new Action(ActionType.COMPARE1, idx0));
    nCompares++;
    return c0.compareTo(d[idx0]) < 0;
  }


  // Three alternatives to logging <= comparisons
  protected boolean lte(Comparable[] d, int idx0, int idx1) {
    actions.add(new Action(ActionType.COMPARE2, idx0, idx1));
    nCompares++;
    return d[idx0].compareTo(d[idx1]) <= 0;
  }

  protected boolean lte(Comparable[] d, int idx0, Comparable c0) {
    actions.add(new Action(ActionType.COMPARE1, idx0));
    nCompares++;
    return d[idx0].compareTo(c0) <= 0;
  }

  protected boolean lte(Comparable[] d, Comparable c0, int idx0) {
    actions.add(new Action(ActionType.COMPARE1, idx0));
    nCompares++;
    return c0.compareTo(d[idx0]) <= 0;
  }

  protected void exchange(Comparable[] a, int p0, int p1) {
    Comparable t = a[p0];
    a[p0] = a[p1];
    a[p1] = t;
    nSwaps++;
    swap = true;
  }

  protected int floor_lg(int a) {
    return (int)(Math.floor(Math.log(a)/Math.log(2)));
  }

  public Comparable[] getData() {
    return data;
  }

  public void waitUntilSorted() {
    while (!finished) {
      try {
        sleep(10);
      } 
      catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
  
  public class MaxDepthExceededException extends Exception {
  }
}


public static class Action {

  final ActionType type;

  final int idx0, idx1;
  final Comparable savedItem;

  public Action(ActionType type) {
    this.type = type;
    idx0 = idx1 = 0;
    savedItem = null;
  }

  public Action(ActionType type, int idx) {
    this.type = type;
    idx0 = idx1 = idx;
    savedItem = null;
  }

  public Action(ActionType type, int idx0, int idx1) {
    this.type = type;
    this.idx0 = idx0;
    this.idx1 = idx1;
    savedItem = null;
  }

  public Action(ActionType type, Comparable itemToRemember) {
    this.type = type;
    idx0 = idx1 = 0;
    savedItem = itemToRemember;
  }
}


public static class Item implements Comparable {

  float value;

  public Item(float value) {
    this.value = value;
  }

  public int compareTo(Object obj) {
    Item item = (Item) obj;
    return (value == item.value) ? 0 : (value < item.value) ? -1 : 1;
  }
}


public static class DataMaker {

  static Random rnd = new Random();

  public static Comparable[] makeData(DataType type, int size, float min, float max, Object... extra) {
    float delta = 0.2f * (max - min), low, high;
    int nu = 7;
    switch(type) {
    case NEAR_SORTED:
      if (extra != null && extra.length > 0)
        delta = Float.parseFloat(extra[0].toString());
      low = min + delta;
      high = max - delta;
      return near_sorted(size, low, high, delta);      
    case NEAR_REV_SORTED:
      if (extra != null && extra.length > 0)
        delta = Float.parseFloat(extra[0].toString());
      high = min + delta;
      low = max - delta;
      return near_sorted(size, low, high, delta);
    case SORTED:
      return near_sorted(size, min, max, 0);
    case REV_SORTED:
      return near_sorted(size, max, min, 0);
    case QUICK_KILLER:
      return median3Killer(size, max, min);
    case FEW_UNIQUE:
      if (extra != null && extra.length > 0)
        nu = Integer.parseInt(extra[0].toString());
      return few_unique(size, min, max, nu);
    case RANDOM:  
    default:
      return random(size, min, max);
    }
  }

  private static Comparable[] median3Killer(int size, float low, float high) {
    Comparable[] array = new Comparable[size];
    int k = size/2;
    float factor = (high - low) / ( 2.0f * k);
    int p = 0, n = 1;
    for (p = 0; p < k; p++) {
      array[p] = new Item(low + factor * ((n % 2) == 1 ? n : k + n - 1));
      n++;
    }
    n = 1;
    for (p = k; p < 2*k; p++) {
      array[p] = new Item(low + factor * 2 * n);
      n++;
    }  
    return array;
  }

  private static Comparable[] near_sorted(int size, float low, float high, float delta) {
    Comparable[] array = new Comparable[size];
    float delta2 = delta * 2;
    float slope = (high - low) / size;
    for (int i = 0; i < size; i++) {
      float base = low + i * slope;
      float offset = ( (float)rnd.nextFloat() - 0.5f) * delta2;
      array[i] = new Item( base + offset);
    }
    return array;
  }

  private static Comparable[] random(int size, float low, float high) {
    Comparable[] array;
    float range = high - low;
    array = new Comparable[size];
    for (int i = 0; i < size; i++) {
      array[i] = new Item( low + (float)rnd.nextFloat() * range);
    }
    return array;
  }

  private static Comparable[] few_unique(int size, float low, float high, int nbrUnique) {
    Comparable[] array;
    float range = high - low;
    float sr = range / (2 * nbrUnique - 1);
    float[] uniques = new float[nbrUnique];
    for (int i = 0; i < uniques.length; i++) {
      uniques[i] = low + i * 2 * sr + (float)rnd.nextFloat() * sr;
    }
    array = new Comparable[size];
    for (int i = 0; i < size; i++) {
      array[i] = new Item(uniques[rnd.nextInt(nbrUnique)]);
    }
    return array;
  }
}


public static class DataPlotter implements PConstants {

  public static final int WIDTH = 480;
  public static final int HEIGHT = 300; //400;
  public static final int AUX_HEIGHT = 70; //100;
  public static final float AUX_SCALE = 0.333f;

  public static final int STOPPED = 1;
  public static final int RUNNING = 2;
  public static final int PAUSED = 2;
  public static final int FINISHED = 8;

  // Colours for plotting
  private int backBg     = 0xffffffff; //0xffe0e8e0;
  private int foreBg     = 0x00ffffff;
  private int dPoint     = 0xffc000c0;
  private int dLine     = 0xffffd2ff;
  private int adPoint   = 0xff00c0c0;
  private int adLine     = 0xffd0ffff;
  private int swapPoint   = 0xffc00000;
  private int swapLine   = 0xffffa0a0;
  private int cmpPoint   = 0xff0000c0;
  private int cmpLine   = 0xffd0d0ff;
  private int rangeCol  = 0x0f000000;
  private int holdCol    = 0x1f000000;

  private PGraphics back, fore;

  private Sort sort = null;
  private Comparable[] data;
  private Comparable[] backup_data;
  private Comparable[] aux_data;

  private long timeToNextAction;
  private int playState = STOPPED;

  private long ctime, ltime, etime;
  // Action related stuff
  private Action action = null;
  private List<Action> actions = null;
  private int actionIdx = -1;
  private int range0 = -1, range1 = -1, hold0 = -1;
  private int merge0 = -1, merge1 = -1;

  private Comparable saved;

  private int dataStep = 2;

  private float drag = 1.0f;

  public void setDrag(float drag) {
    this.drag = drag;
  }

  // Set buttons
  public void setPlayState(int playState) {
    this.playState = playState;
  }

  // Restart the animation from the beginning
  public void gotoBegin() {
    System.arraycopy(backup_data, 0, data, 0, backup_data.length);
    ctime = ltime = System.currentTimeMillis();
    etime = 0;
    actionIdx = -1;
    setPlayState(STOPPED);
    range0 = range1 = hold0 = -1;
    merge0 = merge1 = -1;
    drawBack();
    clearGraphic(fore, foreBg);
    drawItems(0, data.length);
  }

  // Pause/restart sorting
  public void pause(boolean pause) {
    if (pause) {
      setPlayState(PAUSED);
      timeToNextAction += 86400000; // 1 day
      return;
    }
    if (playState != FINISHED) {
      setPlayState(RUNNING);
      timeToNextAction = 0;
    }
  }

  // Go to end of sorting
  public void gotoFinish() {
    setPlayState(FINISHED);
    range0 = range1 = hold0 = -1;
    merge0 = merge1 = -1;
    aux_data = null;
    data = sort.copyData(null);
    drawBack();
    clearGraphic(fore, foreBg);
    drawItems(0, data.length);
  }

  // Update actions
  public boolean update() {
    ctime = System.currentTimeMillis();
    etime = ctime - ltime;
    ltime = ctime;
    if (playState == RUNNING) {
      timeToNextAction -= etime;
      while (timeToNextAction <= 0) {
        actionIdx++;
        action = actions.get(actionIdx);
        performAction();
        timeToNextAction += ((long)action.type.pause * drag);
      }
      return true;
    }
    return false;
  }

  public void performAction() {
    switch(action.type) {
    case SWAP:
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      drawItem(action.idx0, swapLine, swapPoint);
      drawItem(action.idx1, swapLine, swapPoint);
      Comparable temp = data[action.idx0];
      data[action.idx0] = data[action.idx1];
      data[action.idx1] = temp;
      break;
    case COMPARE2:
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      drawItem(action.idx0, cmpLine, cmpPoint);
      drawItem(action.idx1, cmpLine, cmpPoint);
      break;
    case COMPARE1:
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      drawItem(action.idx0, cmpLine, cmpPoint);
      break;
    case MOVE:
      data[action.idx1] = data[action.idx0];
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      break;
    case SAVE:
      saved = data[action.idx0];
      hold0 = action.idx0;
      drawBack();
      break;
    case SAVE_ITEM:
      saved = action.savedItem;
      drawBack();
      break;
    case RESTORE:
      data[action.idx0] = saved;
      hold0 = -1;
      drawBack();
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      drawItem(action.idx0, swapLine, swapPoint);
      break;
    case RANGE:
      rangeCol = 0x0f000000;
      range0 = action.idx0;
      range1 = action.idx1;
      drawBack();
      break;
    case IRANGE_HEAP:
      rangeCol = 0x1fff0000;
      range0 = action.idx0;
      range1 = action.idx1;
      drawBack();
      break;
    case IRANGE_INSERT:
      rangeCol = 0x1f0000ff;
      range0 = action.idx0;
      range1 = action.idx1;
      drawBack();
      break;
    case AUX_MERGE:
      merge0 = action.idx0;
      merge1 = action.idx1;
      aux_data = Arrays.copyOfRange(data, action.idx0, action.idx1);
      drawBack();
      break;
    case AUX_COMPARE2:
      drawBack();
      drawAuxItem(merge0, action.idx0, cmpLine, cmpPoint);
      drawAuxItem(merge0, action.idx1, cmpLine, cmpPoint);
      break;
    case HOLD:
      hold0 = action.idx0;
      drawBack();
      break;
    case FINISHED:
      setPlayState(FINISHED);
      range0 = range1 = hold0 = -1;
      merge0 = merge1 = -1;
      aux_data = null;
      drawBack();
      clearGraphic(fore, foreBg);
      drawItems(0, data.length);
      break;
    default:
      System.out.println("Error - invalid action");
      break;
    }
  }

  public DataPlotter(PApplet app, SortType sortType, DataType dataType, int step) {
    super();
    dataStep = step;
    float maxV = (sortType == SortType.MERGE) ? HEIGHT - 120 : HEIGHT - 40;
    data = DataMaker.makeData(dataType, WIDTH/dataStep, 40, maxV);
    actions = new ArrayList<Action>();
    switch(sortType) {
    case SELECTION:
      sort = new Selection(data, actions);
      break;
    case INSERTION:
      sort = new Insertion(data, actions);
      break;
    case BUBBLE_SINK:
      sort = new BubbleSink(data, actions);
      break;
    case BUBBLE_FLOAT:
      sort = new BubbleFloat(data, actions);
      break;
    case SHAKER:
      sort = new Shaker(data, actions);
      break;
    case SHELL:
      sort = new Shellsort(data, actions);
      break;
    case QUICK:
      sort = new Quicksort(data, actions);
      break;
    case QUICK3:
      sort = new Quicksort3Way(data, actions);
      break;
    case MERGE:
      sort = new Merge(data, actions);
      break;      
    case COMB:
      sort = new Comb(data, actions);
      break;      
    case GNOME:
      sort = new Gnome(data, actions);
      break;      
    case INTRO:
      sort = new Introsort(data, actions);
      break;      
    case HEAP:
      sort = new Heapsort(data, actions);
      break;
    }
    backup_data = sort.copyData(null);
    sort.start();
    // Create and initialise drawing surfaces
    back = app.createGraphics(WIDTH, HEIGHT, JAVA2D);
    fore = app.createGraphics(WIDTH, HEIGHT, JAVA2D);
    initGraphics();
    drawItems(0, data.length);
  }

  private void initGraphics() {
    back.beginDraw();
    back.background(backBg);
    back.noStroke();
    back.endDraw();    
    fore.beginDraw();
    fore.background(foreBg);
    fore.noStroke();
    fore.endDraw();
  }

  public void display(PApplet app, int px, int py) {
    app.image(back, px, py);
    app.image(fore, px, py);
  }

  public void drawBack() {
    back.beginDraw();
    back.background(backBg);

    if (aux_data != null) {
      back.fill(rangeCol);
      back.rect(0, 0, WIDTH, AUX_HEIGHT);
      back.rect(merge0 * dataStep, 0, (merge1-merge0)*dataStep, HEIGHT);
      drawAuxItems(merge0);
    }
    // Draw range
    if (range1 >= 0) {
      back.fill(rangeCol);
      back.rect(range0 * dataStep, 20, (range1-range0)*dataStep, HEIGHT);
    }
    if (hold0 >= 0) {
      back.fill(holdCol);
      back.rect(hold0 * dataStep, 20, dataStep, HEIGHT);
    }
    back.endDraw();
  }

  public void clearGraphic(PGraphics pg, int col) {
    pg.beginDraw();
    pg.background(col);
    pg.endDraw();
  }

  public void drawAuxItems(int startIdx) {
    back.beginDraw();
    back.translate(startIdx * dataStep, AUX_HEIGHT);
    int gx = 0;
    float gy = 0;
    for (int i = 0; i < aux_data.length; i++) {
      gy = ((Item)aux_data[i]).value * AUX_SCALE;
      back.fill(adLine);
      back.rect(gx, -gy, dataStep, gy);
      back.fill(adPoint);
      back.rect(gx, -gy, dataStep, dataStep);
      gx += dataStep;
    }
    back.endDraw();
  }

  public void drawAuxItem(int startIdx, int idx, int line, int spot) {
    int gx = idx * dataStep;
    float gy = ((Item)aux_data[idx]).value * AUX_SCALE;
    back.beginDraw();
    back.translate(startIdx * dataStep, AUX_HEIGHT);    
    back.fill(line);
    back.rect(gx, -gy, dataStep, gy);
    back.fill(spot);
    back.rect(gx, -gy, dataStep, dataStep);
    back.endDraw();
  }

  public void drawItems(int startIdx, int upperBoundIdx) {
    fore.beginDraw();
    fore.translate(0, HEIGHT);
    int gx = startIdx * dataStep;
    float gy = 0;
    for (int i = startIdx; i < upperBoundIdx; i++) {
      gy = ((Item)data[i]).value;
      fore.fill(dLine);
      fore.rect(gx, -gy, dataStep, gy);
      fore.fill(dPoint);
      fore.rect(gx, -gy, dataStep, dataStep);
      gx += dataStep;
    }
    fore.endDraw();
  }

  public void drawItem(int idx, int line, int spot) {
    int gx = idx * dataStep;
    float gy = ((Item)data[idx]).value;
    fore.beginDraw();
    fore.translate(0, HEIGHT);    
    fore.fill(line);
    fore.rect(gx, -gy, dataStep, gy);
    fore.fill(spot);
    fore.rect(gx, -gy, dataStep, dataStep);
    fore.endDraw();
  }
}

// Sorting algorithms start here.

public static class BubbleFloat extends Sort {

  public BubbleFloat(Comparable[] data) {
    super(data);
  }

  public BubbleFloat(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    swap = true;  
    while (swap) {
      swap = false;
      for (int i = 0; i < a.length - nPasses -1; i++) {
        actions.add(new Action(ActionType.RANGE, 0, a.length - nPasses));
        if (lte(a, i+1, i))
          exchange_log(a, i, i+1);
      }
      nPasses++;
    }
  }
}


public static class BubbleSink extends Sort {

  public BubbleSink(Comparable[] data) {
    super(data);
  }

  public BubbleSink(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    swap = true;
    while (swap) {
      swap = false;
      for (int i = a.length -1; i > nPasses; i--) {
        actions.add(new Action(ActionType.RANGE, nPasses, a.length));
        if (lt(a, i, i-1))
          exchange_log(a, i, i-1);
      }
      nPasses++;
    }
  }
}


/*
The code was based on the algorithm shown at
 http://en.wikipedia.org/wiki/Comb_sort
 */
public static class Comb extends Sort {

  public Comb(Comparable[] data) {
    super(data);
  }

  public Comb(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    swap = true;
    int gap = a.length;
    float shrink = 1.3f;
    while (gap > 1 || swap) {
      nPasses++;
      gap /= shrink;
      if (gap < 1) gap = 1;
      swap = false;
      for (int i = 0; i + gap < a.length; i++) {
        if (lte(a, i+gap, i))
          exchange_log(a, i, i+gap);
      }
    }
  }
}


/*
 The code was based on the optimised algorithm at
 http://en.wikipedia.org/wiki/Gnome_sort
 */
public static class Gnome extends Sort {

  public Gnome(Comparable[] data) {
    super(data);
  }

  public Gnome(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    nPasses = 1;
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    int pos = 1, last = 0;
    while (pos < a.length) {
      if (lt(a, pos-1, pos)) {
        if (last != 0) {
          pos = last;
          last = 0;
        }
        pos++;
      } else {
        exchange_log(a, pos, pos-1);
        if (pos > 1) {
          if (last == 0)
            last = pos;
          pos--;
        } else
          pos++;
      }
    }
  }
}


/*
For additional documentation, see <a href="http://algs4.cs.princeton.edu/24pq">Section 2.4</a> of
 <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
public static class Heapsort extends Sort {

  public Heapsort(Comparable[] data) {
    super(data);
  }

  public Heapsort(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    heapsort_log(data, 0, data.length -1);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void heapsort_log(Comparable[] a, int lo, int hi) {
    int n = hi-lo + 1;
    for (int i=n/2; i>=1; i=i-1) {
      actions.add(new Action(ActionType.RANGE, i, n));
      downheap_log(a, i, n, lo);
    }
    for (int i=n; i>1; i=i-1) {
      actions.add(new Action(ActionType.RANGE, 0, i));
      exchange_log(a, lo, lo+i-1);
      downheap_log(a, 1, i-1, lo);
    }
  }

  private void downheap_log(Comparable[] a, int i, int n, int lo) {
    Comparable d = a[lo+i-1];
    nMoves++;
    actions.add(new Action(ActionType.SAVE_ITEM, a[lo+i-1]));
    int child;
    while (i <= n/2) {
      child = 2*i;
      nCompares += 2;
      if (child < n && lt(a, lo+child-1, lo+child)) child++;
      if (lt(a, lo+child-1, d)) break;
      a[lo+i-1] = a[lo+child-1];
      nMoves++;
      actions.add(new Action(ActionType.MOVE, lo+child-1, lo+i-1));
      i = child;
    }
    a[lo+i-1] = d;
    nMoves++;
    actions.add(new Action(ActionType.RESTORE, lo+i-1));
  }
}


public static class Insertion extends Sort {

  public Insertion(Comparable[] data) {
    super(data);
  }

  public Insertion(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] data) {
    // Use Selection to move the smallest value to position 0
    Comparable temp = data[0];
    int minPos = 0;
    actions.add(new Action(ActionType.RANGE, 0, data.length));
    actions.add(new Action(ActionType.HOLD, minPos));
    nPasses++;
    for (int j = 1; j < data.length; j++) {
      if (lt(data, j, temp)) {
        temp = data[j];
        minPos = j;
        nMoves++;
        actions.add(new Action(ActionType.HOLD, minPos));
      }
    }
    if (0 != minPos) 
      exchange_log(data, 0, minPos);
    // Carry on  with insertion sort
    for (int i = 2; i < data.length; i++) {
      actions.add(new Action(ActionType.RANGE, i, data.length));
      int nextIdx = i;
      temp = data[i];
      nMoves++;
      actions.add(new Action(ActionType.SAVE, i));
      while (lt (data, temp, nextIdx-1)) {
        data[nextIdx] = data[nextIdx - 1];
        actions.add(new Action(ActionType.MOVE, nextIdx-1, nextIdx));
        nextIdx--;
        nMoves++;
      }
      data[nextIdx] = temp;
      nMoves++;
      actions.add(new Action(ActionType.RESTORE, nextIdx));
    }
  }
}

/*
original Copyright Ralph Unden, 
 http://ralphunden.net/content/tutorials/a-guide-to-introsort/?q=a-guide-to-introsort
 Modifications: Bernhard Pfahringer 
 */
public static class Introsort extends Sort {

  private int size_threshold = 16;

  public Introsort(Comparable[] data) {
    super(data);
  }

  public Introsort(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    depth_limit = 2 * floor_lg(data.length);
    introsort_loop_log(data, 0, data.length, depth_limit, 0);
    actions.add(new Action(ActionType.FINISHED));
  }

  /*
   Quicksort algorithm modified for Introsort
   */
  private void introsort_loop_log (Comparable[] a, int lo, int hi, int depth_limit, int curr_depth) {
    actions.add(new Action(ActionType.RANGE, lo, hi));
    nFCalls++;
    while (hi-lo > size_threshold) {
      if (depth_limit == 0) {
        heapsort_log(a, lo, hi);
        return;
      }
      actions.add(new Action(ActionType.RANGE, lo, hi));
      nFCalls++;
      curr_depth++;
      if (nDepthMax < curr_depth) nDepthMax = curr_depth;
      depth_limit = depth_limit - 1;
      int p = partition_log(a, lo, hi, medianof3_log(a, lo, lo+((hi-lo)/2)+1, hi-1));
      introsort_loop_log(a, p, hi, depth_limit, curr_depth);
      hi=p;
    }
    insertionsort_log(a, lo, hi);
  }

  private int partition_log(Comparable[] a, int lo, int hi, Comparable x) {
    int i=lo, j=hi;
    while (true) {
      while (lt (a, i, x)) i++;
      j=j-1;
      while (lt (a, x, j)) j=j-1;
      if (!(i < j))
        return i;
      exchange_log(a, i, j);
      i++;
    }
  }

  private Comparable medianof3_log(Comparable[] a, int lo, int mid, int hi) {
    if (lt(a, mid, lo)) {
      if (lt(a, hi, mid))
        return a[mid];
      else {
        if (lt(a, hi, lo))
          return a[hi];
        else
          return a[lo];
      }
    } else {
      if (lt(a, hi, mid)) {
        if (lt(a, hi, lo))
          return a[lo];
        else
          return a[hi];
      } else
        return a[mid];
    }
  }

  /*
   Heapsort algorithm
   */
  private void heapsort_log(Comparable[] a, int lo, int hi) {
    actions.add(new Action(ActionType.IRANGE_HEAP, lo, hi));
    int n = hi-lo;
    for (int i=n/2; i>=1; i=i-1) {
      //actions.add(new Action(ActionType.IRANGE_HEAP, i, hi));
      downheap_log(a, i, n, lo);
    }
    for (int i=n; i>1; i=i-1) {
      //actions.add(new Action(ActionType.IRANGE_HEAP, lo, lo+i));
      exchange_log(a, lo, lo+i-1);
      downheap_log(a, 1, i-1, lo);
    }
  }

  private void downheap_log(Comparable[] a, int i, int n, int lo) {
    Comparable d = a[lo+i-1];
    nMoves++;
    actions.add(new Action(ActionType.SAVE_ITEM, a[lo+i-1]));
    int child;
    while (i <= n/2) {
      child = 2*i;
      nCompares += 2;
      if (child < n && lt(a, lo+child-1, lo+child)) child++;
      if (lt(a, lo+child-1, d)) break;
      a[lo+i-1] = a[lo+child-1];
      nMoves++;
      actions.add(new Action(ActionType.MOVE, lo+child-1, lo+i-1));
      i = child;
    }
    a[lo+i-1] = d;
    nMoves++;
    actions.add(new Action(ActionType.RESTORE, lo+i-1));
  }

  /*
   * Insertion sort algorithm
   */
  private void insertionsort_log(Comparable[] a, int lo, int hi) {
    actions.add(new Action(ActionType.IRANGE_INSERT, lo, hi));
    int i, j;
    Comparable t;
    for (i=lo; i < hi; i++) {
      j=i;
      t = a[i];
      actions.add(new Action(ActionType.SAVE_ITEM, a[i]));
      while (j!=lo && lt (a, t, j-1)) {
        a[j] = a[j-1];
        nMoves++;
        actions.add(new Action(ActionType.MOVE, j-1, j));
        j--;
      }
      a[j] = t;
      nMoves++;
      actions.add(new Action(ActionType.RESTORE, j));
    }
  }
}


/*
 Merge sort 
 This class was adapted from the accepted answer code here
 http://stackoverflow.com/questions/13727030/mergesort-in-java
 */
public static class Merge extends Sort {

  public Merge(Comparable[] data) {
    super(data);
  }

  public Merge(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  public long nMaxFCallsTemp, nMaxFCalls, nFCalls;

  protected void logSort() {
    actions.clear();
    clearStats();
    mergeSort_log(data, 0, data.length);
    actions.add(new Action(ActionType.FINISHED));
  }

  protected void mergeSort_log(Comparable[] a, int leftIdx, int rightIdx) {
    if (a.length > 1) {
      nFCalls++;
      nMaxFCallsTemp++;
      if (nMaxFCallsTemp > nMaxFCalls) nMaxFCalls = nMaxFCallsTemp;

      int q = a.length/2;

      Comparable[] leftData = Arrays.copyOfRange(a, 0, q);
      Comparable[] rightData = Arrays.copyOfRange(a, q, a.length);
      nMoves += a.length;

      mergeSort_log(leftData, leftIdx, leftIdx + q);
      mergeSort_log(rightData, leftIdx + q, leftIdx + a.length);

      merge_log(a, leftData, rightData, leftIdx, rightIdx);
      nMaxFCallsTemp--;
    }
  }

  protected void merge_log(Comparable[] a, Comparable[] l, Comparable[] r, int leftIdx, int rightIdx) {
    actions.add(new Action(ActionType.AUX_MERGE, leftIdx, rightIdx));
    int totElem = l.length + r.length;
    nMoves += totElem;
    int i, li, ri;
    i = li = ri = 0;
    while ( i < totElem) {
      if ((li < l.length) && (ri<r.length)) {
        if (lt(l, li, r, ri)) {
          actions.add(new Action(ActionType.SAVE_ITEM, l[li]));
          actions.add(new Action(ActionType.RESTORE, i + leftIdx));
          a[i] = l[li];
          i++;
          li++;
        } else {
          actions.add(new Action(ActionType.SAVE_ITEM, r[ri]));
          actions.add(new Action(ActionType.RESTORE, i + leftIdx));
          a[i] = r[ri];
          i++;
          ri++;
        }
      } else {
        if (li >= l.length) {
          while (ri < r.length) {
            actions.add(new Action(ActionType.SAVE_ITEM, r[ri]));
            actions.add(new Action(ActionType.RESTORE, i + leftIdx));
            a[i] = r[ri];
            i++;
            ri++;
          }
        }
        if (ri >= r.length) {
          while (li < l.length) {
            actions.add(new Action(ActionType.SAVE_ITEM, l[li]));
            actions.add(new Action(ActionType.RESTORE, i + leftIdx));
            a[i] = l[li];
            li++;
            i++;
          }
        }
      }
    }
  }

  // Less than comparison for aux data
  protected boolean lt(Comparable[] l_array, int l_idx, Comparable[] r_array, int r_idx) {
    actions.add(new Action(ActionType.AUX_COMPARE2, l_idx, l_array.length + r_idx));
    nCompares++;
    return l_array[l_idx].compareTo(r_array[r_idx]) < 0;
  }
}


public static class Quicksort extends Sort {

  public Quicksort(Comparable[] data) {
    super(data);
  }

  public Quicksort(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    depth_limit = 6 * floor_lg(data.length);
    try {
      quick_sort_log(data, 0, data.length - 1, -1);
    } 
    catch (MaxDepthExceededException e) {
      System.out.println("Maximum depth limit exceeded");  
      error_code = -1;
    }
    actions.add(new Action(ActionType.FINISHED));
  }

  // Logging versions
  private void quick_sort_log(Comparable[] a, int first, int last, int curr_depth) throws MaxDepthExceededException {
    nFCalls++;
    if (curr_depth++ > depth_limit ) throw new MaxDepthExceededException();
    if (nDepthMax < curr_depth) nDepthMax = curr_depth;
    curr_depth++;
    if (nDepthMax < curr_depth) nDepthMax = curr_depth;
    actions.add(new Action(ActionType.RANGE, first, last));
    if (last > first) {
      int bound = partition_log(a, first, last);
      quick_sort_log(a, first, bound - 1, curr_depth);
      quick_sort_log(a, bound + 1, last, curr_depth);
      actions.add(new Action(ActionType.RANGE, first, last));
    }
  } 

  private int partition_log(Comparable[] a, int first, int last) {
    int i = first - 1;
    int j = last;
    int centre = (first + last)/2;

    if (lte(a, last, first))
      exchange_log(a, first, last);

    if (lte(a, centre, last))
      exchange_log(a, last, centre);

    if (lte(a, last, first))
      exchange_log(a, first, last);

    // Remember pivot item
    Comparable pivotItem = a[last];
    actions.add(new Action(ActionType.HOLD, last));
    while (true) {
      while (lt (a, ++i, pivotItem));
      while (lt (a, pivotItem, --j)) { 
        if (j == first) break;
      }
      if (i < j) 
        exchange_log(a, i, j);
      else
        break;
    }
    // Move pivot value back to its correct position
    exchange_log(a, i, last);
    actions.add(new Action(ActionType.HOLD, -1));
    // Return bound to be used for next recursive call
    return i;
  }
}


/*
For additional documentation, see <a href="http://algs4.cs.princeton.edu/21elementary">Section 2.1</a> of
 <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
public static class Quicksort3Way extends Sort {

  public Quicksort3Way(Comparable[] data) {
    super(data);
  }

  public Quicksort3Way(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    depth_limit = 4 * floor_lg(data.length);
    try {
      qsort_log(data, 0, data.length-1, -1);
    } 
    catch (MaxDepthExceededException e) {
      System.out.println("Maximum depth limit exceeded");  
      error_code = -1;
    }
    actions.add(new Action(ActionType.FINISHED));
  }

  private void qsort_log(Comparable[] a, int first, int last, int curr_depth) throws MaxDepthExceededException { 
    nFCalls++;
    if (curr_depth++ > depth_limit ) throw new MaxDepthExceededException();
    if (nDepthMax < curr_depth) nDepthMax = curr_depth;
    if (last > first) {
      actions.add(new Action(ActionType.RANGE, first, last + 1));
      int lt = first, gt = last;
      Comparable v = a[first];
      int i = first;
      while (i <= gt) {
        nCompares++;
        actions.add(new Action(ActionType.COMPARE2, i, first));
        int cmp = a[i].compareTo(v);
        if (cmp < 0)
          exchange_log(a, lt++, i++);
        else if (cmp > 0)
          exchange_log(a, i, gt--);
        else 
          i++;
      }
      qsort_log(a, first, lt-1, curr_depth);
      qsort_log(a, gt+1, last, curr_depth);
    }
  }
}


public static class Selection extends Sort {

  public Selection(Comparable[] data) {
    super(data);
  }

  public Selection(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    int i, j, minPos;
    for (i = 0; i < a.length; i++) {
      nPasses++;
      minPos = i;
      actions.add(new Action(ActionType.RANGE, nPasses, a.length));
      actions.add(new Action(ActionType.HOLD, minPos, minPos));
      for (j = i + 1; j < a.length; j++) {
        if (lt(a, j, minPos)) {
          minPos = j;
          actions.add(new Action(ActionType.HOLD, minPos));
        }
      }
      if (i != minPos)
        exchange_log(a, i, minPos);
    }
  }
}


public static class Shaker extends Sort {

  public Shaker(Comparable[] data) {
    super(data);
  }

  public Shaker(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    swap = true;
    int lower = 0;
    int upper = a.length - 1;

    while (swap) {
      swap = false;
      nPasses++;
      actions.add(new Action(ActionType.RANGE, lower, upper+1));
      for (int i = lower; i < upper; i++) { //Check from bottom
        if (lte(a, i+1, i)) {
          exchange_log(a, i, i+1);
        }
      }
      // If we haven't made a swap then we could break here
      // but IS more efficient to let it run through a final pass
      upper--;  
      actions.add(new Action(ActionType.RANGE, lower, upper+1));
      nPasses++;
      for (int i = upper; i > lower; i--) { //Check from top
        if (lt(a, i, i-1))
          exchange_log(a, i, i-1);
      }
      lower++;
    }
  }
}

/*
 <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 */
public static class Shellsort extends Sort {

  public Shellsort(Comparable[] data) {
    super(data);
  }

  public Shellsort(Comparable[] data, List<Action> actions) {
    super(data, actions);
  }

  protected void logSort() {
    actions.clear();
    clearStats();
    sort_log(data);
    actions.add(new Action(ActionType.FINISHED));
  }

  private void sort_log(Comparable[] a) {
    int h;
    Comparable temp;

    for (h = 1; h <= a.length - 1; h = 3 * h + 1);

    for (; h > 0; h /= 3) {
      for (int i = h; i < a.length; i++) {
        nPasses++;
        int j = i;
        temp = a[i];
        nMoves++;
        actions.add(new Action(ActionType.SAVE, i));
        while (j >= h && lt ( a, temp, j-h)) {
          actions.add(new Action(ActionType.MOVE, j-h, j));
          a[j] = a[j-h];
          j -= h;
          nMoves++;
        }
        actions.add(new Action(ActionType.RESTORE, j));
        a[j] = temp;
        nMoves++;
      }
    }
  }
}


