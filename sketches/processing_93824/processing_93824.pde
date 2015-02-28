
float xmag, ymag=0;
float newXmag, newYmag=0; 
int originalSphereRadius=200;
float thetaInterval=.08;
float phiInterval=.08;
float rInterval=2;
float zInterval=2;
float total=0;
color backgroundColor = color(0);

int selectedIndex;
boolean mouseClickedOnce=false;
boolean home=true;

float movementInterval=10000;
float movementCount=0;
float maxMovementCount=4000;
int movementAmount=0;

ArrayList<my3DPoint> allPoints= new ArrayList<my3DPoint>();

ArrayList<myDataPoint> dataPoints = new ArrayList<myDataPoint>();
ArrayList<myDataPoint> alphabetical = new ArrayList<myDataPoint>();
ArrayList<myTriangle> allTriangles = new ArrayList<myTriangle>();

int textShrinkCounter=0;
int maxTextShrinkCount=2000;

void setup() {
  size(1100, 700, P3D);
  background(0);

  dataPoints.add(new myDataPoint(35, "Pie"));  
  dataPoints.add(new myDataPoint(20, "Doughnuts"));
  dataPoints.add(new myDataPoint(24, "Cake"));
  dataPoints.add(new myDataPoint(8, "Cookies"));
  dataPoints.add(new myDataPoint(13, "Ice Cream"));
  

  for (int index=0;index<dataPoints.size();index++) {
    int minIndex=0;
    int minValue=10000000;
    for (int j=index;j<dataPoints.size();j++) {
      if (dataPoints.get(j).getAmount()<minValue) {
        minIndex=j;
        minValue=dataPoints.get(j).getAmount();
      }
    }
    myDataPoint temp = dataPoints.get(index);
    dataPoints.set(index, dataPoints.get(minIndex));
    dataPoints.set(minIndex, temp);
  }

  for (int i=0;i<dataPoints.size();i++) {
    total+=dataPoints.get(i).getAmount();
  }

  //get percentages
  for (int i=0;i<dataPoints.size();i++) {
    dataPoints.get(i).setPercentage(total);
  }

  //set bounds
  float lowerBound=0;
  for (int i=0;i<dataPoints.size();i++) {
    float upperBound=lowerBound+2*PI*dataPoints.get(i).getPercentage();
    dataPoints.get(i).setLowerBound(lowerBound);
    dataPoints.get(i).setUpperBound(upperBound);
    println(lowerBound);
    println(upperBound);
    lowerBound=upperBound;
  }
  dataPoints.get(dataPoints.size()-1).setUpperBound(2*PI);


  for (int j=0;j<dataPoints.size();j++) {
    alphabetical.add(dataPoints.get(j));
  }

  for (int count=0;count<2;count++) {
    for (int index=1;index<alphabetical.size();index++) {
      myDataPoint key = alphabetical.get(index);
      int j;
      for (j=index-1;j>=0 && alphabetical.get(j).getCategory().compareTo(key.getCategory())<0;j--) {
        alphabetical.set(j+1, alphabetical.get(j));
      }
      alphabetical.set(j+1, key);
    }
  }


//  for (int i=0;i<dataPoints.size();i++) {
//    for (int j=0;j<3;j++) {
//      dataPoints.get(i).addPoint((int)random(1, 100), "SubCategory "+(j+1));
//    }
//  }

  dataPoints.get(4).addPoint(11,"Apple Pie");
  dataPoints.get(4).addPoint(5,"Key Lime Pie");
  dataPoints.get(4).addPoint(7,"Pumpkin Pie");
  dataPoints.get(4).addPoint(12,"Peach Pie");
  
  dataPoints.get(1).addPoint(6, "Chocolate");
  dataPoints.get(1).addPoint(2, "Vanilla");
  dataPoints.get(1).addPoint(5, "Mint Chocolate");
  
  dataPoints.get(2).addPoint(6, "Jelly");
  dataPoints.get(2).addPoint(10, "Glazed");
  dataPoints.get(2).addPoint(4, "Powdered");
  
  dataPoints.get(3).addPoint(8, "Cheesecake");
  dataPoints.get(3).addPoint(10, "Angelfood");
  dataPoints.get(3).addPoint(2, "Fruitcake");
  dataPoints.get(3).addPoint(5, "Red Velvet");
  
  dataPoints.get(0).addPoint(4, "Chocolate Chip");
  dataPoints.get(0).addPoint(2, "Gingerbread");
  dataPoints.get(0).addPoint(1, "Macaroon");
  dataPoints.get(0).addPoint(1, "Peanut Butter");
}

