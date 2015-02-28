
private ArrayList<DataPoint> data;
int maxScreenHeight;
int maxScreenWidth;

private long minPop = (long)90000000000000000000.0; //over 9000 (actually)
private long maxPop = -1;
private int minYear = 90000000;
private int maxYear = -1;

public boolean loadData(String file) {
  maxScreenHeight = height - 100;
  maxScreenWidth = width - 100;
  
  data = new ArrayList<DataPoint>();
  String[] rawData = loadStrings(file);

  int popIndex = -1;
  int yearIndex = -1;

  String header = rawData[0];
  header.replaceAll(" ", "");
  String[] headers = header.split(",");
  for (int i = 0; i < headers.length; i++) {
    if ("population".equals(headers[i].toLowerCase()) || "pop".equals(headers[i].toLowerCase())) {
      popIndex = i;
    }
    else if ("year".equals(headers[i].toLowerCase()) || "year".equals(headers[i].toLowerCase())) {
      yearIndex = i;
    }
  }

  for (int i = 1; i < rawData.length; i++) {
    //add method to remove "," from " "
    String lineData = rawData[i];
    String fixedLine = "";

    int quoteCount = 0;
    for (int j = 0; j < lineData.length(); j++) {
      if (lineData.charAt(j) == ',' && quoteCount%2 == 1) {
        fixedLine += " ";
      }
      else {
        fixedLine += lineData.charAt(j);
      }

      if (lineData.charAt(j) == '"') {
        quoteCount++;
      }
    }
    

    String[] fixedData = fixedLine.replaceAll(" ", "").split(",");
    data.add(new DataPoint(Long.parseLong(fixedData[popIndex]), Integer.parseInt(fixedData[yearIndex])));
  }

  for (int i = 0; i < data.size(); i++) {
    if (data.get(i).getYear() > maxYear) {
      maxYear = data.get(i).getYear();
    }
    if (data.get(i).getPop() > maxPop) {
      maxPop = data.get(i).getPop();
    }
    if (data.get(i).getYear() < minYear) {
      minYear = data.get(i).getYear();
    }
    if (data.get(i).getPop() < minPop) {
      minPop = data.get(i).getPop();
    }
  }
  
  return true;
}

int showMaxYear;
long showMaxPop;

public void drawData(int showYear) {
  showMaxYear = data.get((showYear >= data.size() ? data.size() - 1 : showYear)).getYear();
  showMaxPop = data.get((showYear >= data.size() ? data.size() - 1 : showYear)).getPop();
  
  if (data == null) {
    return;
  }
  for (int i = showYear; i < data.size(); i++) {
    pushMatrix();
    translate(map(data.get(i).getYear(), minYear, showMaxYear, 0, maxScreenWidth) + 50, height - map(data.get(i).getPop(), minPop, showMaxPop, 10, maxScreenHeight) - 50);
    colorMode(HSB);
    fill(map(data.get(i).getPop(), minPop, maxPop, 70, 0), 200, 200);
    //fill(120, 200, 200);
    rectMode(CORNER);
    rect(0, 0, maxScreenWidth/((showMaxYear - minYear) == 0 ? 1 : (showMaxYear - minYear)), map(data.get(i).getPop(), minPop, showMaxPop, 10, maxScreenHeight));
    popMatrix();
  }
 
 stroke(255);
 strokeWeight(5);
 
 //axis
 line(50, height - 50, width - 50 + 10, height - 50);
 line(50 - 2, height - 50, 50 - 2, 50);
 
 //labels
 //Years
 textAlign(CENTER);
 textFont(a_aaron, 25);
 fill(255);
 text("" + minYear, 60, height - 25);
 text("" + showMaxYear, width - 50, height - 25);  
 
 //Population
 pushMatrix();
 translate(25, height - 60);
 rotate(radians(-90));
 
 //calculate poplation in millions to 3 digits
 float milMaxPop;
 if(showMaxPop > 100*1000*1000 - 1){
   milMaxPop = (((long)((showMaxPop*1.0)/1000000))*1.0); //TODO change so numbers with .0 decimal ending have no decimal (i.e. 310.0 -> 310)
 }
 else if(showMaxPop > 10*1000*1000 - 1){
   milMaxPop = (((long)((showMaxPop*1.0)/100000))*1.0/10);
 }
 else{
   milMaxPop = (((long)((showMaxPop*1.0)/10000))*1.0/100);
 }

 float milMinPop = (((long)((minPop*1.0)/10000))*1.0)/100; //assuming minimum population stays the same
 textFont(a_aaron, 25);
 text("" + milMinPop, 0, 0);
 popMatrix();
 
 
 pushMatrix();
 translate(25, 50);
 rotate(radians(-90));
 text("" + milMaxPop, 0, 0);
 popMatrix();
 
 //x-axis label
 pushMatrix();
 translate(width/2, height - 10);
 text("Years", 0, 0); 
 popMatrix();
 
 //y-axis label
 pushMatrix();
 translate(25, height/2);
 rotate(radians(-90));
 text("Population (in millions)", 0, 0); 
 popMatrix();
 
 //reset stroke and weight
 stroke(0);
 strokeWeight(1);
 
}

class DataPoint {
  long population;
  int years;

  public DataPoint(long pop, int year1) {
    population = pop;
    years = year1;
  }

  public long getPop() {
    return population;
  }

  public int getYear() {
    return years;
  }
}


