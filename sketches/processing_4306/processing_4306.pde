
/*
 LineAnimate
 SAPer 2009
 gsaper@gmail.com
*/

/// Global vars
int curTimer = 0;
int pointCountGlobal = 50;
int frameCountGlobal = 20;
int dtGlobal = 0;

TimeLine timeLine;
GUIController guiCtrl;

PFont mainFont;

//////////////////////////////////////////
/// classes

//////////////////////////////////////////
/// point
class SPoint
{
  int pos_x;
  int pos_y;
  
  SPoint()
  {
    pos_x = 10;
    pos_y = 10;
  }
  
  SPoint(int x, int y)
  {
    pos_x = x;
    pos_y = y;
  }

  void Draw()
  {
    ellipse(pos_x, pos_y, 11, 11);
  }
}

//////////////////////////////////////////
/// line
class SLine
{
  SPoint[] points;
  int pointCount;
  int pointCountCur;
  
  SLine(int p)
  {
    pointCount = p;
    points = new SPoint[pointCount];
    pointCountCur = 0;
  }
  
  void AddPoint(int x, int y)
  {
    if(pointCountCur < pointCount)
    {
      points[pointCountCur] = new SPoint(x, y);
      pointCountCur++;
    }
  }
  
  void Draw()
  {
    strokeWeight(5.0);
    noFill();
    beginShape();
    /// if present, draw additinal first and last points twice
    if(pointCountCur>0)
    {
      curveVertex(points[0].pos_x, points[0].pos_y);
    }
    for(int i=0; i<pointCountCur; ++i)
    {
      curveVertex(points[i].pos_x, points[i].pos_y);
    }
    if(pointCountCur>0)
    {
      curveVertex(points[pointCountCur-1].pos_x, points[pointCountCur-1].pos_y);
    }
    endShape();
  }
  
  void DrawWithPoints()
  {
    Draw();
    strokeWeight(1.0);
    for(int i=0; i<pointCountCur; ++i)
    {
      points[i].Draw();
    }
  }
}

//////////////////////////////////////////
/// frame
class Frame
{
  SLine sline;
  float frameTime;
  
  Frame(int p, float time)
  {
    sline = new SLine(p);
    frameTime = time;
  }
}

//////////////////////////////////////////
/// timeline
class TimeLine
{
  Frame[] frames;
  int maxFrames;
  int numFrame;
  
  int pointPeriod;
  int curPeriod;
  
  boolean isAnimDraw;
  int curAnimFrame;
  int firstFramePointCount;
  
  SLine animLine;
  
  TimeLine()
  {
    maxFrames = frameCountGlobal;
    numFrame = 0;
    frames = new Frame[maxFrames];
    
    pointPeriod = 80;
    curPeriod = 0;
    
    isAnimDraw = false;
    curAnimFrame = 0;
    firstFramePointCount = 0;
  }
  
  void AddFrame()
  {
    if(!isAnimDraw && numFrame < maxFrames)
    {
      frames[numFrame] = new Frame(pointCountGlobal, 2000);
      numFrame++;
      curPeriod = 0;
    }
  }
  
  void FinishFrame()
  {
    if(numFrame > 0)
    {
      if(firstFramePointCount == 0)
      {
        firstFramePointCount = frames[0].sline.pointCountCur;
      }
      else if(frames[numFrame-1].sline.pointCountCur < firstFramePointCount)
      {
        int lastIdx = frames[numFrame-1].sline.pointCountCur - 1;
        int pos_x = frames[numFrame-1].sline.points[lastIdx].pos_x;
        int pos_y = frames[numFrame-1].sline.points[lastIdx].pos_y;
        int addCount = firstFramePointCount - frames[numFrame-1].sline.pointCountCur;
        for(int i=0; i<addCount; ++i)
        {
          frames[numFrame-1].sline.AddPoint(pos_x, pos_y);
        }      
      }
    }
  }
  
