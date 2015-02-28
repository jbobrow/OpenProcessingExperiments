
class Signatur {

  ArrayList<PVector> mainPath; // this is the main path, it is the same for all types. 
  ArrayList<PVector> subPath; // this is the visible and indivdual flight path for each type. It's the mainPath with an individual offset.

  int type;
  int direction;

  PVector target;
  PVector origin;
  PVector rotation;

  color pathColor;

  float progress = 0;
  float[] progressOf = {0};
  float[] negativProgressOf = {1};
  float[] mainPathMag = {0};

  Signatur(int theType, int dir, int theTargetAreaX, int theTargetAreaYZ, int theNoTargetAreaX, float thePathDeviation) {
    type = theType;
    direction = dir;
    origin = new PVector(0, 0, 0);

    //  ---------------- set targets / right side ----------------
    if (dir > 0) {
      if (type == 2) { // constrain the targets to the x-axis if the char is a nasal…
        target = new PVector(random(theNoTargetAreaX, theTargetAreaX), random(-theTargetAreaYZ/15, theTargetAreaYZ/15), random(-theTargetAreaYZ/15, theTargetAreaYZ/15));
      } 
      else if (type == 1) { // plosive
        target = new PVector(random(1, theNoTargetAreaX/2), random(-theTargetAreaYZ, theTargetAreaYZ), random(-theTargetAreaYZ, theTargetAreaYZ));
      } 
      else {
        target = new PVector(random(theNoTargetAreaX, theTargetAreaX), random(-theTargetAreaYZ, theTargetAreaYZ), random(-theTargetAreaYZ, theTargetAreaYZ));
      }

      //  ---------------- set targets / left side ----------------
    } 
    else {
      if (type == 2) { // constrain the targets to the x-axis if the char is a nasal…
        target = new PVector(random(-theTargetAreaX, -theNoTargetAreaX), random(-theTargetAreaYZ/15, theTargetAreaYZ/15), random(-theTargetAreaYZ/15, theTargetAreaYZ/15));
      } 
      else if (type == 1) { // plosive
        target = new PVector(random(-theNoTargetAreaX/2, -1), random(-theTargetAreaYZ, theTargetAreaYZ), random(-theTargetAreaYZ, theTargetAreaYZ));
      } 
      else {
        target = new PVector(random(-theTargetAreaX, -theNoTargetAreaX), random(-theTargetAreaYZ, theTargetAreaYZ), random(-theTargetAreaYZ, theTargetAreaYZ));
      }
    }

    //  ---------------- create random Vector for the aproximant signature ----------------
    PVector randomVector = new PVector(random(-thePathDeviation, thePathDeviation), random(-thePathDeviation, thePathDeviation), random(-thePathDeviation, thePathDeviation));
    rotation = PVector.add(target, randomVector);

    //  ---------------- ArrayLists ----------------
    mainPath = new ArrayList<PVector>();
    mainPath.add(new PVector(origin.x, origin.y, origin.z));

    subPath = new ArrayList<PVector>();
    subPath.add(new PVector(origin.x, origin.y, origin.z));
  }

