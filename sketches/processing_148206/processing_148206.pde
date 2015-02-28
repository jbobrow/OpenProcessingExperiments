
float[] maximumtemperatureJan,maximumtemperatureFeb,maximumtemperatureMar,maximumtemperatureApr,maximumtemperatureMay,maximumtemperatureJun,maximumtemperatureJul,maximumtemperatureAug,maximumtemperatureSept,maximumtemperatureOct,maximumtemperatureNov,maximumtemperatureDec;
float[] rainJan,rainFeb,rainMar,rainApr,rainMay,rainJun,rainJul,rainAug,rainSept,rainOct,rainNov,rainDec;
float[] minJan,minFeb,minMar,minApr,minMay,minJun,minJul,minAug,minSept,minOct,minNov,minDec;
float[] maximumavg = new float[12];
float[] rainavg = new float[12];
float[] minimumavg = new float[12];
 
void setup()
{
  size(800,800);
  String url = URLforSite("oxford");
  String[] source = loadStrings(url);
  Table data = loadClimateData(source);
  String[] maxTempJan = subsetValues(data, "mm", "1", "tmax");
  maximumtemperatureJan = float(maxTempJan);
  maximumavg[0] = mean(maximumtemperatureJan);
  String[] maxTempFeb = subsetValues(data, "mm", "2", "tmax");
  maximumtemperatureFeb = float(maxTempFeb);
  maximumavg[1] = mean(maximumtemperatureFeb);
  String[] maxTempMar = subsetValues(data, "mm", "3", "tmax");
  maximumtemperatureMar = float(maxTempMar);
  maximumavg[2]= mean(maximumtemperatureMar);
  String[] maxTempApr = subsetValues(data, "mm", "4", "tmax");
  maximumtemperatureApr = float(maxTempApr);
  maximumavg[3] = mean(maximumtemperatureApr);
  String[] maxTempMay = subsetValues(data, "mm", "5", "tmax");
  maximumtemperatureMay = float(maxTempMay);
  maximumavg[4] = mean(maximumtemperatureMay);
  String[] maxTempJun = subsetValues(data, "mm", "6", "tmax");
  maximumtemperatureJun = float(maxTempJun);
  maximumavg[5] = mean(maximumtemperatureJun);
  String[] maxTempJul = subsetValues(data, "mm", "7", "tmax");
  maximumtemperatureJul = float(maxTempJul);
  maximumavg[6]  = mean(maximumtemperatureJul);
  String[] maxTempAug = subsetValues(data, "mm", "8", "tmax");
  maximumtemperatureAug = float(maxTempAug);
  maximumavg[7] = mean(maximumtemperatureAug);
  String[] maxTempSept = subsetValues(data, "mm", "9", "tmax");
  maximumtemperatureSept = float(maxTempSept);
  maximumavg[8] = mean(maximumtemperatureSept);
  String[] maxTempOct = subsetValues(data, "mm", "10", "tmax");
  maximumtemperatureOct = float(maxTempOct);
  maximumavg[9] = mean(maximumtemperatureOct);
  String[] maxTempNov = subsetValues(data, "mm", "11", "tmax");
  maximumtemperatureNov = float(maxTempNov);
  maximumavg[10] = mean(maximumtemperatureNov);
  String[] maxTempDec = subsetValues(data, "mm", "12", "tmax");
  maximumtemperatureDec = float(maxTempDec);
  maximumavg[11] = mean(maximumtemperatureDec);
  
  String[] minTempJan = subsetValues(data, "mm", "1", "tmin");
  minJan = float(minTempJan);
  minimumavg[0] = mean(minJan);
  String[] minTempFeb = subsetValues(data, "mm", "2", "tmin");
  minFeb = float(minTempFeb);
  minimumavg[1] = mean(minFeb);
  String[] minTempMar = subsetValues(data, "mm", "3", "tmin");
  minMar = float(minTempMar);
  minimumavg[2] = mean(minMar);
  String[] minTempApr = subsetValues(data, "mm", "4", "tmin");
  minApr = float(minTempApr);
  minimumavg[3] = mean(minApr);
  String[] minTempMay = subsetValues(data, "mm", "5", "tmin");
  minMay = float(minTempMay);
  minimumavg[4] = mean(minMay);
  String[] minTempJun = subsetValues(data, "mm", "6", "tmin");
  minJun = float(minTempJun);
  minimumavg[5] = mean(minJun);
  String[] minTempJul = subsetValues(data, "mm", "7", "tmin");
  minJul = float(minTempJul);
  minimumavg[6] = mean(minJul);
  String[] minTempAug = subsetValues(data, "mm", "8", "tmin");
  minAug = float(minTempAug);
  minimumavg[7] = mean(minAug);
  String[] minTempSept = subsetValues(data, "mm", "9", "tmin");
  minSept = float(minTempSept);
  minimumavg[8] = mean(minSept);
  String[] minTempOct = subsetValues(data, "mm", "10", "tmin");
  minOct = float(minTempOct);
  minimumavg[9] = mean(minOct);
  String[] minTempNov = subsetValues(data, "mm", "11", "tmin");
  minNov = float(minTempNov);
  minimumavg[10] = mean(minNov);
  String[] minTempDec = subsetValues(data, "mm", "12", "tmin");
  minDec = float(minTempDec);
  minimumavg[11] = mean(minDec);

 
  String[] rainfallJan = subsetValues(data, "mm", "1", "rain");
  rainJan = float(rainfallJan);
  rainavg[0] = mean(rainJan);
  String[] rainfallFeb = subsetValues(data, "mm", "2", "rain");
  rainFeb = float(rainfallFeb);
  rainavg[1] = mean(rainFeb);
  String[] rainfallMar = subsetValues(data, "mm", "3", "rain");
  rainMar = float(rainfallMar);
  rainavg[2] = mean(rainMar);
  String[] rainfallApr = subsetValues(data, "mm", "4", "rain");
  rainApr = float(rainfallApr);
  rainavg[3] = mean(rainApr);
  String[] rainfallMay = subsetValues(data, "mm", "5", "rain");
  rainMay = float(rainfallMay);
  rainavg[4] = mean(rainMay);
  String[] rainfallJun = subsetValues(data, "mm", "6", "rain");
  rainJun = float(rainfallJun);
  rainavg[5] = mean(rainJun);
  String[] rainfallJul = subsetValues(data, "mm", "7", "rain");
  rainJul = float(rainfallJul);
  rainavg[6] = mean(rainJul);
  String[] rainfallAug = subsetValues(data, "mm", "8", "rain");
  rainAug = float(rainfallAug);
  rainavg[7] = mean(rainAug);
  String[] rainfallSept = subsetValues(data, "mm", "9", "rain");
  rainSept = float(rainfallSept);
  rainavg[8] = mean(rainSept);
  String[] rainfallOct = subsetValues(data, "mm", "10", "rain");
  rainOct = float(rainfallOct);
  rainavg[9] = mean(rainOct);
  String[] rainfallNov = subsetValues(data, "mm", "11", "rain");
  rainNov = float(rainfallNov);
  rainavg[10] = mean(rainNov);
  String[] rainfallDec = subsetValues(data, "mm", "12", "rain");
  rainDec = float(rainfallDec);
  rainavg[11] = mean(rainDec);
 
}
  
