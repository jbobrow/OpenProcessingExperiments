
/**
 * A little doodle demo using the Spline class to compress & smooth mouse inputs.
 * Points are recorded at a fixed interval (distance) and used as handles for a
 * continous curve.
 *
 * Key controls:
 * h - toggle spline handles on/off
 * s - toggle display of smoothed spline
 * l - toggle display of raw linear connection between handles (to compare with curvature)
 * any other key clears the canvas/history
 */

/*
 * Copyright (c) 2006-2009 Karsten Schmidt
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * http://creativecommons.org/licenses/LGPL/2.1/
 

 
 
 
 
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

import toxi.geom.*;
//import rita.wordnet.*;

ArrayList points=new ArrayList();
ArrayList stepWords = new ArrayList();
ArrayList stepValues = new ArrayList();
boolean changeWords;
int textChangePeriod;
int textAppearPeriod;


// desired distance between points/handles
float sampleDistance=150;

//RiWordnet wordnet;
String word;


int nbCurve = 1;
float curveRdness = 0;

boolean showLine=true;
boolean showSpline=true;
boolean showHandles=true;

String[] goodWords = {
  "happy", "laughing", "healthy", "full", "lovely", "natural", "safe", "honest", "friendly"
};
String[] badWords  = {
  "sad", "crying", "horrible", "systemic", "artificial", "dying", "bittersweet", "moribund", "pessimistic", "boring", "competitive"
};
String[] neutralWords  = {
  "meditative", "calm", "quiet", "sleepy", "distant"

};
PFont myFont;

float speed;

void setup() {
  size(800, 600);

  //smooth();
  myFont = createFont("Impact", 32);
  textFont(myFont);
  //wordnet = new RiWordnet(this);
  speed = 20;
  changeWords = false;
  textChangePeriod = 16;
  textAppearPeriod = 5;
  frameRate(60);
}

float xCamPos = width/2;
float yCamPos= height/2;

float scaleIncr = 0.01;

float scaleFactor=1;
float prevScaleFactor=1;

  float xCamMove = 0;
  float yCamMove = 0;


void draw() {
  background(255);
  noFill();

  int numP=points.size();

  Vec2D currP=new Vec2D(mouseX, mouseY);
  Vec2D currP2=new Vec2D((mouseX-xCamPos), (mouseY-yCamPos));

  Vec2D LeftBorderProj = new Vec2D(0, mouseY);
  Vec2D RightBorderProj = new Vec2D(width, mouseY);
  Vec2D TopBorderProj = new Vec2D(mouseX, 0);
  Vec2D BottomBorderProj = new Vec2D(mouseX, height);


  if (currP.distanceTo(LeftBorderProj) < (width/2)-30)
  {
    xCamMove=speed;
  }
  else if (currP.distanceTo(RightBorderProj) < (width/2)-30)
  {
    xCamMove=-speed;
  }

  if (currP.distanceTo(TopBorderProj) < (height/2)-30)
  {
    yCamMove=speed;
  }
  else if (currP.distanceTo(BottomBorderProj) < (height/2)-30)
  {
    yCamMove=-speed;
  }
  
  xCamPos += xCamMove;
  yCamPos += yCamMove;

  if (numP>0) {
    // check distance to previous point
    Vec2D prevP=(Vec2D)points.get(numP-1);

    if ((currP2.distanceTo(prevP))>sampleDistance) {
      points.add(currP2);
    }
  }
  else {
    // add first point regardless
    points.add(currP2);
  }

  scaleFactor = max(0.0079, scaleFactor);
  scaleFactor = min(7, scaleFactor);
  
  numP=points.size();
  scale(scaleFactor, scaleFactor);
  translate(((-currP2.x+width/(2*scaleFactor))), ((-currP2.y+height/(2*scaleFactor))));
  //if (showLine) {
    stroke(255, 0, 0, 50);
    beginShape();
    for (int i=0; i<numP; i++) {
      Vec2D p=(Vec2D)points.get(i);
      vertex(p.x, p.y);
    }
    endShape();
  //}


  strokeWeight(32);
  // highlight the positions of the points with circles
  Vec2D[] handles=new Vec2D[numP];
  for (int i=0; i<numP; i++) {
    int wordIndex = (i/textAppearPeriod);
    Vec2D p=(Vec2D)points.get(i);
    handles[i]=p;
    stroke(255, 0, 0);

    if (showHandles) ellipse(p.x, p.y, 5, 5);
    stroke(0, 0, 0);
    
    if (frameCount%textChangePeriod == 0)
    {
      changeWords = true;

    }

    if (i%textAppearPeriod == 0)
    {
      if (i>0)
      {
        Vec2D q= ((Vec2D) (points.get(i-1))).bisect(p).to2DXY();
        float angle = (q.toPolar().y);

        pushMatrix();
        if (angle < 0)
        {
          angle = (angle+2*PI)%(2*PI);
        }

        if (angle>=PI/4.0 && angle <3*PI/4.0)
        {
          translate(p.x + (10 +curveRdness), p.y - (10 +curveRdness));

          rotate(angle - PI/2.0);
        }
        else if (angle>=3*PI/4.0 && angle <5*PI/4.0)
        {
          translate(p.x + (10 + curveRdness), p.y + (10 +curveRdness));

          rotate(angle - PI/2.0);
        }
        else if (angle>=5*PI/4.0 && angle <7*PI/4)
        {
          translate(p.x + (10 + curveRdness), p.y - (10 +curveRdness));

          rotate(angle + PI/2.0);
        }
        else if ((angle>=7*PI/4.0 && angle <2*PI) ||(angle>=0 && angle <PI/4.0))
        {
          translate(p.x + (10 + curveRdness), p.y + (10 +curveRdness));
          rotate(angle + PI/2.0);
        }

        if (i < (numP-1) || (i == numP-1 && stepWords.size() == wordIndex))
        {
          word = (String) stepWords.get(wordIndex-1);
          Float textValue = ((Float) stepValues.get(wordIndex-1));
          /*if (falsechangeWords)
          {
            String[] wordTab = wordnet.getSimilar(word, "a");
            if(wordTab != null)

            {
              word = wordTab[(int) random(wordTab.length-1)];
            }
           
            stepWords.set(wordIndex-1,word);
           
          }*/
          word = word + " ( "+ textValue +" )";
          text(word, 0, 0);
        }
        else
        {
          float textValue = (height/scaleFactor-p.y)/10000;
          float danger =max(min((1-textValue)*255, 255), 0);
          fill(danger, 255-danger, 0);
          if (textValue < 0.5)
          {
            word = badWords[(int) random(badWords.length-1)];
          }
          else if (textValue < 1)
          {
            word = neutralWords[(int) random(neutralWords.length-1)];
          }
          else
          {
            word = goodWords[(int) random(goodWords.length-1)];

          }

          //String[] wordTab = wordnet.getSimilar(word, "a");

          //word = wordTab[(int) random(wordTab.length-1)];
          text(word + " ( "+ textValue +" )", 0, 0);
          stepWords.add(word);
          stepValues.add((float) textValue);
        }
        popMatrix();
        noFill();
      }
    }
    changeWords = false;

  }

  // need at least 4 vertices for a spline
  strokeWeight(6);

  if (numP>3 && showSpline) {
    // pass the points into the Spline container class
    Spline2D spline=new Spline2D(handles);
    // sample the curve at a higher resolution
    // so that we get extra 8 points between each original pair of points
    java.util.List vertices=spline.computeVertices(10);


    // draw the smoothened curve

    stroke(0);
    for (int j=0;j<nbCurve;++j)
    {
      beginShape();
      for (Iterator i=vertices.iterator(); i.hasNext(); ) {

        Vec2D v=(Vec2D)i.next();
        vertex(v.x+random(-curveRdness, curveRdness), v.y+random(-curveRdness, curveRdness));
      }
      endShape();
    }
  }
}

void keyPressed() {
  if (key=='h') showHandles=!showHandles;
  else if (key=='l') showLine=!showLine;
  else if (key=='c') showSpline=!showSpline;
  else if (key=='a') scaleFactor -= scaleIncr;
  else if (key=='z') scaleFactor += scaleIncr;
  else if (key=='q') nbCurve = max(nbCurve-1, 0);
  else if (key=='s') nbCurve += 1;
  else if (key=='w') curveRdness = max(curveRdness-1, 0);
  else if (key=='x') curveRdness += 1;
  else if (key=='-') speed = max(speed-1, 0);
  else if (key=='=') speed += 1; 
  else if (key=='e') textChangePeriod = max(textChangePeriod-1, 1);
  else if (key=='r') textChangePeriod += 1; 
}

