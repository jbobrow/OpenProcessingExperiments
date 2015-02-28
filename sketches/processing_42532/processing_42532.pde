
int rockCount;

void setup(){
  size(500,500);
  noLoop();
}


String fixString(String Input) {
  if(Input.length() == 0)
    return "";
  
  Input = Input.toLowerCase();
  
  int startIndex = 0;
  int endIndex   = Input.length()-1;
  
  boolean sSearch = true;
  boolean eSearch = true;
  while(sSearch && eSearch) {
    if(Input.charAt(startIndex) >= 97 && Input.charAt(startIndex) <= 122) {
      sSearch = false;
    }
    else {
      startIndex++;
      if(startIndex >= endIndex)
        return "";
    }
    if(Input.charAt(endIndex) >= 97 && Input.charAt(endIndex) <= 122) {
      eSearch = false;
    }
    else {
      endIndex--;
      if(endIndex <= startIndex)
        return "";
    }
  }
  return Input.substring(startIndex,endIndex+1);
}

 
  void draw() {
    String[] lines = loadStrings("/Users/rose/Downloads/pg1321.txt");
    for(int i = 0; i < lines.length; i++) {
      String[] currentLine = lines[i].split(" ");
      for( int j = 0; j < currentLine.length; j++){
          println(currentLine[j]);
          if(fixString(currentLine[j]).equals("rock" ) == true){
            rockCount++;
          }
      }
    }
    
    println (rockCount);
  }

