
//Declaring arrays
//Initializing with a size 0
//Because we don' know yet how many elements we're gonna load
String[] lastNames = new String[0];
String[] firstNames = new String[0];
String[] email = new String[0];
int[] blogPosts = new int[0];
int[] ids = new int[0];
float rotation;
float rotationIncrement;

void setup(){
  size(1000, 1000);
//  colorMode(HSB);

  //Loading the data from my tsv file  
//  Table teachers = loadTable("code_teachers_commits.tsv", "header");
  Table dragons = loadTable("chinatown_dragons.tsv", "header");
  
  rotation = 0;
  rotationIncrement = .005;  
  //Looping through the table's lines
  for(int i = 0; i < dragons.getRowCount(); i++){
    
    //For each line, create a TableRow object
    TableRow myRow = dragons.getRow(i);
    
    //Appending each one of the columns to one of our arrays
    lastNames = append(lastNames, myRow.getString("lastName"));
    firstNames = append(firstNames, myRow.getString("firstName"));
    email = append(email, myRow.getString("email"));
    blogPosts = append(blogPosts, myRow.getInt("blogPosts"));
    ids = append(ids, myRow.getInt("id"));
    
  }
  
}

void draw(){
  background(0);
  textAlign(LEFT);
  
  translate(width/2, height/2);
//  float angle = 360/(lastNames.length + rotation);
  float angle = 360/(lastNames.length);
  angle += rotation;
  for(int i = 0; i < lastNames.length; i++){
//    pushMatrix();
    float bright = map(ids[i], 0, 999, 0, 255);
    float saturation = map(blogPosts[i], 0, 12, 0, 255);
    fill  (ids[i], saturation, bright);
    rotate(angle + (blogPosts[i] * .05));
    
    textSize(blogPosts[i]*4);
    text(firstNames[i] + " " + lastNames[i], blogPosts[i] * 10, -10);
    rect(0, 0, ids[i], blogPosts[i]);
//    popMatrix();
  }
  rotation += rotationIncrement; 
}


