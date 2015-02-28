
Table loadRainfallData()

{

String raw[] = loadStrings("durhamdata.txt");

Table climate  = new Table();

String head[] = splitTokens(raw[5]);

for (String h : head) 

climate.addColumn(h);

raw = subset(raw, 7);

for (String r : raw )

{

TableRow row = climate.addRow();

String data[] = splitTokens(r, "#* ");

for ( int c=0 ;  c<head.length ;  c++)

row.setString(head[c], data[c]);

}

return climate;

}

Table weather; 

float[]tempMin = new float[15];

float[]tempAverage = new float[15];

void setup()

{

size(600, 600);

background(255);

fill(0,0,0);

weather= loadRainfallData();

int count = 0;

for (int i = 1; i < weather.getRowCount(); i++)

{

TableRow r = weather.getRow(i);

int month = r.getInt("mm");

float Tmin = r.getFloat("tmin");

if (tempMin[month - 1] > Tmin || i < 12)

tempMin[month - 1] = Tmin;

float Tmax = r.getFloat("tmax");

if (Tmax > -1000 && Tmin> -1000)

tempAverage[month - 1] += Tmax + Tmin;

count++;

}

count /= 6;

for (int i = 0; i < 12; i++)

tempAverage[i] /= count;

for (int i = 0; i < 12; i++)

{

text(tempMin[i], 50, (i * 15) + 15); 

text(tempAverage[i], 50, (i * 15) + 405); 

}

line (100, 150, 430, 150);

line (100, 540, 430, 540);

text("Minimum", 250, 15);

text("Average", 250, 405);

for (int i = 0; i < 11; i++)

{

line((30 * i) + 110 , 150 - (tempMin[i] * 4), (30 * i) + 130, 150 - (tempMin[i + 1] * 4));

line((30 * i) + 110 , 540 - (tempAverage[i] * 4), (30 * i) + 130, 540 - (tempAverage[i + 1] * 4));

}

}

 



