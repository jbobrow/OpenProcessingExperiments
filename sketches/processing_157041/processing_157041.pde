
String[] NamesArray = new String[0];
int[] letterArray = new int[0];

void setup(){
  size(500, 500);

  //Loading the data from my tsv file  
  Table number = loadTable("name.tsv", "header");
  
  //Looping through the table's lines
  for(int i = 0; i < number.getRowCount(); i++){
    
    //For each line, create a TableRow object
    TableRow myRow = number.getRow(i);

    //Appending each one of the columns to one of our arrays
    NamesArray = append(NamesArray, myRow.getString("name"));
    letterArray = append(letterArray, myRow.getInt("letter"));
  }
}

void draw(){
  background(0);
  textAlign(LEFT, TOP);
  for(int i = 0; i < NamesArray.length; i++){
    println(letterArray[i]);
    stroke(random(50), random(200), random(255));
    if(mousePressed){
    line(random(width), random(height), mouseX, mouseY);}
  }

}


