
ArrayList<Brush>brushes;
float brushWidth = 30;
float brushEditorCenterX = 700;
float brushEditorCenterY = 100;

void setup()
{
  size(800,600);
  background(235);
  brushes = new ArrayList<Brush>();
  /*brushes.add(new Brush(mouseX, mouseY, 0, 0));
  brushes.add(new Brush(mouseX, mouseY, 10, 10));
  brushes.add(new Brush(mouseX, mouseY, 20, 20));
  brushes.add(new Brush(mouseX, mouseY, 30, 30));*/
  
  drawSidebar();
  
  //preset brush
  fill(0);
  ellipse(brushEditorCenterX, brushEditorCenterY, 5, 5);
  addBrushPoint(brushEditorCenterX, brushEditorCenterY);
  
  ellipse(brushEditorCenterX + 25, brushEditorCenterY + 25, 5, 5);
  addBrushPoint(brushEditorCenterX+25, brushEditorCenterY+25);
  
  ellipse(brushEditorCenterX + 50, brushEditorCenterY + 50, 5, 5);
  addBrushPoint(brushEditorCenterX+50, brushEditorCenterY+50);
  
  ellipse(brushEditorCenterX + 75, brushEditorCenterY + 75, 5, 5);
  addBrushPoint(brushEditorCenterX+75, brushEditorCenterY+75);
  
}

void addBrushPoint(float xPos, float yPos)
{
  float dx = xPos - brushEditorCenterX;
  float dy = yPos - brushEditorCenterY;
  float xBuffer = map(dx, -90, 90, -brushWidth, brushWidth);
  float yBuffer = map(dy, -90, 90, -brushWidth, brushWidth);
  brushes.add(new Brush(mouseX, mouseY, xBuffer, yBuffer));
}

void drawSidebar()
{
  strokeWeight(1);
  
  //sidebar panel
  line(600,0,600,height);
  fill(200);
  rect(600,0,200,height);
  
  //brush editor
  fill(255);
  rect(610,10,180,180);
  fill(100);
  textSize(12);
  text("brush editor, click to add", 615, 25);
  
  //reset brush button
  fill(255);
  rect(610, 200, 180, 30);
  fill(0);
  textSize(18);
  text("reset brush", 655, 220);
  
  //reset drawing button
  fill(255);
  rect(610, 560, 180, 30);
  fill(0);
  textSize(18);
  text("reset canvas", 650, 580);
  
}


void mousePressed()
{
  if( mouseX > 610 && mouseX < 790 && mouseY > 10 && mouseY < 190) //mouse on brush-editor --> edit
  {
    println("mouse on brush editor");
    fill(0);
    ellipse(mouseX, mouseY, 5, 5);
    addBrushPoint(mouseX, mouseY);
  
  } else if( mouseX > 610 && mouseX < 790 && mouseY > 200 && mouseY < 230) //mouse on reset brush --> reset brush
  {
    println("mouse on reset brush");
    drawSidebar();
    resetBrush();
  
  } else if( mouseX > 610 && mouseX < 790 && mouseY > 560 && mouseY < 590) //mouse on reset canvas --> reset canvas
  {
    println("mouse on reset canvas");
    resetCanvas();
  }

}

void resetBrush()
{
  brushes = new ArrayList<Brush>();
}

void draw()
{
  if(mousePressed){
    if(mouseX+brushWidth < 600) //mouse on canvas --> draw
    {
      for(int i = 0; i < brushes.size(); i++)
      {
        brushes.get(i).update(mouseX, mouseY);
      }
    }/* else if( mouseX > 610 && mouseX < 790 && mouseY > 10 && mouseY < 190) //mouse on brush-editor --> edit
    {
      println("mouse on brush editor");
    }*/
    
  } else
  {
    for(int i = 0; i < brushes.size(); i++)
    {
      brushes.get(i).setCurrentlyDrawing(false);
    }
  }
  
}

/*void keyPressed()
{
  //println(keyCode);
  switch(key)
  {
    case 'r':
    case 'R':
      println("reset");
      background(225);
      break;
    //case 'p':
      //println("pause");
      //break;
    default:
      break;
  }
}*/

void resetCanvas()
{
  println("reset");
  fill(235);
  strokeWeight(0);
  rect(0,0,600,600);
}

class Brush
{
  float x;
  float y;
  float prevX;
  float prevY;
  float xBuffer;
  float yBuffer;
  Boolean currentlyDrawing;
  
  Brush(float followXPos, float followYPos, float xBuffer, float yBuffer)
  {
    x = followXPos + xBuffer;
    y = followYPos + yBuffer;
    this.xBuffer = xBuffer;
    this.yBuffer = yBuffer;
    currentlyDrawing = false;
  }
  
  void update(float followXPos, float followYPos)
  {
    if(currentlyDrawing == false){
      currentlyDrawing = true;
      prevX = followXPos + xBuffer;
      prevY = followYPos + yBuffer;
      x = prevX;
      y = prevY;
      println("start drawing");
    } else
    {
      prevX = x;
      prevY = y;
    
      float dx = (followXPos + xBuffer) - x;
      float dy = (followYPos + yBuffer) - y;
    
      x = prevX + dx;
      y = prevY + dy;
    
      float dist = sqrt(dx*dx + dy*dy);
    
      strokeWeight( pow(dist, 0.1) );
    
      line(prevX,prevY,x,y);
    }
  }
  
  void setCurrentlyDrawing(Boolean value)
  {
    currentlyDrawing = value;
  }
}