void draw() {
  allTriangles = new ArrayList<myTriangle>();

  background(0);
  pushMatrix();
  translate(width/3, height/2, 0);

  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff)>0.01) { 
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff)>0.01) { 
    ymag -= diff/4.0;
  }

  //  pointLight(255, 255, 255, 400, 400, 300);
  //  pointLight(255, 255, 255, 0, 0, 50);
  lights();
  rotateX(-ymag);
  rotateY(-xmag);

  noStroke();

  //draw sphere
  int dataPointNumber=0;
  for (float theta=0;theta<2*PI;theta+=thetaInterval) {

    if (theta>=dataPoints.get(dataPointNumber).getUpperBound()) {
      dataPointNumber++;
    }
    boolean drawingSelectedShape=(mouseClickedOnce && dataPointNumber==selectedIndex);
    float lowerBound=dataPoints.get(dataPointNumber).getLowerBound();
    float upperBound=dataPoints.get(dataPointNumber).getUpperBound();

    float centerAngle=(upperBound+lowerBound)/2;

    int innerDataPointNumber=0;

    for (float phi=0;phi<PI;phi+=phiInterval) {
      float lowerInnerBound=0;
      float upperInnerBound=0;
      if (drawingSelectedShape && dataPoints.get(dataPointNumber).hasData()) {
        if (phi>=dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getUpperBound()) {
          innerDataPointNumber++;
        }
        lowerInnerBound=dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getLowerBound();
        upperInnerBound=dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getUpperBound();
      }

      float x = originalSphereRadius*sin(phi)*cos(theta);
      float y = originalSphereRadius*sin(phi)*sin(theta);
      float z = originalSphereRadius*cos(phi);
      ArrayList<my3DPoint> points = new ArrayList<my3DPoint>();

      ArrayList<my3DPoint> transformations = new ArrayList<my3DPoint>();
      transformations.add(new my3DPoint(-thetaInterval, -phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(0, -phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(+thetaInterval, -phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(+thetaInterval, 0, originalSphereRadius));
      transformations.add(new my3DPoint(+thetaInterval, +phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(0, +phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(-thetaInterval, +phiInterval, originalSphereRadius));
      transformations.add(new my3DPoint(-thetaInterval, 0, originalSphereRadius));

      if (theta-thetaInterval<lowerBound) {
        x = originalSphereRadius*sin(phi)*cos(lowerBound+thetaInterval);
        y = originalSphereRadius*sin(phi)*sin(lowerBound+thetaInterval);
        theta=lowerBound+thetaInterval;
      }

      if (theta+thetaInterval>upperBound) {
        x = originalSphereRadius*sin(phi)*cos(upperBound-thetaInterval);
        y = originalSphereRadius*sin(phi)*sin(upperBound-thetaInterval);
        theta=upperBound-thetaInterval;
      }

      if (phi+phiInterval>PI) {
        for (int i=0;i<transformations.size();i++) {
          if (transformations.get(i).getY()==phiInterval) {
            transformations.get(i).setY(PI-phi);
          }
        }
      }

      if (phi-phiInterval<0) {
        for (int i=0;i<transformations.size();i++) {
          if (transformations.get(i).getY()==-phiInterval) {
            transformations.get(i).setY(phi);
          }
        }
      }

      my3DPoint centerPoint = new my3DPoint(x, y, z);

      pushMatrix();

      noStroke();
      fill(dataPoints.get(dataPointNumber).getR(), dataPoints.get(dataPointNumber).getG(), dataPoints.get(dataPointNumber).getB());

      if (drawingSelectedShape) {
        float translateX=0.5*originalSphereRadius*cos(centerAngle)*movementAmount/movementInterval;
        float translateY=0.5*originalSphereRadius*sin(centerAngle)*movementAmount/movementInterval;
        if (!home) {
          translate(translateX, translateY, 0);
        }
        else {
          translate(translateX, translateY, 0);
        }
        if (!home && movementAmount<movementInterval) {
          movementAmount++;
        }
        if (home && movementAmount>0) {
          movementAmount--;
        }
        if (dataPoints.get(dataPointNumber).hasData() && !home) {
          movementCount++;
          fill(dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getR(), 
          dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getG(), 
          dataPoints.get(dataPointNumber).getData(innerDataPointNumber).getB());

          if (phi+phiInterval/2>upperInnerBound) {
            for (int i=0;i<transformations.size();i++) {
              if (transformations.get(i).getY()==phiInterval) {
                transformations.get(i).setY((upperInnerBound-phi)/2);
              }
            }
          }

          if (phi-phiInterval/2<lowerInnerBound) {
            for (int i=0;i<transformations.size();i++) {
              if (transformations.get(i).getY()==-phiInterval) {
                transformations.get(i).setY((phi-lowerInnerBound)/2);
              }
            }
          }
        }
      }

      for (int i=0;i<transformations.size();i++) {
        points.add(convertToRectangular(theta+transformations.get(i).getX(), phi+transformations.get(i).getY(), originalSphereRadius));
      }

      for (int i=0;i<points.size()-1;i++) {
        myTriangle currentTriangle = new myTriangle(new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ())
          , new my3DPoint(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ())
          , new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ()));
        boolean alreadyDrawn=false;
        for (int k=0;k<allTriangles.size();k++) {
          if (currentTriangle.isEqual(allTriangles.get(k))) {
            alreadyDrawn=true;
            break;
          }
        }  
        if (!alreadyDrawn) {  
//          allTriangles.add(currentTriangle);      
          beginShape();
          vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
          vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
          vertex(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ());
          vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
          endShape();
        }
      }

      beginShape();
      vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
      vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
      vertex(points.get(points.size()-1).getX(), points.get(points.size()-1).getY(), points.get(points.size()-1).getZ());
      vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
      endShape();

      popMatrix();
    }
  }

  fill(dataPoints.get(selectedIndex).getR(), dataPoints.get(selectedIndex).getG(), dataPoints.get(selectedIndex).getB());
  pushMatrix();
  if (mouseClickedOnce && !home && textShrinkCounter>=maxTextShrinkCount && movementAmount>=movementInterval && movementCount>maxMovementCount) {
    float centerAngle=(dataPoints.get(selectedIndex).getUpperBound()+dataPoints.get(selectedIndex).getLowerBound())/2;
    float translateX=originalSphereRadius*cos(centerAngle)/2*movementAmount/movementInterval;
    float translateY=originalSphereRadius*sin(centerAngle)/2*movementAmount/movementInterval;
    translate(translateX, translateY, 0);
    for (float phi=0;phi<PI;phi+=phiInterval) {
      for (float r=0;r<originalSphereRadius;r+=rInterval) {
        float x = originalSphereRadius*sin(phi)*cos(dataPoints.get(selectedIndex).getLowerBound());
        float y = originalSphereRadius*sin(phi)*sin(dataPoints.get(selectedIndex).getLowerBound());
        float z = originalSphereRadius*cos(phi);
        ArrayList<my3DPoint> points = new ArrayList<my3DPoint>();

        ArrayList<my3DPoint> transformations = new ArrayList<my3DPoint>();
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), -phiInterval, -rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), -phiInterval, 0));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), -phiInterval, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), 0, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), +phiInterval, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), +phiInterval, 0));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), +phiInterval, -rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getLowerBound(), 0, -rInterval));

        float tempr=r;
        if (r-rInterval<0) {
          x = (rInterval)*sin(phi)*cos(centerAngle);
          y = (rInterval)*sin(phi)*sin(centerAngle);
          tempr=rInterval;
        }

        if (r+rInterval>originalSphereRadius) {
          x = (originalSphereRadius-rInterval)*sin(phi)*cos(centerAngle);
          y = (originalSphereRadius-rInterval)*sin(phi)*sin(centerAngle);
          tempr=originalSphereRadius-rInterval;
        }

        if (phi+phiInterval>PI) {
          for (int i=0;i<transformations.size();i++) {
            if (transformations.get(i).getY()==phiInterval) {
              transformations.get(i).setY(PI-phi);
            }
          }
        }

        if (phi-phiInterval<0) {
          for (int i=0;i<transformations.size();i++) {
            if (transformations.get(i).getY()==-phiInterval) {
              transformations.get(i).setY(phi);
            }
          }
        }

        my3DPoint centerPoint = new my3DPoint(x, y, z);

        for (int i=0;i<transformations.size();i++) {
          points.add(convertToRectangular(dataPoints.get(selectedIndex).getLowerBound(), phi+transformations.get(i).getY(), tempr+transformations.get(i).getZ()));
        }

        for (int i=0;i<points.size()-1;i++) {
          myTriangle currentTriangle = new myTriangle(new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ())
            , new my3DPoint(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ())
            , new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ()));
          boolean alreadyDrawn=false;
          for (int k=0;k<allTriangles.size();k++) {
            if (currentTriangle.isEqual(allTriangles.get(k))) {
              alreadyDrawn=true;
              break;
            }
          }  
          if (!alreadyDrawn) {   
//            allTriangles.add(currentTriangle);     
            beginShape();
            vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
            vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
            vertex(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ());
            vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
            endShape();
          }
        }
        beginShape();
        vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
        vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
        vertex(points.get(points.size()-1).getX(), points.get(points.size()-1).getY(), points.get(points.size()-1).getZ());
        vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
        endShape();
      }
    }
  }
  popMatrix();




  pushMatrix();
  if (mouseClickedOnce && !home && textShrinkCounter>=maxTextShrinkCount && movementAmount>=movementInterval && movementCount>maxMovementCount) {
    float centerAngle=(dataPoints.get(selectedIndex).getUpperBound()+dataPoints.get(selectedIndex).getLowerBound())/2;
    float translateX=originalSphereRadius*cos(centerAngle)/2*movementAmount/movementInterval;
    float translateY=originalSphereRadius*sin(centerAngle)/2*movementAmount/movementInterval;
    translate(translateX, translateY, 0);
    fill(dataPoints.get(selectedIndex).getR(), dataPoints.get(selectedIndex).getG(), dataPoints.get(selectedIndex).getB());
    for (float phi=0;phi<PI;phi+=phiInterval) {
      for (float r=0;r<originalSphereRadius;r+=rInterval) {
        float x = originalSphereRadius*sin(phi)*cos(dataPoints.get(selectedIndex).getUpperBound());
        float y = originalSphereRadius*sin(phi)*sin(dataPoints.get(selectedIndex).getUpperBound());
        float z = originalSphereRadius*cos(phi);
        ArrayList<my3DPoint> points = new ArrayList<my3DPoint>();

        ArrayList<my3DPoint> transformations = new ArrayList<my3DPoint>();
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), -phiInterval, -rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), -phiInterval, 0));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), -phiInterval, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), 0, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), +phiInterval, rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), +phiInterval, 0));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), +phiInterval, -rInterval));
        transformations.add(new my3DPoint(dataPoints.get(selectedIndex).getUpperBound(), 0, -rInterval));

        float tempr=r;
        if (r-rInterval<0) {
          x = (rInterval)*sin(phi)*cos(centerAngle);
          y = (rInterval)*sin(phi)*sin(centerAngle);
          tempr=0;
        }

        if (r+rInterval>originalSphereRadius) {
          x = (originalSphereRadius-rInterval)*sin(phi)*cos(centerAngle);
          y = (originalSphereRadius-rInterval)*sin(phi)*sin(centerAngle);
          tempr=originalSphereRadius-rInterval;
        }

        if (phi+phiInterval>PI) {
          for (int i=0;i<transformations.size();i++) {
            if (transformations.get(i).getY()==phiInterval) {
              transformations.get(i).setY(PI-phi);
            }
          }
        }

        if (phi-phiInterval<0) {
          for (int i=0;i<transformations.size();i++) {
            if (transformations.get(i).getY()==-phiInterval) {
              transformations.get(i).setY(phi);
            }
          }
        }

        my3DPoint centerPoint = new my3DPoint(x, y, z);

        for (int i=0;i<transformations.size();i++) {
          points.add(convertToRectangular(dataPoints.get(selectedIndex).getUpperBound(), phi+transformations.get(i).getY(), tempr+transformations.get(i).getZ()));
        }

        for (int i=0;i<points.size()-1;i++) {
          myTriangle currentTriangle = new myTriangle(new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ())
            , new my3DPoint(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ())
            , new my3DPoint(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ()));
          boolean alreadyDrawn=false;
          for (int k=0;k<allTriangles.size();k++) {
            if (currentTriangle.isEqual(allTriangles.get(k))) {
              alreadyDrawn=true;
              break;
            }
          }  
          if (!alreadyDrawn) {   
//            allTriangles.add(currentTriangle);     
            beginShape();
            vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
            vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
            vertex(points.get(i+1).getX(), points.get(i+1).getY(), points.get(i+1).getZ());
            vertex(points.get(i).getX(), points.get(i).getY(), points.get(i).getZ());
            endShape();
          }
        }
        
        beginShape();
        vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
        vertex(centerPoint.getX(), centerPoint.getY(), centerPoint.getZ());
        vertex(points.get(points.size()-1).getX(), points.get(points.size()-1).getY(), points.get(points.size()-1).getZ());
        vertex(points.get(0).getX(), points.get(0).getY(), points.get(0).getZ());
        endShape();
      }
    }
  }
  popMatrix();

  popMatrix();


  pushMatrix();
  translate(3*width/5, height/6, 0);
  fill(255, 0, 0);
  stroke(255, 0, 0);

  ArrayList<myDataPoint> currentList;
  currentList=alphabetical;
  int counter=0;
  for (int i=currentList.size()-1;i>=0;i--) {  
    fill(currentList.get(i).getR(), 
    currentList.get(i).getG(), 
    currentList.get(i).getB());
    noStroke();
    pushMatrix();
    translate(20, 30+counter*(500/currentList.size()), -textShrinkCounter);
    box(15, 15, 15);
    popMatrix();

    fill(255);
    stroke(255);
    
    if(mouseClickedOnce && !home && currentList.get(i).getCategory().equals(dataPoints.get(selectedIndex).getCategory())){
       fill(255,0,0);
       stroke(255,0,0);
    }

    pushMatrix();
    textFont (createFont ((PFont.list())[12], 52));
    text(currentList.get(i).getCategory(), 70, 50+counter*(500/currentList.size()), -textShrinkCounter);
    popMatrix();
    counter++;
  }

  if (mouseClickedOnce && !home) {
    currentList=dataPoints.get(selectedIndex).getAllData();
    counter=0;
    for (int i=currentList.size()-1;i>=0;i--) {  
      fill(currentList.get(i).getR(), 
      currentList.get(i).getG(), 
      currentList.get(i).getB());
      noStroke();
      pushMatrix();
      translate(20, 30+counter*(500/currentList.size()), maxTextShrinkCount-textShrinkCounter);
      box(15, 15, 15);
      popMatrix();

      fill(255);
      stroke(255);      
      pushMatrix();
      textFont (createFont ((PFont.list())[12], 52));
      text(currentList.get(i).getCategory(), 70, 50+counter*(500/currentList.size()), maxTextShrinkCount-textShrinkCounter);
      popMatrix();
      counter++;
    }
  }
  popMatrix();

  if (mouseClickedOnce && !home && textShrinkCounter<maxTextShrinkCount) {
    textShrinkCounter+=maxTextShrinkCount/10;
  }

  if (mouseClickedOnce && home && textShrinkCounter>0) {
    textShrinkCounter-=maxTextShrinkCount/10;
  }
}


