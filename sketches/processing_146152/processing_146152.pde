




void setup()
{
  size (140, 900);
 for(int m = 0 ; m<12 ; m++) rain[m]=subsetValues(data, "mm", str(m+1), "rain");
 for(int m = 0 ; m<12 ; m++) tmin[m]=subsetValues(data, "mm", str(m+1), "tmin");
 for(int m = 0 ; m<12 ; m++) tmax[m]=subsetValues(data, "mm", str(m+1), "tmax");
}

 void draw()
  {
text("1:1 scale with pixels", 10, 50);    
text("Average Rainfall", 10, 90);   
 
  for (int m = 0 ; m<12 ; m++) 
  {
    int x = m*10+10;
    line(x,100, x,100+(average(rain[m])));
  }

   
text("Minimun Temperature", 10, 390); 
  for (int m = 0 ; m<12 ; m++) 
  {
    int x = m*10+10;
    line(x,400, x,400+(average(tmin[m])));
  }


text("Maximum Temperature", 10, 690); 

      for (int m = 0 ; m<12 ; m++) 
  {
    int x = m*10+10;
    line(x,700, x,700+(average(tmax[m])));
  }
    
    
    
    
  }
 String url = URLforSite("Durham");


  String[] source = loadStrings(url);
  Table data = loadClimateData(source);



 /**creates arrays**/
  
  int[][] rain = new int[12][0];
  int[][] tmin = new int[12][0];
  int[][] tmax = new int[12][0];

String URLforSite(String site)
{
  return "http://www.metoffice.gov.uk/"+
    "pub/data/weather/uk/climate/stationdata/"+
    site.toLowerCase()+
    "data.txt";
}

String[] sitelist = {
  "aberporth", "armagh", "ballypatrick", "bradford", 
  "braemar", "camborne", "cambridge", "cardiff", 
  "chivenor", "cwmystwyth", "dunstaffnage", "durham", 
  "eastbourne", "eskdalemuir", "heathrow", "hurn", 
  "lerwick", "leuchars", "lowestoft", "manston", 
  "nairn", "newtonrigg", "oxford", "paisley", 
  "ringway", "rossonwye", "shawbury", "sheffield", 
  "southampton", "stornoway", "suttonbonington", "tiree", 
  "valley", "waddington", "whitby", 
  "wickairport", "yeovilton"
};


Table loadClimateData(String[] raw)
{
  Table climate = new Table();
  String head[] = splitTokens(raw[5]);
  for (String h : head) climate.addColumn(h);

  raw = subset(raw, 7);
  for (String r : raw ) {
    TableRow row = climate.addRow();
    String data[] = splitTokens(r, "#* ");
    for (int c=0 ; c<head.length ; c++) {
      row.setString(head[c], data[c].equals("---")?"0":data[c]);
    }
  }
  return climate;
}



int[] subsetValues(Table tab, String select, String value, String field)
{
 int[] data = new int[0];
  for (TableRow r : tab.findRows(value,select)) {
    data = append(data, r.getInt(field));
  }
  return data;
}
/**calculates the averages of arrays**/
int average(int[] array)
{
  int num =0;
    for (int i=0 ; i<array.length; i++){
      num = num + array[i];
    }
      return num/array.length;
  }