  void UpdateFrame(int dt)
  {
    if(!isAnimDraw && numFrame > 0)
    {
      curPeriod += dt;
      if(curPeriod > pointPeriod && (firstFramePointCount == 0 || frames[numFrame-1].sline.pointCountCur < firstFramePointCount))
      {
        curPeriod = 0;
        frames[numFrame-1].sline.AddPoint(mouseX, mouseY);
      }
    }
  }
  
  void StartAnimate()
  {
    if(numFrame > 1)
    {
      isAnimDraw = true;
      curPeriod = 0;
      
      // create points in animLine the same count as in first frame
      int count = frames[0].sline.pointCountCur;
      animLine = new SLine(count);
      for(int i=0; i<count; ++i)
      {
        animLine.AddPoint(0, 0);
      }
    }
  }
  
  void Draw(int dt)
  {
    if(isAnimDraw)
    {
      curPeriod += dt;
      if(curPeriod > frames[curAnimFrame].frameTime)
      {
        curPeriod = 0;
        curAnimFrame++;
        if(curAnimFrame == numFrame)
        {
          curAnimFrame = 0;
        }
      }
      
      float factor = (float)curPeriod / frames[curAnimFrame].frameTime;
      int firstFrame = curAnimFrame;
      int secondFrame = firstFrame + 1;
      
      if(secondFrame == numFrame)
      {
        secondFrame = 0;
      }
      
      int count = frames[firstFrame].sline.pointCountCur;
      for(int i=0; i<count; ++i)
      {
        animLine.points[i].pos_x = Lerp(frames[firstFrame].sline.points[i].pos_x, frames[secondFrame].sline.points[i].pos_x, factor);
        animLine.points[i].pos_y = Lerp(frames[firstFrame].sline.points[i].pos_y, frames[secondFrame].sline.points[i].pos_y, factor);
      }
      
      stroke(255, 255, 255, 255);
      animLine.Draw();
    }
    else
    {
      if(numFrame > 0)
      {
        stroke(255, 255, 255, 255);
        frames[numFrame-1].sline.DrawWithPoints();
      }
      
      if(numFrame > 1)
      {
        stroke(255, 255, 255, 128);
        frames[numFrame-2].sline.DrawWithPoints();
      }
    }
  }
}

//////////////////////////////////////////
/// gui

//////////////////////////////////////////
/// base gui element

class SUIElementBase
{
  int pos_x;
  int pos_y;
  int size_x;
  int size_y;
  
  color normalColor;
  color hoverColor;
  color pressedColor;
  color borderColor;
  int colorAlpha;
  
  boolean isHover;
  boolean isMousePressed;
  boolean isEnabled;
  
  SUIElementBase()
  {
    pos_x = 0;
    pos_y = 0;
    size_x = 0;
    size_y = 0;
    
    normalColor = color(40, 40, 40);
    hoverColor = color(90, 90, 90);
    pressedColor = color(180, 180, 180);
    borderColor = color(255, 255, 255);
    colorAlpha = 255;
    
    isHover = false;
    isMousePressed = false;
    isEnabled = true;
  }
  
  void SetGeometry(int px, int py, int sx, int sy)
  {
    pos_x = px;
    pos_y = py;
    size_x = sx;
    size_y = sy;
  }
  
  void Draw()
  {
    colorAlpha = 255;
    if(!isEnabled)
    {
      colorAlpha = 90;
    }
    
    strokeWeight(1.0);
    stroke(borderColor, colorAlpha);
    if(isHover)
    {
      if(isMousePressed)
      {
        fill(pressedColor, colorAlpha);
      }
      else
      {
        fill(hoverColor, colorAlpha);
      }
    }
    else
    {
      fill(normalColor, colorAlpha);
    }

    rect(pos_x, pos_y, size_x, size_y);
  }
  