  /////////////////////////////////////////////////////
  void update() {
    if (mainPath.size() >= 1 && progress < 0.98) {

      float speed = 0; // spreading speed (smaller = faster)
      float factor = 0; // mostly used as multiplyer or size

      //  ---------------- define type specific parameters ----------------
      switch (type) {
      case 0: // vowel
        speed = 40;
        break;
      case 1: // plosiv
        speed = 15;
        factor = 20;
        break;
      case 2: // nasal
        speed = 40;
        factor = 40;
        break;
      case 3: // vibrant
        speed = 60;
        factor = 35;
        break;
      case 4: // fricative
        speed = 40;
        factor = 20;
        noiseDetail(3);
        break;
      case 5: // aproximant
        speed = 35;
        factor = 50;
        break;
      case 6: // special-sign
        speed = 15;
        break;
      case 7: // numeric character
        speed = 25;
        break;
      }


      //  ---------------- calculate mainPath ----------------

      int index = mainPath.size()-1;
      PVector step = new PVector (mainPath.get(index).x, mainPath.get(index).y, mainPath.get(index).z);
      PVector newPos = new PVector (mainPath.get(index).x, mainPath.get(index).y, mainPath.get(index).z);


      // calculate progress
      if (type != 5) {
        progress = map(dist(origin.x, origin.y, origin.z, newPos.x, newPos.y, newPos.z), 0, dist(origin.x, origin.y, origin.z, target.x, target.y, target.z), 0, 1);
        step.sub(target);
      } 
      else {
        progress = map(dist(origin.x, origin.y, origin.z, newPos.x, newPos.y, newPos.z), 0, dist(origin.x, origin.y, origin.z, rotation.x, rotation.y, rotation.z), 0, 1);
        step.sub(rotation);
      }

      step.div(speed);
      newPos.sub(step);
      mainPath.add(newPos);

      PVector subStep = new PVector(mainPath.get(index).x, mainPath.get(index).y, mainPath.get(index).z);
      PVector subPos = new PVector (mainPath.get(index).x, mainPath.get(index).y, mainPath.get(index).z);


      //  ---------------- calculate type specific flightpath (subPath) ----------------

      if (type == 1) { // plosiv = fast and fragmented flight path
        float noiseX = random(-0.5, 0.5);
        float noiseY = random(-1, 1);
        float noiseZ = random(-1, 1);
        subStep.set((noiseX*factor)*progress, (noiseY*factor)*progress, (noiseZ*factor)*progress);
        subPos.add(subStep);
      }

      else if (type == 2) { // nasal = resonating flight path
        float amplitude = factor*progress;
        float noiseY = noise(subPos.y);
        subPos.y += cos(progress*factor)*amplitude;
      } 

      else if (type == 3) { // vibrant = oscillating, spiraling flight path
        float rad = factor*progress;
        subPos.x += sin(progress*factor)*rad;
        subPos.y += cos(progress*factor)*rad;
      } 

      else if (type == 4) { // fricative = noisy flight path
        float noiseX = noise(subPos.x);
        float noiseY = noise(subPos.y);
        float noiseZ = noise(subPos.z);
        subStep.set((noiseX*factor)*progress, (noiseY*factor)*progress, (noiseZ*factor)*progress);
        subPos.add(subStep);
      } 

      else if (type == 5) { // approximant = slightly curved flight path
        PVector targetApproximation = new PVector();
        targetApproximation.set(rotation);
        targetApproximation.sub(target);
        targetApproximation.div(40);
        rotation.sub(targetApproximation);
      }

      //  ---------------- add new values ----------------
      subPath.add(subPos);

      progressOf = append(progressOf, progress); // store the progress in an Array (from 0 to 1)
      negativProgressOf = append(negativProgressOf, map(progress, 0, 1, 1, 0)); // store the negativ progress in an Array (from 1 to 0)
      mainPathMag = append(mainPathMag, dist(origin.x, origin.y, origin.z, newPos.x, newPos.y, newPos.z)); // store the magnitude in an Array
    }
  }


