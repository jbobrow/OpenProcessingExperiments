
import java.util.Collections;
import geomerative.*;
ArrayList<Company> companyList = new ArrayList();
ArrayList<CompanyBin> binList = new ArrayList();
HashMap<String, CompanyBin> binHash = new HashMap();


int interval = 0;
String loadSector = "";
String[] sectors = {"Consumer D", "Consumer S", "Energy", "Financial", "Health", "Materials", "Other", "Producer", "Technology", "Utilities"};
int sectorIndex = 1;



void setup () {
  size(1400, 800);
  smooth(4);
  loadCompanies();
  getSectorSizes();
  Collections.sort(binList);
  Collections.reverse(binList);
}

void draw() {
  background(255);

  for (Company c:companyList) {
    c.update();
    c.render();
    //println(c.name);
  }
  loadBackground();
}


void loadCompanies() {
  String[] rows = loadStrings("companyFinal.csv");
  for (int i = 1; i < 494; i++) {
    Company c = new Company();
    c.fromCSV(rows[i].split(","));
    companyList.add(c);
    RG.init(this);
    RG.setPolygonizer(RG.ADAPTATIVE);
    String sector = c.sector;
    if ( binHash.containsKey(sector)) {
      CompanyBin bin = binHash.get(sector);
      bin.companyList.add(c);
    } 
    else {
      CompanyBin bin = new CompanyBin();
      bin.sector = sector;
      binHash.put(sector, bin);
      bin.companyList.add(c);
      binList.add(bin);
    }
  }
}


void sortBySector() {
  ///size
  for (int i = 0; i < binList.size(); i++) {
    CompanyBin bin = binList.get(i);
    println("in here tsfojn");
    println(bin.companyList.size());
    for (int j = 0 ; j < bin.companyList.size(); j++) {
      Company c = bin.companyList.get(j);
      interval = width/(bin.companyList.size()+1);
      println("I'm in here!");
      c.x = interval*(j+1);
      println(c.x);
      //set x and y according to interval
    }
  }
}


void getSectorSizes() {
  for (int i = 0; i < binList.size(); i++) {
    CompanyBin bin = binList.get(i);
    for (int j = 0 ; j < bin.companyList.size(); j++) {
      Company c = bin.companyList.get(j);
      c.sectorSize = bin.companyList.size();
    }
  }
}


void loadBackground() {
  stroke(0);
  fill(0);
  rect(0, height/2-5, width, 10);
  textSize(32);
  text("Corporation Contributions to Obama vs. Republican Presidental Candidates in 2012", 20, 40);
  text("Sector: " + loadSector, 20, 74);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      sectorIndex ++;
    }
    if (keyCode == LEFT) {
      sectorIndex --;
    }
  }
  if (sectorIndex >= sectors.length) {
    sectorIndex = 1;
  }
  if (sectorIndex < 1) {
    sectorIndex = 9;
  }
  loadSector = sectors[sectorIndex];
  loadSector();
}


void loadSector() {
  int i = 1;
  for (Company c:companyList) {
    if (loadSector.equals(c.sector)) {
      c.hideArrow = false;
      float interval = width/(c.sectorSize + 1);
      c.pos.x = int(interval*i);
      c.targetRecHeight = map(c.percent, -100 , 100, 300, -300); 
      c.targetRecAlpha = 255;
      i++;
    } 
    else { 
      c.targetRecHeight = 0;
      c.targetRecAlpha = 0;
      c.hideArrow = true;
    }
  }
}




class Company {
  String sector;
  String name;
  float percent;
  float points;
  float individualObama;
  float individualRep;
  float pacObama;
  float pacRep;
  RShape arrow;
  int sectorSize;
  int x;
  int y = int(height/2);
  PVector pos = new PVector(x, y);
  PVector targetPos = new PVector();

  float recHeight = 0;
  float targetRecHeight;
  float recAlpha = 0;
  float targetRecAlpha;

  float r = 0;
  float b = 0;


  boolean hideArrow = true;
  boolean highlight = false;
  boolean isInside = false;
  boolean hidden = false;
  boolean showInfo = false;


  void render() {
    if (!hideArrow) {
      //arrow = RG.loadShape("upArrow.svg");
      //arrow.setFill(true);
      pushMatrix();
      {
        //println(scaling);
        //scale(scaling);
        translate(pos.x, height/2);
        //arrow.children[0].draw();
        noStroke();
        r = individualRep;
        b = individualObama;
        fill(r, 0, b, recAlpha);
        rect(0, 0, 10, recHeight); 
        pushMatrix(); {
          rotate(PI/2);
          //text(name, -textWidth(name)/2, recHeight+30);
          fill(0);
          textSize(12);
          float textPos = (percent < 0) ? 10: recHeight + 10;
          text(name + " " + nf(percent, 0, 2), recHeight + 10, 0);
          //text(name, recHeight+30, -textWidth(name)/2);
        }
        popMatrix();
        if (mouseX > pos.x-6 && mouseX < pos.x+6) {
          if (mouseY > recHeight + 10 + height/2 && mouseY < recHeight+ height/2 + textWidth(name + " " + nf(percent, 0, 2)) + 10) {
            textSize(18);
            text(name, -pos.x + width/2 - 200, -200 - 18);
            text("Individual Contributions to Obama: " + individualObama, -pos.x + width/2 - 200, -200);
            //text("PAC Contributions to Obama: " + pacObama, - textWidth(name)/2, recHeight + 40 + 18*2);
            text("Individual Contributions to the Republican Party: " + individualRep,  -pos.x + width/2 - 200, -200 + 18);
            //text("PAC Contributions to the Republican Party: " + pacRep, - textWidth(name)/2, recHeight + 40 + 18*4);
          }
        }
      }
      popMatrix();
    }
  }



  void update() {
    //scaling = lerp(scaling, targetScaling, .1);
    recHeight = lerp(recHeight, targetRecHeight, .1);
    recAlpha = lerp(recAlpha, targetRecAlpha, .1);
  }


  void fromCSV(String[] input) {
    sector = input[0];
    name = input[1];
    percent = float(input[4]);
    //points = float(input[3]);
    individualObama = float(input[2]);
    individualRep = float(input[3]);
    //pacObama = float(input[6]);
    //pacRep = float(input[7]);
  }
}



class CompanyBin implements Comparable {
  
  String sector;
  ArrayList<Company> companyList = new ArrayList();
  
  
  int compareTo(Object o) {
    int r = companyList.size() - ((CompanyBin) o).companyList.size();
    return(r);
  }
}


