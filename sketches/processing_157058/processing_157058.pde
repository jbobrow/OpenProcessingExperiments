
//Declaring arrays
//Initializing with a size 0
//Because we don' know yet how many elements we're gonna load
String[] lastNames = new String[0];
String[] firstNames = new String[0];
int[] commits = new int[0];





Table teachers;

void setup(){
  size(800, 500);
  colorMode(HSB, 300 );
  //Loading the data from my tsv file  
  Table teachers = loadTable("code_teachers_commits.tsv", "header");
  
  //Looping through the table's lines
  for(int i = 0; i < teachers.getRowCount(); i++){
    
    //For each line, create a TableRow object
    TableRow myRow = teachers.getRow(i);
    
    //Appending each one of the columns to one of our arrays
    lastNames = append(lastNames, myRow.getString("lastName"));
    firstNames = append(firstNames, myRow.getString("firstName"));
    commits = append(commits, myRow.getInt("commits"));

  }
}

void draw(){
  background(200);
  
  textAlign(RIGHT, CENTER);
  for(int i = 0; i < lastNames.length; i++){
    //rotate(commits[i]);
    fill(commits[i]+40, 200+ frameCount, 200+commits[i]*10);
    translate(20, 30);
    ellipse(50, 50*i, 200, 100);
    text(firstNames[i] + " " + lastNames[i], 600, i * 50+30);
    
    fill(i*10, commits[i]*10, 205);
  println(commits[i]);
  }
}