  /////////////////////////////////////////////////////
  void display(char c) {
    noStroke();

    //  ---------------- different line weights for different types ----------------

    float lineWeight = 0.8;

    switch (type) {
    case 0: // vowel
      lineWeight = 0.9;
      break;
    case 5: // approximant
      lineWeight = 1;
      break;
    }


    //  ---------------- draw subPath ----------------

    if (subPath.size() > 1) {
      if (signaturVisible) {
        for (int i=1; i< subPath.size(); i++) {

          // nasal color
          if (type == 2) {
            pathColor = color(255, 250, 100, 255-(progressOf[i]*255));
          }

          // default color
          else {
            pathColor = color(255, 255-(progressOf[i]*255));
          }

          // vowel
          if (type == 0) { 
            pathColor = color(120, 200, 255, 255-(progressOf[i]*255));
            line_3d(new PVector(subPath.get(i-1).x, subPath.get(i-1).y, subPath.get(i-1).z), new PVector(subPath.get(i).x, subPath.get(i).y, subPath.get(i).z), lineWeight*negativProgressOf[i], pathColor);
          }

          // plosiv
          else if (type == 1) { 
            pathColor = color(255, 70, 10, 255-(progressOf[i]*255));
            if (sin(i) < 0.2) {
              line_3d(new PVector(subPath.get(i-1).x, subPath.get(i-1).y, subPath.get(i-1).z), new PVector(subPath.get(i).x, subPath.get(i).y, subPath.get(i).z), lineWeight*negativProgressOf[i], pathColor);
            }
          } 

          // special-sign
          else if (type == 6) { 
            if (i > 10 && i < 50) {
              pathColor = color(128, 255-(progressOf[i]*255));

              // ------ draw a cross ------
              gl.glPushMatrix();
              gl.glTranslatef(subPath.get(i).x, subPath.get(i).y, subPath.get(i).z);
              gl.glColor4f(red(pathColor)/255, green(pathColor)/255, blue(pathColor)/255, alpha(pathColor)/255);
              float crossSize = progressOf[i]*2;

              gl.glBegin(gl.GL_LINES);
              gl.glVertex3f(-crossSize, 0, 0);
              gl.glVertex3f(crossSize, 0, 0);
              gl.glEnd();
              gl.glBegin(gl.GL_LINES);
              gl.glVertex3f(0, -crossSize, 0);
              gl.glVertex3f(0, crossSize, 0);
              gl.glEnd();
              gl.glBegin(gl.GL_LINES);
              gl.glVertex3f(0, 0, -crossSize);
              gl.glVertex3f(0, 0, crossSize);
              gl.glEnd();

              gl.glPopMatrix();
            }
          } 

          // default
          else {
            line_3d(new PVector(subPath.get(i-1).x, subPath.get(i-1).y, subPath.get(i-1).z), new PVector(subPath.get(i).x, subPath.get(i).y, subPath.get(i).z), lineWeight*negativProgressOf[i], pathColor);
          }
        }
      }


      //  ---------------- debug/info modes ----------------

      if (infoVisible) { // draw info text
        fill(255);
        offscreen.endGL();
        offscreen.textFont(font, 10);
          offscreen.pushMatrix();
          offscreen.translate(subPath.get(subPath.size() -1).x + 2, subPath.get(subPath.size() -1).y - 2, subPath.get(subPath.size() -1).z);
          offscreen.text(c, 0, 0, 0);
          offscreen.popMatrix();
        offscreen.beginGL();
      }

      if (mainPathVisible) { // draw mainPath
        gl.glColor4f(1, 0, 0, 0.5);
        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(origin.x, origin.y, origin.z);
        gl.glVertex3f(target.x, target.y, target.z);
        gl.glEnd();
      }

      if (targetVisible) { // draw a cross at the target
        int crossSize = 5;

        gl.glPushMatrix();
        gl.glTranslatef(target.x, target.y, target.z);
        gl.glColor4f(1, 0, 0, 1);

        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(-crossSize, 0, 0);
        gl.glVertex3f(crossSize, 0, 0);
        gl.glEnd();
        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(0, -crossSize, 0);
        gl.glVertex3f(0, crossSize, 0);
        gl.glEnd();
        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(0, 0, -crossSize);
        gl.glVertex3f(0, 0, crossSize);
        gl.glEnd();

        gl.glPopMatrix();


        gl.glPushMatrix();
        gl.glTranslatef(rotation.x, rotation.y, rotation.z);
        gl.glColor4f(0, 1, 0, 1);

        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(-crossSize, 0, 0);
        gl.glVertex3f(crossSize, 0, 0);
        gl.glEnd();
        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(0, -crossSize, 0);
        gl.glVertex3f(0, crossSize, 0);
        gl.glEnd();
        gl.glBegin(gl.GL_LINES);
        gl.glVertex3f(0, 0, -crossSize);
        gl.glVertex3f(0, 0, crossSize);
        gl.glEnd();

        gl.glPopMatrix();
      }
    }
  }

  //inspired from James Carruthers's drawLine function
  //http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/4#4
  void line_3d(PVector pv1, PVector pv2, float weight, color _color) {
    PVector v1 = new PVector(pv2.x - pv1.x, pv2.y - pv1.y, pv2.z - pv1.z);

    float rho = sqrt(pow(v1.x, 2) + pow(v1.y, 2) + pow(v1.z, 2));
    float phi = acos(v1.z / rho);
    float the = atan2(v1.y, v1.x);

    v1.mult(0.5);      

    float zval = pv1.dist(pv2) * 0.5;  
    float rad = radians(120) * weight * 0.5;

    gl.glPushMatrix();
    gl.glTranslatef(pv1.x, pv1.y, pv1.z);
    gl.glTranslatef(v1.x, v1.y, v1.z);
    gl.glRotatef(degrees(the), 0, 0, 1);
    gl.glRotatef(degrees(phi), 0, 1, 0);
    gl.glColor4f(red(_color)/255, green(_color)/255, blue(_color)/255, alpha(_color)/255);

    //DRAW THE 3D 'LINE' (with 3 planes)  
    gl.glBegin(GL.GL_QUADS);
    //1
    gl.glVertex3f( rad, -rad, zval);
    gl.glVertex3f( rad, -rad, -zval);
    gl.glVertex3f(-rad, -rad, -zval);
    gl.glVertex3f(-rad, -rad, zval);      
    //2
    gl.glVertex3f(-rad, -rad, zval);
    gl.glVertex3f(-rad, -rad, -zval);
    gl.glVertex3f(   0, rad, -zval);
    gl.glVertex3f(   0, rad, zval);
    //3
    gl.glVertex3f(   0, rad, zval);
    gl.glVertex3f(   0, rad, -zval);
    gl.glVertex3f( rad, -rad, -zval);
    gl.glVertex3f( rad, -rad, zval);
    gl.glEnd();

    gl.glPopMatrix();
  }
}


