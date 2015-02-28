
//
// This class simulates the movement of a bristle
// 
// Credits: Javier Graciá Carpio
// License: Creative Commons Attribution-ShareAlike (CC BY-SA)
//
public class Bristle {
  private int nPositions;
  private PVector[] positions;
  private float[] lengths;
  private float[] thicknesses;

  //
  // Constructor
  //
  public Bristle(int _nParts, float _initLength, float _deltaLength, float _initThickness, float _deltaThickness) {
    nPositions = max(2, _nParts + 1);
    positions = new PVector[nPositions];
    lengths = new float[nPositions];
    thicknesses = new float[nPositions];

    // Fill the arrays
    for (int i = 0; i < nPositions; i++) {
      positions[i] = new PVector();
      lengths[i] = max(1, _initLength - i*_deltaLength);
      thicknesses[i] = max(0.1, _initThickness - i*_deltaThickness);
    }
  }

  //
  // Sets all the bristle elements to a given position
  //
  public void init(PVector initPosition) {
    for (int i = 0; i < nPositions; i++) {
      positions[i].set(initPosition);
    }
  }

  //
  // Updates the position of the bristle elements
  //
  public void update(PVector newPosition) {
    positions[0].set(newPosition);

    for (int i = 1; i < nPositions; i++) {
      float ang = atan2(positions[i - 1].y - positions[i].y, positions[i - 1].x - positions[i].x);
      positions[i].set(positions[i - 1].x - lengths[i]*cos(ang), positions[i - 1].y - lengths[i]*sin(ang));
    }
  }

  //
  // Draws the bristle on the screen
  //
  public void paint(color col) {
    stroke(col);

    for (int i = 1; i < nPositions; i++) {
      strokeWeight(thicknesses[i]);
      line(positions[i - 1].x, positions[i - 1].y, positions[i].x, positions[i].y);
    }
  }

  //
  // Draws the bristle on the canvas
  //
  public void paintCanvas(color col, PGraphics canvas) {
    canvas.stroke(col);

    for (int i = 1; i < nPositions; i++) {
      canvas.strokeWeight(thicknesses[i]);
      canvas.line(positions[i - 1].x, positions[i - 1].y, positions[i].x, positions[i].y);
    }
  }
}