  boolean Check()
  {
    if(mouseX > pos_x && mouseX < pos_x + size_x && mouseY > pos_y && mouseY < pos_y + size_y)
    {
      return true;
    }
    
    return false;
  }
  
  void Update()
  {
    if(!isEnabled)
    {
      return;
    }
    if(Check())
    {
      OnHover();
      isHover = true;
    }
    else
    {
      isHover = false;
    }
    
    if(mouseButton == LEFT)
    {
      if(mousePressed)
      {
        if(!isMousePressed)
        {
          OnPressed();
          isMousePressed = true;
        }
      }
      else
      {
        if(isMousePressed)
        {
          OnReleased();
          isMousePressed = false;
        }
      }
    }
  }
  
  /// callbacks
  void OnHover()
  {
  }
  
  void OnPressed()
  {
  }
  
  void OnReleased()
  {
  }
}

//////////////////////////////////////////
/// base gui button
class SUIButton extends SUIElementBase
{
  color textColor;
  String label;
  boolean isUseIcon;
  
  SUIButton()
  {
    textColor = color(255, 255, 255);
    label = "";
    isUseIcon = false;
  }
  
  void SetLabel(String s)
  {
    label = s;
  }
  
  void Draw()
  {
    super.Draw();
    
    if(isUseIcon)
    {
      DrawIcon();
    }
    else
    {
      DrawText();
    }
  }
  
  void DrawText()
  {
    if(label.length() > 0)
    {
      fill(textColor);
      text(label, pos_x + (size_x - label.length()*6)/2, pos_y + size_y - 4);
    }
  }
  
  void DrawIcon()
  {
  }
  
  /// bese element callback
  void OnReleased()
  {
    if(isHover)
    {
      OnBtnPressed();
    }
  }
  
  /// btn callback
  void OnBtnPressed()
  {
  }
}

//////////////////////////////////////////
/// iconic button
class SUIButtonIcon extends SUIButton
{
  SUIButtonIcon()
  {
    isUseIcon = true;
  }
}

//////////////////////////////////////////
/// gui progress bar
class ProgressBar extends SUIElementBase
{
  float progress;
  color fillBorederColor;
  color fillColor;
  
  ProgressBar()
  {
    progress = 0;
    fillBorederColor = borderColor;
    fillColor = color(200, 200, 200, 255);
  }
  
  void SetProgress(float p)
  {
    progress = p;
  }
  
  void Update()
  {
  }
  
  void Draw()
  {
    super.Draw();
    
    if(progress > 0)
    {
      strokeWeight(1.0);
      stroke(fillBorederColor);
      fill(fillColor);
      rect(pos_x, pos_y, float(size_x) * progress, size_y);
    }
  }
}


//////////////////////////////////////////
/// custom gui classes
class ResetButton extends SUIButtonIcon
{
  void DrawIcon()
  {
    int center_x = pos_x + size_x/2;
    int center_y = pos_y + size_y/2;
    int qHalfWidth = 2;
    int qHalfHeight = 7;
    
    noStroke();
    fill(187, 55, 55, colorAlpha);
    pushMatrix();
    translate(center_x, center_y);
    rotate(-HALF_PI / 2.0);
    rect(-qHalfWidth, -qHalfHeight, qHalfWidth*2, qHalfHeight*2);
    rotate(HALF_PI);
    rect(-qHalfWidth, -qHalfHeight, qHalfWidth*2, qHalfHeight*2);
    popMatrix();
  }
  
  void OnBtnPressed()
  {
    ResetAll();
  }
}

class StartAnimateButton extends SUIButtonIcon
{
  StartAnimateButton()
  {
    isEnabled = false;
  }
  
  void DrawIcon()
  {
    int center_x = pos_x + size_x/2;
    int center_y = pos_y + size_y/2;
    
    noStroke();
    fill(55, 187, 55, colorAlpha);
    triangle(center_x - 5, center_y - 7, center_x - 5, center_y + 7, center_x + 2, center_y);
  }
  
