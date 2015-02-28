
String[] Months = {"Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"};
float[] AvgRain = new float[12];
float[] AvgMin = new float[12];
float[] AvgMax = new float[12];

float[] JanRain,FebRain,MarRain,AprRain,MayRain,JunRain,JulRain,AugRain,SeptRain,OctRain,NovRain,DecRain;
float AvgJanRain,AvgFebRain,AvgMarRain,AvgAprRain,AvgMayRain,AvgJunRain,AvgJulRain,AvgAugRain,AvgSeptRain,AvgOctRain,AvgNovRain,AvgDecRain;

float[] JanMin,FebMin,MarMin,AprMin,MayMin,JunMin,JulMin,AugMin,SeptMin,OctMin,NovMin,DecMin;
float AvgJanMin,AvgFebMin,AvgMarMin,AvgAprMin,AvgMayMin,AvgJunMin,AvgJulMin,AvgAugMin,AvgSeptMin,AvgOctMin,AvgNovMin,AvgDecMin;

float[] JanMax,FebMax,MarMax,AprMax,MayMax,JunMax,JulMax,AugMax,SeptMax,OctMax,NovMax,DecMax;
float AvgJanMax,AvgFebMax,AvgMarMax,AvgAprMax,AvgMayMax,AvgJunMax,AvgJulMax,AvgAugMax,AvgSeptMax,AvgOctMax,AvgNovMax,AvgDecMax;
 
void setup()
{
 size(950,950);

 println(City);
 
 String[] source = loadStrings(City);
 Table data = loadClimateData(source);
 
  String[] RainJan = subsetValues(data, "mm", "1", "rain");
  JanRain = float(RainJan);
  AvgJanRain = mean(JanRain);
   
  String[] RainFeb = subsetValues(data, "mm", "2", "rain");
  FebRain = float(RainFeb);
  AvgFebRain = mean(FebRain);
   

  String[] RainMar = subsetValues(data, "mm", "3", "rain");
  MarRain = float(RainMar);
  AvgMarRain = mean(MarRain);
  

  String[] RainApr = subsetValues(data, "mm", "4", "rain");
  AprRain = float(RainApr);
  AvgAprRain = mean(AprRain);
   

  String[] RainMay = subsetValues(data, "mm", "5", "rain");
  MayRain = float(RainMay);
  AvgMayRain = mean(MayRain);

  String[] RainJun = subsetValues(data, "mm", "6", "rain");
  JunRain = float(RainJun);
  AvgJunRain = mean(JunRain);
   
 
  String[] RainJul = subsetValues(data, "mm", "7", "rain");
  JulRain = float(RainJul);
  AvgJulRain = mean(JulRain);
   

  String[] RainAug = subsetValues(data, "mm", "8", "rain");
  AugRain = float(RainAug);
  AvgAugRain = mean(AugRain);
   
  
  String[] RainSept = subsetValues(data, "mm", "9", "rain");
  SeptRain = float(RainSept);
  AvgSeptRain = mean(SeptRain);
   

  String[] RainOct = subsetValues(data, "mm", "10", "rain");
  OctRain = float(RainOct);
  AvgOctRain = mean(OctRain);
   
  String[] RainNov = subsetValues(data, "mm", "11", "rain");
  NovRain = float(RainNov);
  AvgNovRain = mean(NovRain);
   
  String[] RainDec = subsetValues(data, "mm", "12", "rain");
  DecRain = float(RainDec);
  AvgDecRain = mean(DecRain);

  String[] MinJan = subsetValues(data, "mm", "1", "tmin");
  JanMin = float(MinJan);
  AvgJanMin = mean(JanMin);
   

  String[] MinFeb = subsetValues(data, "mm", "2", "tmin");
  FebMin = float(MinFeb);
  AvgFebMin = mean(FebMin);
   

  String[] MinMar = subsetValues(data, "mm", "3", "tmin");
  MarMin = float(MinMar);
  AvgMarMin = mean(MarMin);
   

  String[] MinApr = subsetValues(data, "mm", "4", "tmin");
  AprMin = float(MinApr);
  AvgAprMin = mean(AprMin);
   

  String[] MinMay = subsetValues(data, "mm", "5", "tmin");
  MayMin = float(MinMay);
  AvgMayMin = mean(MayMin);
   

  String[] MinJun = subsetValues(data, "mm", "6", "tmin");
  JunMin = float(MinJun);
  AvgJunMin = mean(JunMin);
   

  String[] MinJul = subsetValues(data, "mm", "7", "tmin");
  JulMin = float(MinJul);
  AvgJulMin = mean(JulMin);
   

  String[] MinAug = subsetValues(data, "mm", "8", "tmin");
  AugMin = float(MinAug);
  AvgAugMin = mean(AugMin);
   

  String[] MinSept = subsetValues(data, "mm", "9", "tmin");
  SeptMin = float(MinSept);
  AvgSeptMin = mean(SeptMin);
   

  String[] MinOct = subsetValues(data, "mm", "10", "tmin");
  OctMin = float(MinOct);
  AvgOctMin = mean(OctMin);
   

  String[] MinNov = subsetValues(data, "mm", "11", "tmin");
  NovMin = float(MinNov);
  AvgNovMin = mean(NovMin);
   

  String[] MinDec = subsetValues(data, "mm", "12", "tmin");
  DecMin = float(MinDec);
  AvgDecMin = mean(DecMin);
  
 
  String[] MaxJan = subsetValues(data, "mm", "1", "tmax");
  JanMax = float(MaxJan);
  AvgJanMax = mean(JanMax);
   

  String[] MaxFeb = subsetValues(data, "mm", "2", "tmax");
  FebMax = float(MaxFeb);
  AvgFebMax = mean(FebMax);
   

  String[] MaxMar = subsetValues(data, "mm", "3", "tmax");
  MarMax = float(MaxMar);
  AvgMarMax = mean(MarMax);
   

  String[] MaxApr = subsetValues(data, "mm", "4", "tmax");
  AprMax = float(MaxApr);
  AvgAprMax = mean(AprMax);
   

  String[] MaxMay = subsetValues(data, "mm", "5", "tmax");
  MayMax = float(MaxMay);
  AvgMayMax = mean(MayMax);
   

  String[] MaxJun = subsetValues(data, "mm", "6", "tmax");
  JunMax = float(MaxJun);
  AvgJunMax = mean(JunMax);
   

  String[] MaxJul = subsetValues(data, "mm", "7", "tmax");
  JulMax = float(MaxJul);
  AvgJulMax = mean(JulMax);
   

  String[] MaxAug = subsetValues(data, "mm", "8", "tmax");
  AugMax = float(MaxAug);
  AvgAugMax = mean(AugMax);
   

  String[] MaxSept = subsetValues(data, "mm", "9", "tmax");
  SeptMax = float(MaxSept);
  AvgSeptMax = mean(SeptMax);
   

  String[] MaxOct = subsetValues(data, "mm", "10", "tmax");
  OctMax = float(MaxOct);
  AvgOctMax = mean(OctMax);
   

  String[] MaxNov = subsetValues(data, "mm", "11", "tmax");
  NovMax = float(MaxNov);
  AvgNovMax = mean(NovMax);
   

  String[] MaxDec = subsetValues(data, "mm", "12", "tmax");
  DecMax = float(MaxDec);
  AvgDecMax = mean(DecMax);
   
  AvgRain[0] = AvgJanRain;
  AvgRain[1] = AvgFebRain;
  AvgRain[2] = AvgMarRain;
  AvgRain[3] = AvgAprRain;
  AvgRain[4] = AvgMayRain;
  AvgRain[5] = AvgJunRain;
  AvgRain[6] = AvgJulRain;
  AvgRain[7] = AvgAugRain;
  AvgRain[8] = AvgSeptRain;
  AvgRain[9] = AvgOctRain;
  AvgRain[10] = AvgNovRain;
  AvgRain[11] = AvgDecRain;

   
  AvgMin[0] = AvgJanMin;
  AvgMin[1] = AvgFebMin;
  AvgMin[2] = AvgMarMin;
  AvgMin[3] = AvgAprMin;
  AvgMin[4] = AvgMayMin;
  AvgMin[5] = AvgJunMin;
  AvgMin[6] = AvgJulMin;
  AvgMin[7] = AvgAugMin;
  AvgMin[8] = AvgSeptMin;
  AvgMin[9] = AvgOctMin;
  AvgMin[10] = AvgNovMin;
  AvgMin[11] = AvgDecMin;
   
  AvgMax[0] = AvgJanMax;
  AvgMax[1] = AvgFebMax;
  AvgMax[2] = AvgMarMax;
  AvgMax[3] = AvgAprMax;
  AvgMax[4] = AvgMayMax;
  AvgMax[5] = AvgJunMax;
  AvgMax[6] = AvgJulMax;
  AvgMax[7] = AvgAugMax;
  AvgMax[8] = AvgSeptMax;
  AvgMax[9] = AvgOctMax;
  AvgMax[10] = AvgNovMax;
  AvgMax[11] = AvgDecMax;
}
 