void mouseClicked() {
  mouseClickedOnce=true;
  loadPixels();
  color c = pixels[mouseX+mouseY*width];
  int minIndex=0;
  int minDifference=1000000000;
  for (int i=0;i<dataPoints.size();i++) {
    color c2 = color(dataPoints.get(i).getR(), dataPoints.get(i).getG(), dataPoints.get(i).getB());
    int dif=abs(c2-c);
    if (dif<minDifference) {
      minDifference=dif;
      minIndex=i;
    }
  }
  int dif = abs(backgroundColor-c);
  if (dif<minDifference) {
    home=true;
  }
  else if(home){
    movementCount=0;
    movementAmount=0;
    textShrinkCounter=0;
    home=false;
    selectedIndex=minIndex;
    movementInterval=dataPoints.get(selectedIndex).getPercentage()*15000;
    println((dataPoints.get(selectedIndex).getPercentage())*20000);
    maxMovementCount=(dataPoints.get(selectedIndex).getPercentage())*20000;
    println("Index: "+minIndex);
    println("Difference: "+minDifference);
  }
}

void keyPressed() {
  if (keyCode == DOWN) {
    xmag--;
  }
  if (keyCode == UP) {
    xmag++;
  }
  if (keyCode == LEFT) {
    ymag--;
  }
  if (keyCode == RIGHT) {
    ymag++;
  }
}