  void OnBtnPressed()
  {
    timeLine.StartAnimate();
  }
}

class ProgressBarThin extends ProgressBar
{
  ProgressBarThin()
  {
    fillBorederColor = color(187, 55, 55);
    fillColor = color(187, 55, 55);
  }
}

//////////////////////////////////////////
/// controller for all gui elements
class GUIController
{
  ResetButton btnReset;
  StartAnimateButton btnAnimate;
  ProgressBar progressPoints;
  ProgressBarThin progressFrames;
  
  GUIController()
  {
    int margin = 12;
    int elementHeight = 20;
    
    int btnPosY = height - margin*2 - elementHeight*2;
    int btnWidth = (width - margin*3)/2;
    
    btnReset = new ResetButton();
    btnAnimate = new StartAnimateButton();
    progressPoints = new ProgressBar();
    progressFrames = new ProgressBarThin();
    
    btnReset.SetGeometry(btnWidth + margin*2, btnPosY, btnWidth, elementHeight);
    btnAnimate.SetGeometry(margin, btnPosY, btnWidth, elementHeight);
    progressPoints.SetGeometry(margin, height - margin - elementHeight, width - margin*2, elementHeight);
    progressFrames.SetGeometry(margin, height - margin/2, width - margin*2, 2);
  }
  
  void Draw()
  {
    btnReset.Draw();
    btnAnimate.Draw();
    progressPoints.Draw();
    progressFrames.Draw();
  }
  
  void Update()
  {
    btnReset.Update();
    btnAnimate.Update();
    progressPoints.Update();
    progressFrames.Update();
  }
  
  boolean Check()
  {
    if(btnReset.Check())
    {
      return true;
    }
    
    if(btnAnimate.Check())
    {
      return true;
    }
    
    if(progressPoints.Check())
    {
      return true;
    }
    
    if(progressFrames.Check())
    {
      return true;
    }
    
    return false;
  }
}


//////////////////////////////////////////
/// main functions
void setup() 
{
  mainFont = loadFont("font.vlw");
  textFont(mainFont, 16);
  
  size(600, 600);
  smooth();
  frameRate(60);
  
  timeLine = new TimeLine();
  guiCtrl = new GUIController();
}

void draw() 
{ 
  background(20);
  
  int t = millis();
  dtGlobal = t - curTimer;
  curTimer = t;
  
  timeLine.Draw(dtGlobal);
  
  guiCtrl.Update();
  guiCtrl.Draw();
}


//////////////////////////////////////////
/// utils
int Lerp(int p1, int p2, float factor)
{
  return p1 + int(float(p2 - p1) * factor);
}

void ResetAll()
{
  timeLine = new TimeLine();
  guiCtrl.progressPoints.SetProgress(0);
  guiCtrl.progressFrames.SetProgress(0);
  guiCtrl.btnAnimate.isEnabled = false;
}


//////////////////////////////////////////
/// system callbacks
void mouseDragged()
{
  if(mouseButton == LEFT && !guiCtrl.Check())
  {
    timeLine.UpdateFrame(dtGlobal);
    
    int pointsCount = timeLine.frames[timeLine.numFrame-1].sline.pointCountCur;
    guiCtrl.progressPoints.SetProgress(float(pointsCount) / pointCountGlobal);
  }
}

void mousePressed()
{
  if(mouseButton == LEFT && !guiCtrl.Check())
  {
    timeLine.AddFrame();
    guiCtrl.progressFrames.SetProgress(float(timeLine.numFrame) / frameCountGlobal);
  }
}

void mouseReleased()
{
  if(mouseButton == LEFT && !guiCtrl.Check())
  {
    timeLine.FinishFrame();
    
    if(timeLine.numFrame > 1)
    {
      guiCtrl.btnAnimate.isEnabled = true;
    }
  }
}