void draw()
{
   
  stroke(255);
  strokeWeight(1);
  fill(128,156,211);
  rect(0,0,width,200);
  rect(0,200,width,200);
  rect(0,400,width,200);
  rect(0,600,width,30);
     
  fill(15, 34, 72);
  text("Average Maximum Temperature (°C)",50,20);
  text("Rainfall (mm)",50,220);
  text("Average Minimum Temperature(°C)",50,420);
  text("Jan", 10, 620);
  text("Feb", 76, 620);
  text("Mar", 142, 620);
  text("April", 208, 620);
  text("May", 274, 620);
  text("June", 340, 620);
  text("July", 406, 620);
  text("Aug", 472, 620);
  text("Sept", 538, 620);
  text("Oct", 604, 620);
  text("Nov", 670, 620);
  text("Dec", 736, 620);
  
   
  int space = width/12;
   
  for(int i = 0; i < rainavg.length; i++)
  {
    rect(10+(i*space),400-rainavg[i]*1.5,6,6);
    text(round(rainavg[i]),20+(i*space),400-rainavg[i]*1.5);
  }
  
  for(int i = 0; i < minimumavg.length; i++)
  {
    rect(10+(i*space),600-minimumavg[i]*10,6,6);
    text(round(minimumavg[i]),20+(i*space),600-minimumavg[i]*10);
  }
  
  for(int i = 0; i < maximumavg.length; i++)
  {
    rect(10+(i*space),200-maximumavg[i]*6,6,6);
    text(round(maximumavg[i]),20+(i*space),200-maximumavg[i]*6);
  }

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
 
 
float sum(float data[])
{
  float S = 0;
  for(float v : data) S += v;
  return S;
}
  
float[] distance(float data[], float m)
{
  float distance[] = new float[data.length];
  for(int i = 0; i < data.length; i++)
  {
    distance[i] = abs(data[i]-m);
  }
  return distance;
}
  
  
float[] sq(float data[])
{
  float x[] = new float[data.length];
  for(int i = 0; i < data.length; i++)
  {
    x[i] = sq(data[i]);
  }
  return x;
}
  
float mean(float data[])
{
  return sum(data) / data.length;
}
  
float stddev(float data[])
{
  return sqrt(variance(data));
}
  
float variance(float data[])
{
  return mean(sq(distance(data,mean(data))));
}
Table loadClimateData(String[] raw)
{
  Table climate = new Table();
  String head[] = splitTokens(raw[5]);
  for (String h : head) climate.addColumn(h);
  raw = subset(raw, 7);
  for (String r : raw )
  {
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