public my3DPoint convertToRectangular(float theta, float phi, float r) {
  float x=r*sin(phi)*cos(theta);
  float y=r*sin(phi)*sin(theta);
  float z=r*cos(phi);
  return new my3DPoint(x, y, z);
}

class myDataPoint {
  String category;
  float upperBound;
  float lowerBound;
  int amount;
  float percentage;
  float r;
  float g;
  float b;
  ArrayList<myDataPoint> includedData = new ArrayList<myDataPoint>();
  ArrayList<Integer> includedDataValue = new ArrayList<Integer>();
  ArrayList<myDataPoint> alphabeticalData = new ArrayList<myDataPoint>();

  myDataPoint(int a, String c) {
    amount=a;
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
    category=c;
  }

  float getR() {
    return r;
  }

  float getG() {
    return g;
  }

  float getB() {
    return b;
  }

  void setCategory(String c) {
    category=c;
  }

  String getCategory() {
    return category;
  }

  ArrayList<myDataPoint> getAllData() {
    return alphabeticalData;
  }

  myDataPoint getData(int index) {
    return includedData.get(index);
  }

  boolean hasData() {
    return !includedData.isEmpty();
  }

  void addPoint(int a, String s) {
    println("2nd LAYER");
    int total2=0;
    includedData.add(new myDataPoint(a, s));
    println(includedData.toString());
    for (int index=0;index<includedData.size();index++) {
      int minIndex=0;
      int minValue=10000000;
      for (int j=index;j<includedData.size();j++) {
        if (includedData.get(j).getAmount()<minValue) {
          minIndex=j;
          minValue=includedData.get(j).getAmount();
        }
      }
      myDataPoint temp = includedData.get(index);
      includedData.set(index, includedData.get(minIndex));
      includedData.set(minIndex, temp);
    }

    for (int i=0;i<includedData.size();i++) {
      total2+=includedData.get(i).getAmount();
    }

    //get percentages
    for (int i=0;i<includedData.size();i++) {
      includedData.get(i).setPercentage(total2);
    }

    //set bounds
    float lowerBound=0;
    float z=originalSphereRadius;
    float totalSurfaceArea=4*PI*pow(originalSphereRadius, 2)*percentage;
    for (int i=0;i<includedData.size();i++) {
      float surfaceArea=0;
      float zInterval=.78;
      while (surfaceArea<totalSurfaceArea*includedData.get (i).getPercentage()) {
        //        println("GOAL: "+totalSurfaceArea*includedData.get(i).getPercentage());
        float r=sqrt(pow(originalSphereRadius, 2)-pow(z, 2));
        surfaceArea=surfaceArea+2*PI*r*percentage;
        //        println();
        //        println("SA: "+surfaceArea);
        //        println("Z: "+z);
        //        println("R: "+r);
        //z=rcos(phi)
        z=z-zInterval;
      }
      float upperBound=acos(z/originalSphereRadius);
      //      float upperBound=lowerBound+PI*includedData.get(i).getPercentage();
      includedData.get(i).setLowerBound(lowerBound);
      includedData.get(i).setUpperBound(upperBound);
      println(lowerBound);
      println(upperBound);
      lowerBound=upperBound;
    }
    includedData.get(includedData.size()-1).setUpperBound(PI);

    //    for (int j=0;j<includedData.size();j++) {
    //      alphabeticalData.add(includedData.get(j));
    //    }

    alphabeticalData=new ArrayList<myDataPoint>(includedData);
    for (int count=0;count<2;count++) {
      for (int index=1;index<alphabeticalData.size();index++) {
        myDataPoint key = alphabeticalData.get(index);
        int j;
        for (j=index-1;j>=0 && alphabeticalData.get(j).getCategory().compareTo(key.getCategory())<0;j--) {
          alphabeticalData.set(j+1, alphabeticalData.get(j));
        }
        alphabeticalData.set(j+1, key);
      }
    }
  }

