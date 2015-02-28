
/**
The sketch has two parts the top half displays the selected graph while
the bottom half allows the user to setup the parameters for the 
next plot. When you hit the PLOt button it will attempt to use the values
supplied to draw the graph, if there are syntax or evaluation errors
in the equations entered these will be highlighted. Only when the 
equations have been successfully evaluated will the graph be updated. <br>


This example requires the following libraries <br>
QScript <br>
Graphica <a href="https://github.com/jagracar/grafica">GitHub</a>
G4P <br>
The GUI was created with the GUI Builder tool (G4PTool)<br>
*/
import org.qscript.eventsonfire.*;
import org.qscript.events.*;
import org.qscript.editor.*;
import org.qscript.*;
import org.qscript.operator.*;
import org.qscript.errors.*;

import grafica.*;

import g4p_controls.*;

import java.awt.Color;

final int CARTESIAN = 0;
final int PARAMETRIC = 1;
final int POLAR = 3;
int type;

GPlot plot;
float gcx, gcy, gcw;
float zf = 1.1, czf = 1.0;


public void setup() {
  size(600, 620, JAVA2D);
  createGUI();
  customGUI();
  // Create plot
  plot = getPlot();
  float[] idim = plot.getDim();
  float[] mar = plot.getMar();
  gcx = idim[0]/2 + mar[1];
  gcy = idim[1]/2 + mar[2];
  gcw = idim[0];

  setType(POLAR);
  plotPolar();
}

public GPlot getPlot() {
  GPlot plot = new GPlot(this);
  plot.setPos(0, 0);
  plot.setBgColor(color(249, 199, 149));
  plot.setMar(new float[] {
    60, 60, 80, 20
  }
  );
  plot.setDim(390, 260);
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("y axis");
  plot.setLineColor(0xffff0000);
  plot.activatePanning();

  return plot;
}


public void draw() {
  //background(251, 226, 199);
  background(249, 199, 149);
  plot.beginDraw();
  plot.drawBackground();
  plot.drawBox();
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawGridLines(GPlot.BOTH);  
  plot.drawLines();
  plot.endDraw();
}

public void setType(int ptype) {
  type = ptype;
  pnlCart.setVisible(false);
  pnlPara.setVisible(false);
  pnlPolar.setVisible(false);
  switch(type) {
  case CARTESIAN:
    pnlCart.setVisible(true);
    break;
  case PARAMETRIC:
    pnlPara.setVisible(true);
    break;
  case POLAR:
    pnlPolar.setVisible(true);
    break;
  }
}



// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  pnlCart.moveTo(0, height - pnlCart.getHeight());
  pnlPolar.moveTo(0, height - pnlPolar.getHeight());
  pnlPara.moveTo(0, height - pnlPara.getHeight());

  txfPolarExpr.setText("(sin($a) * sqrt(abs(cos($a))))/(sin($a) + 1.4) - 2*sin($a) + 2");
  sdrPolarHigh.setValue(2);
  
}


