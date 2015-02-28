
void setup()
{
  size (140, 900);
}
 void draw()
  {
text("1:1 scale with pixels", 10, 50);    
text("Average Rainfall", 10, 90);    
line(10,100, 10, 100+average(rain));
line(20,100, 20, 100+average(rain1));
line(30,100, 30, 100+average(rain2));
line(40,100, 40, 100+average(rain3));
line(50,100, 50, 100+average(rain4));
line(60,100, 60, 100+average(rain5));
line(70,100, 70, 100+average(rain6));
line(80,100, 80, 100+average(rain7));
line(90,100, 90, 100+average(rain8));
line(100,100, 100, 100+average(rain9));
line(110,100, 110, 100+average(rain10));
line(120,100, 120, 100+average(rain11));
//             
text("Minimun Temperature", 10, 390); 
line(10,400, 10, 400+average(tmin));
line(20,400, 20, 400+average(tmin1));
line(30,400, 30, 400+average(tmin2));
line(40,400, 40, 400+average(tmin3));
line(50,400, 50, 400+average(tmin4));
line(60,400, 60, 400+average(tmin5));
line(70,400, 70, 400+average(tmin6));
line(80,400, 80, 400+average(tmin7));
line(90,400, 90, 400+average(tmin8));
line(100,400, 100, 400+average(tmin9));
line(110,400, 110, 400+average(tmin10));
line(120,400, 120, 400+average(tmin11));
//
text("Maximum Temperature", 10, 690); 
line(10,700, 10, 700+average(tmax));
line(20,700, 20, 700+average(tmax1));
line(30,700, 30, 700+average(tmax2));
line(40,700, 40, 700+average(tmax3));
line(50,700, 50, 700+average(tmax4));
line(60,700, 60, 700+average(tmax5));
line(70,700, 70, 700+average(tmax6));
line(80,700, 80, 700+average(tmax7));
line(90,700, 90, 700+average(tmax8));
line(100,700, 100, 700+average(tmax9));
line(110,700, 110, 700+average(tmax10));
line(120,700, 120, 700+average(tmax11));

  }
 String url = URLforSite("Durham");

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

 //creates arrays for each month
  int[] rain = subsetValues(data, "mm", "1", "rain");
  int[] rain1 = subsetValues(data, "mm", "2", "rain");
  int[] rain2 = subsetValues(data, "mm", "3", "rain");
  int[] rain3 = subsetValues(data, "mm", "4", "rain");
  int[] rain4 = subsetValues(data, "mm", "5", "rain");
  int[] rain5 = subsetValues(data, "mm", "6", "rain");
  int[] rain6 = subsetValues(data, "mm", "7", "rain");
  int[] rain7 = subsetValues(data, "mm", "8", "rain");
  int[] rain8 = subsetValues(data, "mm", "9", "rain");
  int[] rain9 = subsetValues(data, "mm", "10", "rain");
  int[] rain10 = subsetValues(data, "mm", "11", "rain");
  int[] rain11 = subsetValues(data, "mm", "12", "rain");
//
  int[] tmin = subsetValues(data, "mm", "1", "tmin");
  int[] tmin1 = subsetValues(data, "mm", "2", "tmin");
  int[] tmin2 = subsetValues(data, "mm", "3", "tmin");
  int[] tmin3 = subsetValues(data, "mm", "4", "tmin");
  int[] tmin4 = subsetValues(data, "mm", "5", "tmin");
  int[] tmin5 = subsetValues(data, "mm", "6", "tmin");
  int[] tmin6 = subsetValues(data, "mm", "7", "tmin");
  int[] tmin7 = subsetValues(data, "mm", "8", "tmin");
  int[] tmin8 = subsetValues(data, "mm", "9", "tmin");
  int[] tmin9 = subsetValues(data, "mm", "10", "tmin");
  int[] tmin10 = subsetValues(data, "mm", "11", "tmin");
  int[] tmin11 = subsetValues(data, "mm", "12", "tmin");
//
  int[] tmax = subsetValues(data, "mm", "1", "tmax");
  int[] tmax1 = subsetValues(data, "mm", "2", "tmax");
  int[] tmax2 = subsetValues(data, "mm", "3", "tmax");
  int[] tmax3 = subsetValues(data, "mm", "4", "tmax");
  int[] tmax4 = subsetValues(data, "mm", "5", "tmax");
  int[] tmax5 = subsetValues(data, "mm", "6", "tmax");
  int[] tmax6 = subsetValues(data, "mm", "7", "tmax");
  int[] tmax7 = subsetValues(data, "mm", "8", "tmax");
  int[] tmax8 = subsetValues(data, "mm", "9", "tmax");
  int[] tmax9 = subsetValues(data, "mm", "10", "tmax");
  int[] tmax10 = subsetValues(data, "mm", "11", "tmax");
  int[] tmax11 = subsetValues(data, "mm", "12", "tmax");
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

//calculates the averages of arrays
int average(int[] array)
{
  int num =0;
    for (int i=0 ; i<array.length; i++){
      num = num + array[i];
    }
      return num/array.length;
  }