  void setPercentage(float total) {
    percentage=amount/total;
  }

  int getAmount() {
    return amount;
  }

  float getPercentage() {
    return percentage;
  }

  void setUpperBound(float u) {
    upperBound=u;
  }

  void setLowerBound(float u) {
    lowerBound=u;
  }

  float getUpperBound() {
    return upperBound;
  }

  float getLowerBound() {
    return lowerBound;
  }

  String toString() {
    return ""+amount;
  }
}

class myTriangle {
  my3DPoint p1;
  my3DPoint p2;
  my3DPoint p3;

  myTriangle(my3DPoint point1, my3DPoint point2, my3DPoint point3) {
    p1=point1;
    p2=point2;
    p3=point3;
  }

  boolean isEqual(myTriangle other) {
    return (p1.equals(other.p1) && p2.equals(other.p2) && p3.equals(other.p3)
      || p1.equals(other.p1) && p2.equals(other.p3) && p3.equals(other.p2)
      || p1.equals(other.p2) && p2.equals(other.p1) && p3.equals(other.p3)
      || p1.equals(other.p2) && p2.equals(other.p3) && p3.equals(other.p1)
      || p1.equals(other.p3) && p2.equals(other.p1) && p3.equals(other.p2)
      || p1.equals(other.p3) && p2.equals(other.p2) && p3.equals(other.p1));
  }
}

class my3DPoint {

  float x=0;
  float y=0;
  float z=0;

  my3DPoint(float x1, float y1, float z1) {
    x=x1;
    y=y1;
    z=z1;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getZ() {
    return z;
  }

  void setX(float f) {
    x=f;
  }

  void setY(float f) {
    y=f;
  }

  void setZ(float f) {
    z=f;
  }

  boolean isEqual(my3DPoint other) {
    return (x==other.x && y==other.y && z==other.z);
  }

  String toString() {
    return "("+x+", "+y+", "+z+")";
  }
}

