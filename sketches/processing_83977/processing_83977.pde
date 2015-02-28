
void loadData() {
  eachState = new ArrayList <String>();
  states = new ArrayList<PieChart>();

  String[] allData = loadStrings("data.txt");


  for (int i=0; i<allData.length; i++) {
    String[] parseData = split(allData[i], "|||");
  slicePosition = new PVector();
    String tempN = parseData[0];//name ->effects color
    String tempS = parseData[1];//state ->effects start & stop of arc
    String tempT = parseData[2];//time ->effects diameter

    for (int j=0; j<nameState.length; j++) {
      if (nameState[j].equals(trim(tempS))) {
        slicePosition.x = (180+ (180/nameState.length)*j)+1;
        slicePosition.y = (180+ (180/nameState.length)*(j+1))-1;
        //println(slicePosition.x);
        //println(slicePosition.y);
      }
    }

    ////////////parsing the dates into 1-36///////////////////
    int t = int(tempT);
    if (t <= 1031) {
      t=t - 1000;
    }
    else if (t >=1100) {
      t=t - 1100 +31;
    }

    tempStates = new PieChart(tempN, tempS, (t*20), slicePosition.x, slicePosition.y);
    states.add(i, tempStates);//<--------------------------------add into arraylist
  }
}


void pieBackground() {
  strokeWeight(.5);
  stroke(0, 100);
  int r = 20;
  pushMatrix();
  translate(width/2, height-210);
  for (int i=0; i<10; i++) {
    if (selectedState == i && full) {
      fill(105,105,105);
      arc(0,0,width-20, width-20, radians(180), radians(200));
      fill(249,215,170);
      arc(0,0,width-170, width-170, radians(180), radians(200));
      noFill(); 
    }
    line(0, 0, -(width/2 - 10), 0);
    rotate(radians(r));
  }
  popMatrix();
  arc(width/2, height-210, width-20, width-20, radians(180), radians(360));
  int space = 170;
  for (int i=0; i<36; i++) {
    int s = 20;
    arc(width/2, height-210, width-space, width-space, radians(180), radians(360));
    space = space+s;
  }
}

void stateName() {
  int r = -80;
  pushMatrix();
  translate(width/2, height-210);
  for (int i=0; i<stateName.length; i++) {
    if (getState() == i && full) {  
//      fill(255, 170, 20);
      fill(200,200,200);
      textSize(28);
    }
    else {
      fill(98);
      textSize(20);
    }

    pushMatrix();
    rotate(radians(r));
    //fill(98);
    //textSize(20);
    textAlign(CENTER);
    text(stateName[i], 0, -height/2-18 );
    popMatrix();
    noFill();
    r+=20;
  }
  popMatrix();
}



void mouseReleased() {
  full = !full;
}

int getState() {
  float d = mouseDist();
  if (mouseY < originY && 0 < d && d < width/2 - 20) {
    return 8-(int)(mouseAngle()*9/PI);
  }
  return -1;
}

float mouseDist() {
  return dist(mouseX, mouseY, originX, originY);
}

float mouseAngle() {
  return acos((mouseX-originX)/mouseDist());
}

//void keyReleased() {
//  switch(key) {
//  case 's':
//    shake = !shake;
//    break;
//  }
//}


