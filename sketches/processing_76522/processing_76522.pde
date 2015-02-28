
class Arranger {
  /**
   readFile(String)
   Reads the file and puts the words in an array.
   */
  public String[] readFile(String file) {
    BufferedReader reader = createReader(file);
    String line;
    String[] words;
    try {
      line = reader.readLine();
    }
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line != null) {
      words = split(line, ",");
    } 
    else {
      return null;
    }
    return words;
  }
}

