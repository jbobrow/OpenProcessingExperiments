
public class CSV {
  String[] lines;
  Date date = new Date();
  int pointer = -1;
  int[] monthDays = {
    31, 
    28, 
    31, 
    30, 
    31, 
    30, 
    31, 
    31, 
    30, 
    31, 
    30, 
    31
  };
  public CSV() {
    lines = loadStrings("data.csv");

    if (year() % 4 == 0) monthDays[1] += 1;
  }

  public boolean hasNext() {
    try {
      String line = lines[pointer+1];
    } 
    catch (Exception e) {
      return false;
    }
    return true;
  }

  public String[] getNext() {
    String line;
    if (pointer <= lines.length) {
      pointer++;
      return lines[pointer].split(",");
    }
    return null;
  }

  public String getPlantName() {
    return lines[pointer].split(",")[0];
  }

  public int getWinterWatering() {
    return Integer.parseInt(lines[pointer].split(",")[1]);
  }

  public int getSpringWatering() {
    return Integer.parseInt(lines[pointer].split(",")[2]);
  }

  public int getSummerWatering() {
    return Integer.parseInt(lines[pointer].split(",")[3]);
  }

  public int getAutumnWatering() {
    return Integer.parseInt(lines[pointer].split(",")[4]);
  }

  public String getPruningSeason() {
    return lines[pointer].split(",")[5];
  }

  public int getIronMonths() {
    return Integer.parseInt(lines[pointer].split(",")[6]);
  }

  public int getVitaminMonths() {
    return Integer.parseInt(lines[pointer].split(",")[7]);
  }

  public int getWaterDay() {
    return Integer.parseInt(lines[pointer].split(",")[8]);
  }

  public int getWaterMonth() {
    return Integer.parseInt(lines[pointer].split(",")[9]);
  }

  public int getWaterYear() {
    return Integer.parseInt(lines[pointer].split(",")[10]);
  }

  public int getIronDay() {
    return Integer.parseInt(lines[pointer].split(",")[11]);
  }

  public int getIronMonth() {
    return Integer.parseInt(lines[pointer].split(",")[12]);
  }

  public int getIronYear() {
    return Integer.parseInt(lines[pointer].split(",")[13]);
  }

  public int getVitaminDay() {
    return Integer.parseInt(lines[pointer].split(",")[14]);
  }

  public int getVitaminMonth() {
    return Integer.parseInt(lines[pointer].split(",")[15]);
  }

  public int getVitaminYear() {
    return Integer.parseInt(lines[pointer].split(",")[16]);
  }
  
  public int getCurrentWatering() {
    String season = getCurrentSeason();
    int daysBetweenWatering = 0;
    if (season.equals("Summer")) {
      return getSummerWatering();
    } 
    else if (season.equals("Winter")) {
      return getWinterWatering();
    } 
    else if (season.equals("Autumn")) {
      return getAutumnWatering();
    } 
    else if (season.equals("Spring")) {
      return getSpringWatering();
    }
    return 0;
  }

  /**
   @return true if needs watering, false otherwise.
   */
  public boolean needsWatering() {
    if (year() != getWaterYear()) return false;
    String season = getCurrentSeason();
    int daysBetweenWatering = 0;
    if (season.equals("Summer")) {
      daysBetweenWatering = getSummerWatering();
    } 
    else if (season.equals("Winter")) {
      daysBetweenWatering = getWinterWatering();
    } 
    else if (season.equals("Autumn")) {
      daysBetweenWatering = getAutumnWatering();
    } 
    else if (season.equals("Spring")) {
      daysBetweenWatering = getSpringWatering();
    }
    if(daysBetweenWatering == 0) return false;
    int daysToThisMonth = monthDays[getWaterMonth()-1] - getWaterDay();
    if (monthDifference() && day()+daysToThisMonth < daysBetweenWatering) {
      return false;
    }
    if (month() == getWaterMonth() && day()-getWaterDay() < daysBetweenWatering) {
      return false;
    }
    return true;
  }
  
  public boolean needsIron() {
    if(month() - getIronMonth() >= getIronMonths()) return true;
    return false;
  }
  
