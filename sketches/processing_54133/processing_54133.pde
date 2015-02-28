
class MapCoords {
  int n;
  Location loc[];
  String name;

  MapCoords(String filename) {
    String data[] = loadStrings(filename);

    n=data.length-1; // first line is a comment
    loc=new Location[n];

    for (int i=1; i<data.length; i++) { // start from line 1
      println(i+" "+data[i]);

      // get tokens from line
      String token[]=split(data[i], ",");
      for (int j=0; j<token.length; j++) println(j+" '"+token[j]+"'");       

      // parse token 0 and 1 into float
      float lat=float(token[0]);
      float lon=float(token[1]);
      name = token[4];
      // create a Location from lat and lon values
      loc[i-1]=new Location(lat, lon);
    }
  }
}


