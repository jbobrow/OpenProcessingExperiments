
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

float sum(float[] data)
{
  float sum = 0;
  for (float v : data) sum+=v;
  return sum;
}
float mean(float[] data)
{
  return sum(data)/data.length;
}

void setup()
{
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  String[] rain = subsetValues(data, "yyyy", "2012", "rain");
  String[] tmax = subsetValues(data, "yyyy", "2012", "tmax");
  String[] tmin = subsetValues(data, "yyyy", "2012", "tmin");
  float[] rainfall = float(rain);
  float[] maxtemp = float(tmax);
  float[] mintemp = float(tmin);

  println("values "+ rainfall.length);
  println("Max Temperature = "+ max(maxtemp));
  println("Min Temperature = "+ min(mintemp));
  println("Average Rainfaill = "+max(rainfall));
}

void draw()
{
  
}
