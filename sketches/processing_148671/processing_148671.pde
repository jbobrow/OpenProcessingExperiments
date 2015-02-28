
Table data;
void setup(){
size(800, 650);   // Set Size
data = getData(); // Load data
}
void draw(){
drawMinTemp(15);
drawMaxTemp(230);
drawAvgRainfall(430);
}
void drawMinTemp(Integer y){
text("Average Minimum Temperature in Degrees Celsius", 15, y);
 // Get all rows for min Temp
for (int i=1; i<13; i++){
float[] monthData = new float[0];
String month = Integer.toString(i);
for (TableRow row : table.findRows(month, "month")){
monthData = append(monthData, row.getFloat("mintemp"));
}
rect(300, (i * 15) + 5 + y, 0 + calculateAvg(monthData) * 10, 10);
text(getMonth(i) + " / " + calculateAvg(monthData), 520, (i * 15) + 14 + y);
}
}
void drawMaxTemp(int y){
text("Average Maximum Temperature in Degrees Celsius", 15, y);
// Get all rows for min Temp
for (int i=1; i<13; i++){
float[] monthData = new float[0];
String month = Integer.toString(i);
for (TableRow row : table.findRows(month, "month")){
monthData = append(monthData, row.getFloat("maxtemp"));
}
rect(300, (i * 15) + 5 + y, 0 + calculateAvg(monthData) * 10, 10);
text(getMonth(i) + " / " + calculateAvg(monthData), 520, (i * 15) + 14 + y);
}
}
void drawAvgRainfall(int y){
text("Average Rainfall in mm", 15, y);
// Get all rows for min Temp
for (int i=1; i<13; i++){
float[] monthData = new float[0];
String month = Integer.toString(i);
for (TableRow row : table.findRows(month, "month")){
monthData = append(monthData, row.getFloat("totalRain"));
}
rect(300, (i * 15) + 5 + y, 0 + calculateAvg(monthData) * 10, 10);
text(getMonth(i) + " / " + calculateAvg(monthData), 520, (i * 15) + 14 + y);
}
}
/* File responsible for data processing.*/
// Fields / Props
Table table;
String url = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/durhamdata.txt";
// Function to return datatable.
Table getData(){
table = new Table();
setupTable(table);
return table;
}
/** Adds columns to provided table and loads data.
* 
*  @param table   Table
*  @return - table object
*/
private Table setupTable(Table table){
// Add columns.
table.addColumn("year");
table.addColumn("month");
table.addColumn("maxtemp");   //degrees celcuis
table.addColumn("mintemp");   // degrees celcuis
table.addColumn("totalRain"); // mm
// Retrieve raw data from text file.
String[] rawData = loadStrings(url);
// Skip headings by creating subset from the String array.
rawData = subset(rawData, 7);
// Loop through lines.
for(String ln:rawData){
//Seperate columns from line.
String[] cols = splitTokens(ln, "* ");
//Create new table row and populate with cols array.
TableRow row = table.addRow();
row.setInt("year", int(cols[0]));
row.setInt("month", int(cols[1]));
row.setFloat("maxtemp", float(cols[2].equals("---")?"0":cols[2]));
row.setFloat("mintemp", float(cols[3].equals("---")?"0":cols[3]));
row.setFloat("totalRain", float(cols[4].equals("---")?"0":cols[4]));
}
return table;
}
float calculateAvg(float[] vals){
Integer counter = 0;
float total = 0;
for(float val:vals){
counter++;
total = total + val;
}
return total/counter;
}
String getMonth(int num){
String monthText = new String();
switch(num){
case 1:
monthText = "Jan";
break;
case 2:
monthText = "Feb";
break;
case 3:
monthText = "Mar";
break;
case 4:
monthText = "Apr";
break;
case 5:
monthText = "May";
break;
case 6:
monthText = "Jun";
break;
case 7:
monthText = "Jul";
break;
case 8:
monthText = "Aug";
break;
case 9:
monthText = "Sep";
break;
case 10:
monthText = "Oct";
break;
case 11:
monthText = "Nov";
break;
case 12:
monthText = "Dec";
break;
}
return monthText;
}


