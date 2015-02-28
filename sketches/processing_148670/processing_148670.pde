
void setup()
{
  size(200,1000);
}
void draw()
{
  String url = URLforSite("Durham");
  
  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);
  
  String[] sun = subsetValues(data, "yyyy", "2012", "sun");
  float[] hourssun = float(sun);
  
  println("values "+ hourssun.length);
  println("max "+ max(hourssun));
  println("min "+ min(hourssun));
}

  
String lines[] = loadStrings("durhamdata.txt");


float rain[] = new float[ lines.length ];


{
  String data = trim(lines[i]);
  String field [] = splitTokens(data);
  float value[] = float(field);
  rain[i] = value[5];
}

int first = 26;
int points = 40;

float plots[] = subset(rain, first, points);



{
  float x = map(i, 0,plots.length, 10,width-10);
  float y = map(plots[i], min(plots),max(plots), height-10,10);
  line(x,y,x,height-10);
}
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

String[] subsetValues(Table tab, String select, String value, String field)
{
  String[] data = new String[0];
  for (TableRow r : tab.findRows(value,select)) {
    data = append(data, r.getString(field));
  }
  return data;
}