  public boolean needsVitamin() {
    if(month() - getVitaminMonth() >= getVitaminMonths()) return true;
    return false;
  }
  
  public boolean pruningSeason() {
    String season = getCurrentSeason();
    if(season.equals(getPruningSeason())) {
      return true;
    }
    return false;
  }
  
  public void reset() {
    this.pointer = -1;
  }

  public void writeCurrentDate(int lineNo, int type) {
    String[] line = lines[lineNo].split(",");
    /*
    type
    0 - water
    1 - iron
    2 - vitamin
    */
    if(type == 2) {
      line[line.length - 1] = String.valueOf(year());
      line[line.length - 2] = String.valueOf(month());
      line[line.length - 3] = String.valueOf(day());
    } else if(type == 1) {
      line[line.length - 4] = String.valueOf(year());
      line[line.length - 5] = String.valueOf(month());
      line[line.length - 6] = String.valueOf(day());
    } else if(type == 0) {
      line[line.length - 7] = String.valueOf(year());
      line[line.length - 8] = String.valueOf(month());
      line[line.length - 9] = String.valueOf(day());
    }
    String lineString = arrayToString(line);
    System.out.println(lineString);
    String[] tempLines = new String[lines.length];

    for (int i = 0; i < lines.length; i++) {
      tempLines[i] = lines[i];
      if (i == lineNo) {
        tempLines[lineNo] = lineString;
      }
    }
    
    for(int j = 0; j < tempLines.length; j++) {
      System.out.println("\t" + tempLines[j]);
    }
    saveStrings("data/data.csv", tempLines);
  }

  private String arrayToString(String[] input) {
    String temp = "";
    for (int i = 0; i < input.length; i++) {
      temp += input[i];
      temp += ",";
    }
    temp = temp.substring(0, temp.length() - 1);
    return temp;
  }

  private String getCurrentSeason() {
    if (month() >= 3 && month() <= 5) {
      return "Spring";
    } 
    else if (month() >= 6 && month() <= 8) {
      return "Summer";
    } 
    else if (month() >= 9 && month() <= 11) {
      return "Autumn";
    } 
    else {
      return "Winter";
    }
  }
  
  public String getWaterDateDiff() {
    int diff = getCurrentWatering() - date.datediff(new Date(getWaterDay(), getWaterMonth(), getWaterYear()), new Date(day(), month(), year()));
    if(diff < 0) {
      return Math.abs(diff) + " days ago";
    } else if(diff == 0) {
      return "Today";
    } else if(diff == 1) {
      return "Tomorrow";
    } else {
      return "In " + Math.abs(diff) + " days";
    }
  }
  
  public String getIronDateDiff() {
    int diff = date.monthDiff(getIronMonth(), month());
    if(diff < 0) {
      return Math.abs(diff) + " months ago";
    } else if(diff == 0) {
      return "This month";
    } else if(diff == 1) {
      return "Next month";
    } else {
      return "In " + Math.abs(diff) + " months";
    }
  }
  
  public String getVitaminDateDiff() {
    int diff = date.monthDiff(getVitaminMonth(), month());
    if(diff < 0) {
      return Math.abs(diff) + " months ago";
    } else if(diff == 0) {
      return "This month";
    } else if(diff == 1) {
      return "Next month";
    } else {
      return "In " + Math.abs(diff) + " months";
    }
  }

  private boolean monthDifference() {
    if (Math.abs(month()-getWaterMonth()) == 1) return true;
    return false;
  }
  
  public int getPlantNumber() {
    if(getPlantName().equals("Orange")) {
      return 0;
    } else if(getPlantName().equals("Olive")) {
      return 1;
    } else if(getPlantName().equals("Grapevine")) {
      return 2;
    } else if(getPlantName().equals("Khaki")) {
      return 3;
    } else if(getPlantName().equals("Peach")) {
      return 4;
    } else if(getPlantName().equals("Plum")) {
      return 5;
    } else if(getPlantName().equals("Medlar")) {
      return 6;
    } else if(getPlantName().equals("Strawberry")) {
      return 7;
    }
    return 8;
  }
}