void draw()
{
  background(230,230,230);
  
  stroke(100);
  strokeWeight(5);
  fill(0);
  for(int i = 0; i < Months.length; i++)
  {
    text(Months[i],10+(i*70),930);
  }
  
  rect(0,300,width,0,200);
  rect(0,605,width,0,200);
  rect(0,910,width,0,200);
  
  fill(230);
  rect(810,0,200,30);
  rect(810,300,200,30);
  rect(810,605,200,30);
  
  fill(0);
  text("Average Rainfall",830,20);
  text("Average Min Temp",830,320);
  text("Average Max Temp",830,620);
  

  for(int i = 0; i < AvgRain.length; i++)
  {
    pushMatrix();
    translate(15+i*70,300-AvgRain[i]*2);
    rect(-2,0,5,4);
    text(AvgRain[i],5,0);
    popMatrix();
  }

  for(int i = 0; i < AvgMin.length; i++)
  {
    pushMatrix();
    translate(15+i*70,600-AvgMin[i]*8);
    rect(-2,0,5,4);
    text(AvgMin[i],5,0);
    popMatrix();
  }

  for(int i = 0; i < AvgMax.length; i++)
  {
    pushMatrix();
    translate(15+i*70,900-AvgMax[i]*8);
    rect(-2,0,5,4);
    text(AvgMax[i],5,0);
    popMatrix();
  }

}

 
String City = Cityofchoice("bradford");
 
String Cityofchoice(String city)
{
  return "http://www.metoffice.gov.uk/"+
    "pub/data/weather/uk/climate/stationdata/"+
    city.toLowerCase()+
    "data.txt";
}

String[] citylist = {
  "aberporth", "armagh", "ballypatrick", "bradford", "braemar", "camborne", "cambridge", "cardiff", "chivenor", "cwmystwyth", "dunstaffnage", "durham", "eastbourne", "eskdalemuir", "heathrow", "hurn", "lerwick", "leuchars", "lowestoft", "manston", "nairn", "newtonrigg", "oxford", "paisley", "ringway", "rossonwye", "shawbury", "sheffield", "southampton", "stornoway", "suttonbonington", "tiree", "valley", "waddington", "whitby", "wickairport", "yeovilton"
};
 
float sum(float data[])
{
  float h = 0;
  for(float v : data) h+= v;
  return h;
}

float mean(float data[])
{
  return sum(data)/data.length;
}


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


