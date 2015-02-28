
int itr=0;
int mode;


class grab {
  String[] lines;

  grab() {
  }
  public void loadOurStrings(int id) {
  }
  public String[] grabIt(String url, String splitStr) {
    float lon = 0;
    float lat = 0;
    boolean done = false;
    lines = loadStrings(url);
    String[] resarray = new String[2000];
    int num=0;

    for (int i=0; i<lines.length;i++) {
      if (match(lines[i], Pattern.quote(splitStr)) != null)
      {
        lon = float(split(split(lines[i], splitStr)[1], ",")[0]);
        lat = float(split(split(lines[i], splitStr)[1], ",")[1]);
        resarray[num] = lon+" "+lat;
        num++;
      }
    }
    return resarray;
  }
}


class dataHandle {
  String[] lines;
  float lon=0;
  float lat=0;
        String title = "";
        String area = "";
        String details = "";

  dataHandle() {
  }
  public void loadOurStrings() {
    lines = loadStrings("doc.kml");
    for (int i=0; i<lines.length;i++) {
      if (match(lines[i], Pattern.quote("CDATA")) != null)
      {
        title = (split(split(lines[i],">")[4],"<")[0])+"";
        area = (split(split(lines[i],">")[8],"<")[0])+"";
        details = (split(split(lines[i],">")[10],"<")[0])+"";
      //  println(title+"\n");
      //  println(split(lines[i],">")[8]);
      //  println(split(lines[i],">")[10]);
      }
      if (match(lines[i], Pattern.quote("<coordinates>")) != null)
      {
        
        lon = float(split(split(lines[i], "<coordinates>")[1], ",")[0]);
        lat = float(split(split(lines[i], "<coordinates>")[1], ",")[1]);
        
       // println(lon+" "+lat);

      
        locations[maps][0] = lat;
        locations[maps][1] = lon;
      //  println(maps);
      //  println(newGrid.ourLocs.length);
    //println(title+" - "+area+" - "+details);
        newGrid.ourLocs[maps] = new location(lon,lat,title,area,details);
        title="";
        area="";
        details="";
        maps++;
      }
    }
  }
  public String[] grabIt(String url, String splitStr) {
    float lon = 0;
    float lat = 0;
    boolean done = false;
    lines = loadStrings(url);
    String[] resarray = new String[2000];
    // println("URL: "+url);
    int num=0;

    for (int i=0; i<lines.length;i++) {
      if (match(lines[i], Pattern.quote(splitStr)) != null)
      {
        //  println(lines[i]+" - "+splitStr);
        //  println(split(lines[i], splitStr)[1]);
        lon = float(split(split(lines[i], splitStr)[1], ",")[0]);
        lat = float(split(split(lines[i], splitStr)[1], ",")[1]);
        //  println("Length: "+resarray.length);
        resarray[num] = lon+" "+lat;
        //   println("Array: "+resarray[num]);
        num++;
      }
    }
    return resarray;
  }
}


