
void drawSymmetry()
{
  clearCell();

  background(bgc);

  if (drawCellState)
    drawCell();
  else
    drawCellState = true;

  stroke(255, 0, 0, 40);

  mCell.drawD();

  if (symmetryMeshState)
    mCell.drawEdges();

  switch(symmetryMode)
  {
  case 0:
  case 1:
  case 2:
  case 3:
  case 4:
  case 5:
  case 6:
  case 7:
  case 8:
  case 9:
  case 10:
  case 11:
    for (int i = 0; i < divideNumber; i++)
      for (int j = 0; j < divideNumber; j++)
      {
        pushMatrix();
        translate(i*pieceSize, j*pieceSize);
        showCell();
        popMatrix();
      }
    break;
  case 12:  
  case 13:  
  case 14:  
  case 15:  
  case 16:
    //maskCell();  
    for (int i = 0; i < divideNumber+1; i++)
      for (int j = 0; j < divideNumber+1; j++)
      {
        pushMatrix();
        translate(-h+(-h)*(j%2)+i*pieceSize, j*cSH);
        showCell();
        popMatrix();
      }
    break;

  default:
    break;
  }

  uiMenu();
}



void drawCell()
{
  mCell.setDrawing();
  switch(toolMode)
  {
  case 0:


    RPoint L1 = new RPoint(x1, y1);
    RPoint L2 = new RPoint(x2, y2);
    L1.transform(C);    
    L2.transform(C);
    L1.print();
    mCell.LineCell(L1, L2);

    break;
  }
}
void showCell()
{
  mCell.draw();
}

void clearCell()
{
  mCell.clear();
}

void maskCell()
{
  mCell.drawing.beginDraw();
  mCell.drawing.fill(255, 0);
  mCell.drawing.noStroke();
  mCell.drawing.triangle(0, 0, h, 0, 0, cSH);
  mCell.drawing.triangle(cSW, 0, cSW, cSH, 2*h, cSH);
  mCell.drawing.endDraw();
}


