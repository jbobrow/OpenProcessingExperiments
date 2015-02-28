
// KEYS:
// + :                      add new anchor at mouse position
// DELETE/BACKSPACE :       delete selected anchor
// q/a :                    increase/decrease exponent for matrix direction weighting
// w/s :                    increase/decrease exponent for matrix distance weighting
// e/d :                    increase/decrease exponent for point weighting
//
// MOUSE:
// click or drag:           drag anchor origin or target



StrechTransform myTransform = new StrechTransform();


float tileSize = 20;
float margin = 100;

color anchorColor = color(0, 150, 0);
color anchorHiColor = color(200, 100, 0);

int anchorNum = -1;
boolean dragOrigin = false;
boolean dragTarget = false;



void setup() {
  size(700, 700);
  smooth();

  myTransform.addAnchor(new PVector(margin, margin));
  myTransform.addAnchor(new PVector(width-margin, margin));
  myTransform.addAnchor(new PVector(width-margin, height-margin));
  myTransform.addAnchor(new PVector(margin, height-margin));
  myTransform.addAnchor(new PVector(300, 300), new PVector(350, 330));
  myTransform.addAnchor(new PVector(400, 400), new PVector(350, 370));
}



void draw() {

  strokeWeight(0.5);
  background(255);

  if (anchorNum >= 0) {
    if (dragOrigin) {
      myTransform.setAnchorOrigin(anchorNum, mouseX, mouseY);
    }
    if (dragTarget) {
      myTransform.setAnchorTarget(anchorNum, mouseX, mouseY);
    }
  }


  // horizontal lines
  for (float y = margin; y <= height-margin; y+=tileSize) {
    for (float x = margin; x < width-margin; x+=tileSize) {
      PVector p1 = myTransform.transform(x, y);
      PVector p2 = myTransform.transform(x+tileSize, y);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
  // vertical lines
  for (float y = margin; y < height-margin; y+=tileSize) {
    for (float x = margin; x <= width-margin; x+=tileSize) {
      PVector p1 = myTransform.transform(x, y);
      PVector p2 = myTransform.transform(x, y+tileSize);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }


  pushStyle();
  for (int i = 0; i < myTransform.getAnchorCount(); i++) {
    stroke(anchorColor);
    if (i == anchorNum) stroke(anchorHiColor);

    PVector anchorOrig = myTransform.getAnchorOrigin(i);
    PVector anchorDest = myTransform.getAnchorTarget(i);
    line(anchorOrig.x, anchorOrig.y, anchorDest.x, anchorDest.y);
  }

  strokeWeight(1);
  fill(255);
  for (int i = 0; i < myTransform.getAnchorCount(); i++) {
    stroke(anchorColor);
    if (i == anchorNum) stroke(anchorHiColor);

    PVector anchorOrig = myTransform.getAnchorOrigin(i);
    ellipse(anchorOrig.x, anchorOrig.y, 13, 13);
  }

  noStroke();
  for (int i = 0; i < myTransform.getAnchorCount(); i++) {
    fill(anchorColor);
    if (i == anchorNum) fill(anchorHiColor);

    PVector anchorDest = myTransform.getAnchorTarget(i);
    ellipse(anchorDest.x, anchorDest.y, 7, 7);
  }
  popStyle();

}


void mousePressed() {
  dragOrigin = false;
  dragTarget = false;
  anchorNum = -1;

  int io = myTransform.getAnchorByOriginPos(new PVector(mouseX, mouseY), 10);
  int it = myTransform.getAnchorByTargetPos(new PVector(mouseX, mouseY), 10);
  if (it >= 0) {
    anchorNum = it;
    dragTarget = true;
  } 
  else if (io >= 0) {
    anchorNum = io;
    dragOrigin = true;
  }
}

void mouseReleased() {
  dragOrigin = false;
  dragTarget = false;
}



void keyReleased() {


  if (key == '+') {
    myTransform.addAnchor(new PVector(mouseX, mouseY));
    anchorNum = myTransform.getAnchorCount() - 1;
  }

  if (keyCode == DELETE || keyCode == BACKSPACE) {
    if (anchorNum >= 0) {
      myTransform.removeAnchor(anchorNum);
      anchorNum = -1;
    }
  }


  if (key == ' ') {
    int mode = myTransform.getWeightingMode();
    if (mode == StrechTransform.SIMPLE) {
      myTransform.setWeightingMode(StrechTransform.DIRECTIONAL);
      println("weightingMode = DIRECTIONAL");
    } 
    else {
      myTransform.setWeightingMode(StrechTransform.SIMPLE);
      println("weightingMode = SIMPLE");
    }
  }

  if (key == 'q' || key == 'Q') {
    myTransform.setWeightingExponent3(myTransform.getWeightingExponent3() + 0.5);
    println("exponent3 = " + myTransform.getWeightingExponent3());
  }
  if (key == 'a' || key == 'A') {
    myTransform.setWeightingExponent3(myTransform.getWeightingExponent3() - 0.5);
    println("exponent3 = " + myTransform.getWeightingExponent3());
  }
  if (key == 'w' || key == 'W') {
    myTransform.setWeightingExponent1(myTransform.getWeightingExponent1() + 0.5);
    println("exponent1 = " + myTransform.getWeightingExponent1());
  }
  if (key == 's' || key == 'S') {
    myTransform.setWeightingExponent1(myTransform.getWeightingExponent1() - 0.5);
    println("exponent1 = " + myTransform.getWeightingExponent1());
  }
  if (key == 'e' || key == 'E') {
    myTransform.setWeightingExponent2(myTransform.getWeightingExponent2() + 0.5);
    println("exponent2 = " + myTransform.getWeightingExponent2());
  }
  if (key == 'd' || key == 'D') {
    myTransform.setWeightingExponent2(myTransform.getWeightingExponent2() - 0.5);
    println("exponent2 = " + myTransform.getWeightingExponent2());
  }
}




// helping function that calculates the difference of two angles
float angleDifference(float theAngle1, float theAngle2) {
  float a1 = (theAngle1 % TWO_PI + TWO_PI)
    % TWO_PI;
  float a2 = (theAngle2 % TWO_PI + TWO_PI)
    % TWO_PI;

  if (a2 > a1) {
    float d1 = a2 - a1;
    float d2 = a1 + TWO_PI - a2;
    if (d1 <= d2) {
      return -d1;
    } 
    else {
      return d2;
    }
  } 
  else {
    float d1 = a1 - a2;
    float d2 = a2 + TWO_PI - a1;
    if (d1 <= d2) {
      return d1;
    } 
    else {
      return -d2;
    }
  }
}

// calculates the weighted average from a list of angles
float angleAverage(ArrayList<Float> angles, ArrayList<Float> weights) {
  PVector res = new PVector();

  for (int i = 0; i < angles.size(); i++) {
    PVector v = new PVector(cos(angles.get(i)), 
    sin(angles.get(i)));
    v.mult(weights.get(i));

    res.add(v);
  }

  return atan2(res.y, res.x);
}

// calculates the weighted average from a list of angles
float angleAverage(ArrayList<Float> angles, float[] weights) {
  PVector res = new PVector();

  for (int i = 0; i < angles.size(); i++) {
    PVector v = new PVector(cos(angles.get(i)), 
    sin(angles.get(i)));
    v.mult(weights[i]);

    res.add(v);
  }

  return atan2(res.y, res.x);
}




/*
 * Hartmut Bohnacker, http://hartmut-bohnacker.de/ 
 * Copyright (c) 2012
 * 
 * This sourcecode is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 * 
 * This sourcecode is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */


public class Anchor {

  PVector originPosition;
  PVector targetPosition;

  PMatrix2D transformMatrix = new PMatrix2D();

  ArrayList<DirectionalMatrix> directionalMatrices = new ArrayList<DirectionalMatrix>();

  Anchor(float x, float y) {
    originPosition = new PVector(x, y);
    targetPosition = new PVector(x, y);
  }

  Anchor(PVector p) {
    originPosition = p.get();
    targetPosition = p.get();
  }

  Anchor(float xOrigin, float yOrigin, float xTarget, float yTarget) {
    originPosition = new PVector(xOrigin, yOrigin);
    targetPosition = new PVector(xTarget, yTarget);
  }

  Anchor(PVector pOrigin, PVector pTarget) {
    originPosition = pOrigin.get();
    targetPosition = pTarget.get();
  }

  PVector getOriginPosition() {
    return originPosition.get();
  }

  void setOriginPosition(float x, float y) {
    originPosition.x = x;
    originPosition.y = y;
  }

  void setOriginPosition(PVector p) {
    originPosition = p;
  }

  PVector getTargetPosition() {
    return targetPosition.get();
  }

  void setTargetPosition(float x, float y) {
    targetPosition.x = x;
    targetPosition.y = y;
  }

  void setTargetPosition(PVector p) {
    targetPosition = p;
  }

  PMatrix2D getTransformMatrix() {
    return transformMatrix.get();
  }

  void setTransformMatrix(PMatrix2D matrix) {
    transformMatrix = matrix;
  }

  void updateDirectionalMatrices(ArrayList<Anchor> anchors) {
    directionalMatrices = new ArrayList<DirectionalMatrix>();

    for (int i = 0; i < anchors.size(); i++) {
      Anchor otherAnchor = anchors.get(i);
      PMatrix2D matrix = new PMatrix2D();
      PVector matrixDirection = new PVector();

      if (otherAnchor != this) {
        PVector originI = this.getOriginPosition();
        PVector originJ = otherAnchor.getOriginPosition();
        PVector targetI = this.getTargetPosition();
        PVector targetJ = otherAnchor.getTargetPosition();

        // translation
        matrix.translate(targetPosition.x - originPosition.x, 
        targetPosition.y - originPosition.y);

        // rotation
        float w1 = atan2(originJ.y - originI.y, originJ.x
          - originI.x);
        float w2 = atan2(targetJ.y - targetI.y, targetJ.x
          - targetI.x);
        float w = angleDifference(w2, w1);

        matrix.rotate(w);

        // scaling
        float d1 = PVector.dist(originJ, originI);
        float d2 = PVector.dist(targetJ, targetI);
        float s = d2 / d1;

        if (d1 == 0 && d2 == 0)
          s = 1;
        else if (d1 == 0)
          s = 10;

        matrix.scale(s);

        // direction for this directionalMatrix
        matrixDirection = originJ.get();
        matrixDirection.sub(originI);
        matrixDirection.normalize();

        directionalMatrices.add(new DirectionalMatrix(matrix, 
        matrixDirection));
      } 
      else {
        directionalMatrices.add(null);
      }
    }
  }

  PVector applyCumulatedMatrix(PVector aToP, float exponent, 
  float[] distweights) {
    PVector aToPResult = new PVector();

    PVector aToPNorm = aToP.get();
    aToPNorm.normalize();

    float[] weights = new float[directionalMatrices.size()];
    float sum = 0;

    for (int i = 0; i < directionalMatrices.size(); i++) {
      if (directionalMatrices.get(i) != null) {
        float w = 1;

        // weight depending on direction from anchor to point
        if (directionalMatrices.get(i).matrixDirection.mag() > 0
          & aToPNorm.mag() > 0) {
          w = directionalMatrices.get(i).matrixDirection
            .dot(aToPNorm) + 1;
          if (w < 0)
            w = 0;
          w = pow(w, exponent);
        }

        // weight depending on distance
        w *= distweights[i];
        // w *= (0.5 + 0.5 * distweights[i]);

        weights[i] = w;
        sum += weights[i];
      }
    }

    for (int i = 0; i < directionalMatrices.size(); i++) {
      if (directionalMatrices.get(i) != null) {
        PMatrix2D matrix = directionalMatrices.get(i).matrix;

        weights[i] = weights[i] / sum;

        PVector aToPTrans = new PVector();
        matrix.mult(aToP, aToPTrans);

        // offset between the delta vector and the transformed delta
        // vector
        PVector dvecOffset = PVector.sub(aToPTrans, aToP);

        // multiply this offset by the weight of this anchor
        dvecOffset.mult(weights[i]);

        // add up all offset
        aToPResult.add(dvecOffset);
      }
    }

    return aToPResult;
  }

  /*
   * float[] calcWeights(PVector p, ArrayList<Anchor> anchors, int mode) {
      * 
      * // calculate distances between point and all original anchors float[]
      * dists = new float[anchors.size()]; int n = dists.length;
      * 
      * int k = -1; float minDist = 10000000;
      * 
      * for (int i = 0; i < n; i++) { PVector otherPoint; if (mode ==
      * MultiTransform.ORIGINS) { otherPoint =
      * anchors.get(i).getOriginPosition(); } else { otherPoint =
      * anchors.get(i).getTargetPosition(); }
      * 
      * dists[i] = PVector.dist(p, otherPoint); if (dists[i] < minDist && i !=
      * excludeIndex) { minDist = dists[i]; k = i; } }
      * 
      * // calc attraction weights (sum of all weights must be 1) float[] weights
      * = new float[n];
      * 
      * if (minDist == 0) { weights[k] = 1; } else { float[] distfacs = new
      * float[n]; float sum = 0;
      * 
      * for (int i = 0; i < n; i++) { if (i != excludeIndex) { distfacs[i] = 1f /
      * (pow(dists[i], 1)); sum += distfacs[i]; } }
      * 
      * for (int i = 0; i < n; i++) { weights[i] = distfacs[i] / sum; } }
      * 
      * return weights; }
      */
}




public class DirectionalMatrix {
  PMatrix2D matrix = new PMatrix2D();
  PVector matrixDirection = new PVector();

  DirectionalMatrix(PMatrix2D mat, PVector dir) {
    matrix = mat.get();
    matrixDirection = dir.get();
  }
}


/*
 * Hartmut Bohnacker, http://hartmut-bohnacker.de/ 
 * Copyright (c) 2012
 * 
 * This sourcecode is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 * 
 * This sourcecode is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */



/**
 * Transform a 2-dimensional plane in the following way: define an arbitrary
 * number of points (called anchors) with an origin and target position. 
 */
public class StrechTransform {

  // Exponent of the weighting function for how the relations from one anchor
  // to all others are cumulated. The closer the other anchor lies, the
  // stronger it is weighted.
  float weightingExponent1 = 1;
  // Exponent of the weighting function when applying all anchor matrices to a
  // point.
  float weightingExponent2 = 2;
  // Exponent of the weighting function that reflects if the direction from
  // anchor to point and from one anchor to another is quite similar.
  float weightingExponent3 = 1;

  ArrayList<Anchor> anchors = new ArrayList<Anchor>();

  boolean matricesUpToDate = false;

  final static int ORIGINS = 0;
  final static int TARGETS = 1;

  // Constants for weightingMode
  public final static int SIMPLE = 0;
  public final static int DIRECTIONAL = 1;

  int weightingMode = SIMPLE;

  /**
      * Create a new MultiTransform.
      */
  public StrechTransform() {
  }

  /**
      * Adds a new Anchor.
      * 
      * @param x
      *            X coordinate for origin and target position
      * @param y
      *            Y coordinate for origin and target position
      */
  public void addAnchor(float x, float y) {
    anchors.add(new Anchor(x, y));
    matricesUpToDate = false;
  }

  /**
      * Adds a new Anchor.
      * 
      * @param p
      *            will be used for origin and target position
      */
  public void addAnchor(PVector p) {
    anchors.add(new Anchor(p));
    matricesUpToDate = false;
  }

  /**
      * Adds a new Anchor.
      * 
      * @param xOrigin
      *            X coordinate for origin position
      * @param yOrigin
      *            Y coordinate for origin position
      * @param xTarget
      *            X coordinate for target position
      * @param yTarget
      *            Y coordinate for target position
      */
  public void addAnchor(float xOrigin, float yOrigin, float xTarget, 
  float yTarget) {
    anchors.add(new Anchor(xOrigin, yOrigin, xTarget, yTarget));
    matricesUpToDate = false;
  }

  /**
      * Adds a new Anchor.
      * 
      * @param pOrigin
      *            Point for origin position
      * @param pTarget
      *            Point for target position
      */
  public void addAnchor(PVector pOrigin, PVector pTarget) {
    anchors.add(new Anchor(pOrigin, pTarget));
    matricesUpToDate = false;
  }

  /**
      * Remove an Anchor.
      * 
      * @param i
      *            Index of the anchor
      */
  public void removeAnchor(int i) {
    anchors.remove(i);
    matricesUpToDate = false;
  }

  /**
      * Remove an Anchor.
      * 
      * @param anchor
      *            Anchor to remove
      */
  public void removeAnchor(Anchor anchor) {
    anchors.remove(anchor);
    matricesUpToDate = false;
  }

  /**
      * @return Number of anchors added to the MultiTransform
      */
  public int getAnchorCount() {
    return anchors.size();
  }

  /**
      * @param i
      *            Index of the anchor to return.
      */
  public Anchor getAnchor(int i) {
    return anchors.get(i);
  }

  /**
      * @param p
      *            Origin or Target position of the anchor to return.
      * @param tolerance
      *            Radius around Anchor
      * @return Index of the found anchor or -1 if nothing was found at the
      *         specified position
      */

  public int getAnchorByPos(PVector p, float tolerance) {
    for (int i = anchors.size() - 1; i >= 0; i--) {
      if (dist(p.x, p.y, getAnchorOrigin(i).x, 
      getAnchorOrigin(i).y) <= tolerance
        || dist(p.x, p.y, getAnchorTarget(i).x, 
      getAnchorTarget(i).y) <= tolerance) {
        return i;
      }
    }
    return -1;
  }

  /**
      * @param p
      *            Origin position of the anchor to return.
      * @param tolerance
      *            Radius around Anchor
      * @return Index of the found anchor or -1 if nothing was found at the
      *         specified position
      */
  public int getAnchorByOriginPos(PVector p, float tolerance) {
    for (int i = anchors.size() - 1; i >= 0; i--) {
      if (dist(p.x, p.y, getAnchorOrigin(i).x, 
      getAnchorOrigin(i).y) <= tolerance) {
        return i;
      }
    }
    return -1;
  }

  /**
      * @param p
      *            Target position of the anchor to return.
      * @param tolerance
      *            Radius around Anchor
      * @return Index of the found anchor or -1 if nothing was found at the
      *         specified position
      */
  public int getAnchorByTargetPos(PVector p, float tolerance) {
    for (int i = anchors.size() - 1; i >= 0; i--) {
      if (dist(p.x, p.y, getAnchorTarget(i).x, 
      getAnchorTarget(i).y) <= tolerance) {
        return i;
      }
    }
    return -1;
  }

  public PVector getAnchorOrigin(int i) {
    return anchors.get(i).getOriginPosition();
  }

  public void setAnchorOrigin(int i, PVector p) {
    setAnchorOrigin(i, p.x, p.y);
  }

  public void setAnchorOrigin(int i, float x, float y) {
    anchors.get(i).setOriginPosition(x, y);
    matricesUpToDate = false;
  }

  public PVector getAnchorTarget(int i) {
    return anchors.get(i).getTargetPosition();
  }

  public void setAnchorTarget(int i, PVector p) {
    setAnchorTarget(i, p.x, p.y);
  }

  public void setAnchorTarget(int i, float x, float y) {
    anchors.get(i).setTargetPosition(x, y);
    matricesUpToDate = false;
  }

  public int getWeightingMode() {
    return weightingMode;
  }

  public void setWeightingMode(int weightingMode) {
    this.weightingMode = weightingMode;
    matricesUpToDate = false;
  }

  public float getWeightingExponent1() {
    return weightingExponent1;
  }

  /**
      * Exponent of the weighting function for how the relations from one anchor
      * to all others are cumulated. The closer the other anchor lies, the
      * stronger it is weighted.
      * 
      * @param val
      *            Usually something between 0 and 2. Default = 1.
      */
  public void setWeightingExponent1(float val) {
    weightingExponent1 = val;
    matricesUpToDate = false;
  }

  public float getWeightingExponent2() {
    return weightingExponent2;
  }

  /**
      * Exponent of the weighting function when applying all anchor matrices to a
      * point.
      * 
      * @param val
      *            Usually 1 or higher. Default = 2.
      */
  public void setWeightingExponent2(float val) {
    weightingExponent2 = val;
    matricesUpToDate = false;
  }

  public float getWeightingExponent3() {
    return weightingExponent3;
  }

  /**
      * Set exponent of the weighting function that factors in, if the direction
      * from anchor to point and from one anchor to another is quite similar.
      * Only applicable for subclass MultiTransformDirectional.
      * 
      * @param val
      *            Usually something between 0 and 2. Default = 1.
      */
  public void setWeightingExponent3(float val) {
    weightingExponent3 = val;
    matricesUpToDate = false;
  }

  /**
      * Main function of the class. Transforms a point on the plane and returns
      * its new position.
      * 
      * @param x
      *            X coordinate of the point to be transformed
      * @param y
      *            Y coordinate of the point to be transformed
      * @return Transformed point
      */
  public PVector transform(float x, float y) {
    return transform(new PVector(x, y));
  }

  /**
      * Main function of the class. Transforms a point on the plane and returns
      * its new position.
      * 
      * @param p
      *            Point to be transformed
      * @return Transformed point
      */
  public PVector transform(PVector p) {
    if (weightingMode == DIRECTIONAL) {
      return transformDirectional(p);
    }

    return transformSimple(p);
  }

  PVector transformSimple(PVector p) {
    if (matricesUpToDate == false) {
      updateAnchorMatrices();
    }

    PVector pTransformed = p.get();
    float[] weights = calcWeights(p, ORIGINS, -1, weightingExponent2);

    // apply matrix-transforms to the point
    PVector dvecOffsetSum = new PVector();
    for (int i = 0; i < anchors.size(); i++) {
      // delta vector from orig-anchor to the point
      PVector dvec = PVector.sub(p, anchors.get(i).getOriginPosition());

      // apply the matrix of this anchor to that delta vector
      PVector dvecres = new PVector();
      anchors.get(i).getTransformMatrix().mult(dvec, dvecres);

      // offset between the delta vector and the transformed delta vector
      PVector dvecOffset = PVector.sub(dvecres, dvec);

      // multiply this offset by the weight of this anchor
      dvecOffset.mult(weights[i]);

      // add up all offset
      dvecOffsetSum.add(dvecOffset);
    }
    // add the sum of all offsets to the point
    pTransformed.add(dvecOffsetSum);

    return pTransformed;
  }

  PVector transformDirectional(PVector p) {
    if (matricesUpToDate == false) {
      for (int i = 0; i < anchors.size(); i++) {
        anchors.get(i).updateDirectionalMatrices(anchors);
      }
      matricesUpToDate = true;
    }

    PVector pTransformed = p.get();

    float[] weights = calcWeights(p, ORIGINS, -1, weightingExponent2);

    // apply matrix-transforms to the point
    PVector dvecOffsetSum = new PVector();
    for (int i = 0; i < anchors.size(); i++) {
      // delta vector from orig-anchor to the point
      PVector dvec = PVector.sub(p, anchors.get(i).getOriginPosition());

      // apply the matrices of this anchor to that delta vector
      float[] distweights = calcWeights(anchors.get(i)
        .getTargetPosition(), TARGETS, i, weightingExponent1);

      PVector dvecres = anchors.get(i).applyCumulatedMatrix(dvec, 
      weightingExponent3, distweights);

      // multiply this offset by the weight of this anchor
      dvecres.mult(weights[i]);

      // add up all offset
      dvecOffsetSum.add(dvecres);
    }
    // add the sum of all offsets to the point
    pTransformed.add(dvecOffsetSum);

    return pTransformed;
  }

  /**
      * It's usually not necessary to call this method. If anchors and parameters
      * are always set with the given methods (setAnchorOrigin(), ...), this
      * method will be called automatically. It calculates a transformation
      * matrix for each anchor. This matrix reflects the translation of the
      * anchor and the rotation and scaling depending on the (possibly) changed
      * positions of all other anchors.
      */
  public void updateAnchorMatrices() {

    for (int i = 0; i < anchors.size(); i++) {
      PMatrix2D matrix = anchors.get(i).getTransformMatrix();
      matrix = new PMatrix2D();
      matrix.translate(anchors.get(i).targetPosition.x
        - anchors.get(i).originPosition.x, 
      anchors.get(i).targetPosition.y
        - anchors.get(i).originPosition.y);

      // calculate weights for this anchor so that closer anchors have
      // more influence on its rotation and scaling
      // could also be done with the origin positions, but I think that
      // it's far better to do it with the target positions.
      // float[] weights = calcWeights(anchors.get(i).getOriginPosition(),
      // ORIGINS, i, weightingExponent1);
      float[] weights = calcWeights(anchors.get(i).getTargetPosition(), 
      TARGETS, i, weightingExponent1);

      ArrayList<Float> angles = new ArrayList<Float>();

      float sFac = 1;

      for (int j = 0; j < anchors.size(); j++) {
        float fac = weights[j];

        if (i != j) {
          PVector originI = anchors.get(i).getOriginPosition();
          PVector originJ = anchors.get(j).getOriginPosition();
          PVector targetI = anchors.get(i).getTargetPosition();
          PVector targetJ = anchors.get(j).getTargetPosition();

          float w1 = atan2(originJ.y - originI.y, originJ.x
            - originI.x);
          float w2 = atan2(targetJ.y - targetI.y, targetJ.x
            - targetI.x);
          float w = angleDifference(w2, w1);
          angles.add(w);

          float d1 = PVector.dist(originJ, originI);
          float d2 = PVector.dist(targetJ, targetI);
          float s = d2 / d1;

          if (d1 == 0 && d2 == 0)
            s = 1;
          else if (d1 == 0)
            s = 10;

          s = pow(s, fac);
          sFac *= s;
        } 
        else {
          angles.add(0f);
        }
      }

      matrix.rotate(angleAverage(angles, weights));
      matrix.scale(sFac);

      anchors.get(i).setTransformMatrix(matrix);
    }

    matricesUpToDate = true;
  }

  float[] calcWeights(PVector p, int mode, int excludeIndex, float exponent) {

    // calc distances between point and all original anchors
    float[] dists = new float[anchors.size()];
    int n = dists.length;

    int k = -1;
    float minDist = 10000000;

    for (int i = 0; i < n; i++) {
      PVector otherPoint;
      if (mode == ORIGINS) {
        otherPoint = anchors.get(i).getOriginPosition();
      } 
      else {
        otherPoint = anchors.get(i).getTargetPosition();
      }

      dists[i] = PVector.dist(p, otherPoint);
      if (dists[i] < minDist && i != excludeIndex) {
        minDist = dists[i];
        k = i;
      }
    }

    // calc attraction weights (sum of all weights must be 1)
    float[] weights = new float[n];

    if (minDist == 0) {
      weights[k] = 1;
    } 
    else {
      float[] distfacs = new float[n];
      float sum = 0;

      for (int i = 0; i < n; i++) {
        if (i != excludeIndex) {
          distfacs[i] = 1f / (pow(dists[i], exponent));
          sum += distfacs[i];
        }
      }

      for (int i = 0; i < n; i++) {
        weights[i] = distfacs[i] / sum;
      }
    }

    return weights;
  }


}


